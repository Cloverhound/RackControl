class Cisco < ApplicationRecord
  def self.ping(host)
    begin
      Timeout.timeout(5) do
        s = TCPSocket.new(host, 'echo')
        s.close
        return true
      end
    rescue Errno::ECONNREFUSED
      return true
    rescue Timeout::Error, Errno::ENETUNREACH, Errno::EHOSTUNREACH
      return false
    end
  end

  def self.revert(device,config_name)
    if device.transport_type == "telnet"
      require 'net/telnet'
      localhost = Net::Telnet::new("Host" => device.ip_address,
        "Timeout" => 30,
        "Waittime" => 0.2,
        "Prompt" => /Username:/)
      localhost.cmd("String" => device.username, "Prompt" => "Password:") { |c| print c }
      localhost.cmd("String" => device.password, "Match" => /#/) { |c| print c }
      localhost.cmd("String" => "term len 0", "Match" => /#/) { |c| print c }
      localhost.cmd("String" =>  'copy start flash:' + config_name, "Match" => /#/){ |c| print c }
      localhost.cmd("String" =>  'reload', "Match" => /YES/){ |c| print c }
      return localhost.cmd("String" =>  'Y', "Match" => /#/){ |c| print c }
      localhost.close
    elsif device.transport_type == "ssh"
      begin
      require 'net/ssh'
      if ping(device.ip_address)
      session = Net::SSH.start(device.ip_address,device.username,:password => device.password)
        t = Net::SSH::Telnet.new("Session" => session, "Timeout" => 10, "Waittime" => 0.2,"Prompt" => />/)
        puts t
        stuff = t.cmd("String" => 'en', "Match" => /:/) { |c| print c }
        stuff = t.cmd("String" => device.enable_password, "Match" => /#/) { |c| print c }
        stuff = t.cmd("String" => 'copy start flash:' + config_name, "Match" => /]/) { |c| print c }
        stuff = t.cmd("String" => 'Y', "Match" => /]/) { |c| print c }
        stuff = t.cmd("String" => 'Y', "Match" => /#/) { |c| print c }
        stuff = t.cmd("String" => 'reload', "Match" => /]/) { |c| print c }
        stuff = t.cmd("String" => 'Y') { |c| print c }
        return stuff
      else
        return device.name + ' offline'
      end
      rescue IOError
        return device.name + ' restoring'
      end
    end
  end
end

require 'net-ldap'

module SimpleADAuth
  class Connection
    def initialize(config, username, password)
      @config = config
      @username = username
      @password = password
    end

    def bind
      conn = Net::LDAP.new(
        :host => @config.host,
        :port => @config.port,
        :base => @config.search_root,
      )
      begin
        conn.auth bind_name, @password
      rescue RuntimeError
        return false
      end


      begin
        ::Timeout::timeout(10){
          if conn.bind
            return conn
          else
            raise SimpleADAuth::InvalidCredentials
          end
        }
      rescue ::Timeout::Error
        raise SimpleADAuth::Timeout
      rescue Errno::ECONNRESET
        return Adauth::Connection.new(@config).bind
      end
    end

    def bind_name
      "#{@username}@#{@config.domain}"
    end
  end
end

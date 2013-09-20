require 'simple_ad_auth/config'
require 'simple_ad_auth/connection'

module SimpleADAuth
  class InvalidCredentials < Exception
  end

  class Timeout < ::Timeout::Error
  end

  def self.configure
    @connection = nil
    @config = Config.new
    yield @config
  end

  def self.authenticate(username, password)
    begin
      conn = Connection.new(@config, username, password).bind
    rescue InvalidCredentials
      return false
    end
    entry = conn.search(
      :base => @config.search_root,
      :filter => Net::LDAP::Filter.eq('sAMAccountName', username)
    )[0]
    groups = entry[:memberof].map { |e| e.split(',')[0].split('=')[1] }
    {'groups' => groups}
  end

end

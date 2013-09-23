require 'simple_ad_auth/config'
require 'simple_ad_auth/connection'
require 'simple_ad_auth/user'

# This is where the magic happens
module SimpleADAuth
  class InvalidCredentials < Exception
  end

  class Timeout < ::Timeout::Error
  end

  @config = nil

  def self.configure
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
    return User.new(entry)
  end

end

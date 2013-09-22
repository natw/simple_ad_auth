require 'ostruct'
require 'spec_helper'

describe SimpleADAuth::Connection do
  describe '.bind' do
    it "binds with the configured credentials" do
      config = OpenStruct.new(:host => 'host', :port => 'port', :search_root => "root")
      conn = SimpleADAuth::Connection.new(config, 'user', 'pass')

      ldap_conn = double()
      ldap_conn.should receive(:auth)
      ldap_conn.should receive(:bind) { true }
      Net::LDAP.should receive(:new).with(:host => 'host', :port => 'port', :base => 'root') { ldap_conn }
      conn.bind.should == ldap_conn
    end
  end
end

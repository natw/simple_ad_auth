require 'spec_helper'

describe SimpleADAuth do
  describe "#configure" do
    it "yields to a config object" do
      expect { |b| SimpleADAuth.configure(&b) }.to yield_with_args(SimpleADAuth::Config)
    end
  end

  describe "#authenticate" do
    it "creates a new connection and searches" do
      SimpleADAuth.configure do |c|
        c.search_root = "root"
      end
      conn = double(:search => nil)
      conn.should receive(:search).with(
        :base => 'root',
        :filter => Net::LDAP::Filter.eq('sAMAccountName', 'foo')
      ) { [nil] }

      SimpleADAuth::Connection.should receive(:new).with(
        SimpleADAuth.instance_variable_get(:@config), 'foo', 'bar'
      ) { double(:bind => conn) }
      SimpleADAuth.authenticate('foo', 'bar')
    end

    it "returns false if the credentials are wrong" do
      SimpleADAuth::Connection.should receive(:new) { raise SimpleADAuth::InvalidCredentials }
      SimpleADAuth.authenticate('foo', 'bar').should == false
    end
  end
end

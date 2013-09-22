require 'spec_helper'

describe SimpleADAuth::User do
  describe ".groups" do
    it "returns just the group names" do
      u = SimpleADAuth::User.new({:memberof => ["OU=whatever, CN=I don't know how AD works",
                                                "BM=who,RN=cares"]})
      u.groups.should == ['whatever', 'who']
    end
  end
end

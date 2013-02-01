require 'spec_helper'

describe "Subdomain requests" do
  it "matches when on a subdomain" do
    get '/'
    last_response.status.should == 404
  end
end

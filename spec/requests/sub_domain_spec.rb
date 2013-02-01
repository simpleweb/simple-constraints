require 'spec_helper'

describe "Subdomain requests" do
  before do
    host! 'www.example.com'
  end

  it "matches when on a subdomain" do
    get '/test'
    response.status.should == 200
  end
end

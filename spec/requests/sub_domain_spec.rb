require 'spec_helper'

describe "Subdomain requests" do
  before do
    host! 'www.example.com'
  end

  it "matches when on a subdomain" do
    get '/test'
    expect(response.status).to eq 200
  end
end

require 'spec_helper'

describe Simpleweb::Constraints::SubDomain do
  subject { Simpleweb::Constraints::SubDomain.new(2) }
  let(:app) { ->(env) { [200, {}, ["Hello"]] } }
  let(:subdomain) { double(:present? => true) }
  let(:request) { double(subdomain: subdomain, subdomains: [subdomain]) }

  it "matches a request with a subdomain" do
    expect(subject.matches?(request)).to be_true
  end
end

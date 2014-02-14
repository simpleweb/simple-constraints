require 'spec_helper'

describe Simple::Constraints::IPAddress do
  let(:constraint) { Simple::Constraints::IPAddress.new(range) }
  let(:request) { double(remote_ip: remote_ip) }

  let(:range) { '81.187.116.0/26' }
  let(:remote_ip) { '81.187.116.14' }

  context "request within netmask" do
    it "should allow access" do
      expect(constraint.matches?(request)).to be_true
    end
  end

  context "request matching exact ip" do
    let(:range) { '81.187.116.14' }

    it "should allow access" do
      expect(constraint.matches?(request)).to be_true
    end
  end

  context "local request" do
    let(:constraint) { Simple::Constraints::IPAddress.new(range, allow_localhost: true) }

    context "ipv4" do
      let(:remote_ip) { '127.0.0.1' }

      it "should allow access" do
        expect(constraint.matches?(request)).to be_true
      end
    end

    context "ipv6" do
      let(:remote_ip) { '::1' }

      it "should allow access" do
        expect(constraint.matches?(request)).to be_true
      end
    end
  end

  context "request outside netmask" do
    let(:remote_ip) { '5.34.63.120' }

    it "should not allow access" do
      expect(constraint.matches?(request)).to be_false
    end
  end

  context "not matching exact ip" do
    let(:remote_ip) { '5.34.63.120' }
    let(:range) { '81.187.116.14' }

    it "should not allow access" do
      expect(constraint.matches?(request)).to be_false
    end
  end
end

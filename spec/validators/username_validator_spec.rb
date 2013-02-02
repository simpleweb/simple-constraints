require 'spec_helper'

describe Simpleweb::Validators::UsernameValidator do
  let(:user) { User.new }
  describe "valid username" do
    it "marks the record as valid" do
      user.username = "bob"
      expect(user).to be_valid
    end
  end

  describe "invalid username" do
    it "marks the record as invalid" do
      user.username = "bob@example.org"
      expect(user).to_not be_valid
    end
  end
end

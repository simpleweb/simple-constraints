require 'spec_helper'

describe Simpleweb::Validators::EmailValidator do
  let(:user) { User.new }
  describe "with an invalid email" do
    it "marks the record as invalid" do
      user.email = "invalid"
      expect(user).to_not be_valid
    end
  end

  describe "with a valid email" do
    it "does marks the record as valid" do
      user.email = "bob@example.org"
      expect(user).to be_valid
    end
  end
end

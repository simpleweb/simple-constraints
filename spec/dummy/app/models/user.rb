class User
  include ActiveModel::Validations
  include Simpleweb::Validators

  attr_accessor :email, :username

  validates :email, email: true
  validates :username, username: true
end

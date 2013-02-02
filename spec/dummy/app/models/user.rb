class User
  include ActiveModel::Validations
  include Simpleweb::Validators

  attr_accessor :email

  validates :email, email: true
end

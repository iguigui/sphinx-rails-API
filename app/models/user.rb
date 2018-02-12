class User
	include BCrypt

  include Mongoid::Document
  field :email, type: String
  field :password_hash, type: String

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end
end

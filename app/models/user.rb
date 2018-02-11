class User
  include Mongoid::Document
  field :email, type: String
  field :password, type: String

  # def self.unique(email)
  # 	found = User.find_by(email: email)
  # 	found.nil?
  # end
end

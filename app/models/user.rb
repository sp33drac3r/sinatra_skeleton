class User < ActiveRecord::Base
  # any associations and/or validations go here

  include BCrypt

  def password
    @password ||= Password.new(password_hash)
  end

  def self.authenticate(args)
    user = User.find_by(email: args['email'])
    user && user.password == args['password'] ? user : nil
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end
end

class User < Sequel::Model
  has_many :user_sessions

  def validate
    super

    validates_presence :name, message: I18n.t(:blank, scope: 'model.errors.user.name')
    validates_presence :email, message: I18n.t(:email, scope: 'model.errors.user.email')
    validates_presence :password_digest, message: I18n.t(:email, scope: 'model.errors.user.password_digest')
  end
end

class UserSession < Sequel::Model
  belongs_to :user

  def validate
    super

    validates_presence :uuid, message: I18n.t(:blank, scope: 'model.errors.user_session.uuid')
    validates_presence :user_id, message: I18n.t(:email, scope: 'model.errors.user_session.user_id')
  end
end

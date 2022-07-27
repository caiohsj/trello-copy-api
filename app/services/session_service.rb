class SessionService < BaseService
  steps :find_user,
        :verify_pass

  def call
    @user
  end

  def find_user
    @user = User.find_for_database_authentication(email: email)
    fail!(I18n.t('services.session.invalid_credentials')) unless @user.present?
  end

  def verify_pass
    fail(I18n.t('services.session.invalid_credentials')) unless @user.valid_password?(password)
  end
end

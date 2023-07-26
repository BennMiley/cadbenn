class AdminAuthorization < ActiveAdmin::AuthorizationAdapter
  def authorized?(action, subject = nil)
    return false unless user
    user.admin?
  end
end

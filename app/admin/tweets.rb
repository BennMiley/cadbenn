ActiveAdmin.register Tweet do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :user_id, :content
  #
  # or
  #
  # permit_params do
  #   permitted = [:user_id, :content]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  #this was needed due to a ransack bug that preventeed tweets being shown as it expected a votes for model, however, votes for doesnt need a model
 config.filters = false

end

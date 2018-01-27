Spree::Admin::UsersController.class_eval do
  private

  def user_params

    attributes = permitted_user_attributes
    if action_name == "create" || can?(:update_email, @user)
      attributes |= [:email]
    end
    if can? :manage, Spree::Role
      attributes += [{ spree_role_ids: [] }]
    end
    params.require(:user).permit(attributes |
                                 [spree_role_ids: [],
                                  vendor_ids: [],
                                  ship_address_attributes: permitted_address_attributes,
                                  bill_address_attributes: permitted_address_attributes])
  end
end

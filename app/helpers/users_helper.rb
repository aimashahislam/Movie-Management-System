module UsersHelper
  def set_user_avatar_URL(user)
    if user.avatar.present?
      user.try(:avatar).try(:url)
    else
      "/assets/user.png"
    end
  end
end

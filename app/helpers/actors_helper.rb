module ActorsHelper
  def set_actor_avatar_URL(actor)
    if actor.avatar.present?
      actor.try(:avatar).try(:url)
    else
      "/assets/user.png"
    end
  end
end

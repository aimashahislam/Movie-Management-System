module ActorsHelper
  def setActor(actor)
    if actor.avatar.present?
      actor.try(:avatar).try(:url)
    else
      "/assets/user.png"
    end
  end
end

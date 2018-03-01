class ActorSerializer < ActiveModel::Serializer
  attributes :id, :name, :bio, :date_of_birth, :avatar
end

class ReviewSerializer < ActiveModel::Serializer
  attributes :id, :rating, :comment, :reported
end

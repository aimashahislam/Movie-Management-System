class MovieSerializer < ActiveModel::Serializer
  attributes :id, :name, :genre, :duration, :description, :release_date, :director, :producer, :writer, :rating, :actors, :posters
end


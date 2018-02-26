module MoviesHelper
  def set_poster_avatar_URL(movie)
    if movie.posters.present?
      movie.posters.first.try(:avatar).try(:url)
    else
      "/assets/default.jpeg"
    end
  end
end

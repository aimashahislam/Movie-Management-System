module MoviesHelper
  def setPoster(movie)
    if movie.posters.present?
      movie.posters.first.try(:avatar).try(:url)
    else
      "/assets/default.jpeg"
    end
  end
end

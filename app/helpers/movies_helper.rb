module MoviesHelper
  def set_poster_avatar_URL(movie)
    if movie.posters.present?
      movie.posters.first.try(:avatar).try(:url)
    else
      "/assets/default.jpeg"
    end
  end

  def set_favourites_links(movie)
    @favourite = current_user.favourites.where(movie_id: movie).where(user_id: current_user.id)
    if @favourite.present?
      link_to 'Remove from favourites', remove_favourites_path(movie_id: movie), class: "btn btn-primary"
    else
      link_to 'Add to favourites', add_favourites_path(movie_id: movie), class: "btn btn-primary"
    end
  end
end

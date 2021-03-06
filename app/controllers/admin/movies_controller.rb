class Admin::MoviesController < Admin::BaseController
  before_action :set_movie, only: [:show, :edit, :update, :destroy]
  before_action :find_actors, only: [:new, :edit, :create, :update]

  def index
    #@movies = Movie.search(params[:search], with: {deleted_at: 0}, sql: {include: :posters}, page: params[:page], per_page: 10)
    @movies = Movie.includes(:posters).page(params[:page])
  end

  def show
    @reviews = @movie.reviews
  end

  def new
    @movie = Movie.new
  end

  def edit
  end

  def create
    @movie = Movie.new(movie_params)

    respond_to do |format|
      if @movie.save
        format.html { redirect_to movie_path(@movie), notice: 'Movie was successfully created.' }
        format.json { render :show, status: :created, location: @movie }
      else
        format.html { render :new }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @movie.update(movie_params)
        format.html { redirect_to movie_path(@movie), notice: 'Movie was successfully updated.' }
        format.json { render :show, status: :ok, location: @movie }
      else
        format.html { render :edit }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @movie.destroy
    respond_to do |format|
      format.html { redirect_to admin_movies_url, notice: 'Movie was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def set_movie
      @movie = Movie.find(params[:id])
    end

    def movie_params
      params.require(:movie).permit(:name, :genre, :duration, :description, :release_date, :trailer, :director, :producer, :writer, actor_ids: [], posters_attributes: [:id, :avatar])
    end
    
    def find_actors
      @actors = Actor.order(:name)
    end
end

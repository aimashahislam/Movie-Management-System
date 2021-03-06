class Admin::ActorsController < Admin::BaseController

  before_action :set_actor, only: [:show, :edit, :update, :destroy]

  def index
    #@actors = Actor.search(params[:search], with: {deleted_at: 0}, page: params[:page], per_page: 10)
    @actors = Actor.page(params[:page])
  end

  def show
  end

  def new
    @actor = Actor.new
  end

  def edit
  end

  def create
    @actor = Actor.new(actor_params)

    respond_to do |format|
      if @actor.save
        format.html { redirect_to actor_path(@actor), notice: 'Actor was successfully created.' }
        format.json { render :show, status: :created, location: @actor }
      else
        format.html { render :new }
        format.json { render json: @actor.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @actor.update(actor_params)
        format.html { redirect_to actor_path(@actor), notice: 'Actor was successfully updated.' }
        format.json { render :show, status: :ok, location: @actor }
      else
        format.html { render :edit }
        format.json { render json: @actor.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @actor.destroy
    respond_to do |format|
      format.html { redirect_to admin_actors_url, notice: 'Actor was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def set_actor
      @actor = Actor.find(params[:id])
    end

    def actor_params
      params.require(:actor).permit(:name, :bio, :date_of_birth, :avatar)
    end
end

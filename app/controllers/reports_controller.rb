class ReportsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :new, :edit, :update, :destroy]

  before_action :set_review, only: [:new, :create]

  def new
    @report = Report.new
  end

  def create
    @report = Report.new(report_params)
    @review.reported = true
    @review.save
    respond_to do |format|
      if @report.save
        format.html { redirect_to root_path, notice: 'Movie was successfully created.' }
        format.json { render :show, status: :created, location: @movie }
      else
        format.html { render :new }
        format.json { render json: @report.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def report_params
      params.require(:report).permit(:statement, :review_id)
    end

    def set_review
      @review = Review.find(params[:review_id])
    end
end

class ReportsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :new, :edit, :update, :destroy]

  before_action :set_review, only: [:new, :create]
  before_action :check_admin, only: [:index, :destroy]

  def index
    @reports = Report.all
  end

  def new
    @report = Report.new
  end

  def create
    @report = Report.new(report_params)
    @review.reported = true
    @review.save
    respond_to do |format|
      if @report.save
        format.html { redirect_to root_path, notice: 'Report was successfully created.' }
        format.json { render :show, status: :created, location: @movie }
      else
        format.html { render :new }
        format.json { render json: @report.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @report = Report.find(params[:id])
    @review = Review.find(@report.review_id)
    @report.destroy
    @review.reported = false
    @review.save
    respond_to do |format|
      format.html { redirect_to reports_path, notice: 'Report was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def report_params
      params.require(:report).permit(:statement, :review_id)
    end

    def set_review
      @review = Review.find(params[:review_id])
    end

    def check_admin
      redirect_to root_path unless current_user.admin == true
    end
end

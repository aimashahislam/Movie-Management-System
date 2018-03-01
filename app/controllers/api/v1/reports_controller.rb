class Api::V1::ReportsController < Api::V1::BaseController

  def index
    reports = Report.preload(:review)
    render json: reports
  end

  def show
    @report = Report.find(params[:id])
    render json: @report
    rescue
      render json: { error: 'Record not found.' }, status: 404
  end
end

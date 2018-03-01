class Api::V1::ReportsController < Api::V1::BaseController

  def index
    reports = Report.preload(:review)
    render json: reports, adapter: :json
  end

  def show
    @report = Report.find(params[:id])
    render json: @report, adapter: :json
  end
end

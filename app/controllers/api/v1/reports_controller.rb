class Api::V1::ReportsController < Api::V1::BaseController

  def index
    reports = Report.preload(:review)
    render json: reports, adapter: :json
  end

  def show
    @report = Report.find_by_id(params[:id])
    if @report.present?
      render json: @report
    else
      render json: { error: 'Record not found.' }, status: 404
    end
  end
end

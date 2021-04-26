class CheckinsController < ApplicationController

  skip_before_action :verify_authenticity_token

  # GET /drivers/:driver_id/checkins
  def index
    @driver = Driver.find_by_sql(["SELECT d.* FROM drivers d WHERE d.id = :id", id: params[:driver_id]])
    render :checkin
  end

  # POST /drivers/:driver_id/checkins
  def create
    @checkin = Checkin.new(checkin_params)
    if @checkin.save
      sum_weekly_hours
      render :total
    else
      render html: 'Unable to checkin.', status: 400
    end
  end

  private

  def checkin_params
    params.require(:checkin).permit(:hours, :driver_id)
  end

  def sum_weekly_hours
    @driver = Checkin.find_by_sql(
      ["SELECT d.name, d.id FROM checkins c INNER JOIN drivers d ON c.driver_id = d.id WHERE c.driver_id = :id",
       id: params[:driver_id]])
    @hours = Checkin.find_by_sql(["SELECT c.hours, c.created_at FROM checkins c WHERE c.driver_id = :id ", id: params[:driver_id]])
    @work_days = Checkin.find_by_sql(["SELECT c.hours FROM checkins c WHERE c.driver_id= :id AND DATE_PART('week', c.created_at) = DATE_PART('week', now())", id: params[:driver_id]])
    @total_hours = @work_days[0].hours
  end

end

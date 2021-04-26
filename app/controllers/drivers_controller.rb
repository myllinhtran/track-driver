class DriversController < ApplicationController

  before_action :find_driver, only: [:show, :update, :edit, :destroy]

  # GET /drivers
  def index
    @drivers = Driver.all
    render :list
  end

  # GET /drivers/new
  def new
    render :create
  end

  # GET /drivers/:id/edit
  def edit
    render :edit
  end

  # POST /drivers
  def create
    @driver = Driver.new(driver_params)

    if @driver.save
      redirect_to @driver, notice: 'Driver was successfully created.'
    else
      render :create
    end

  end

  # PUT /drivers/:id
  def update
    @drivers = Driver.all
    if @driver
      respond_to do |format|
        if @driver.update(driver_params)
          format.html { redirect_to @driver, notice: 'Driver was successfully updated.' }
          format.js { render js: 'window.top.location.reload(true);' }
        else
          format.json { render json: @driver.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # DELETE /drivers/:id
  def destroy
    respond_to do |format|
      if @driver.destroy
        format.html { redirect_to @driver, notice: 'Driver was successfully removed.' }
        format.js { render js: 'window.top.location.reload(true);' }
      else
        format.json { render json: @driver.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def driver_params
    params.require(:driver).permit(:name,:email)
  end

  def find_driver
    @driver = Driver.find(params[:id])
  end

end

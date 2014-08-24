class SpecialRequestsController < ApplicationController
  before_action :set_special_request, only: [:show, :edit, :update, :destroy]

  # GET /special_requests
  # GET /special_requests.json
  def index
    @special_requests = SpecialRequest.all
  end

  # GET /special_requests/1
  # GET /special_requests/1.json
  def show
  end

  # GET /special_requests/new
  def new
    @special_request = SpecialRequest.new
  end

  # GET /special_requests/1/edit
  def edit
  end

  # POST /special_requests
  # POST /special_requests.json
  def create
    @special_request = SpecialRequest.new(special_request_params)

    respond_to do |format|
      if @special_request.save
        format.html { redirect_to @special_request, notice: 'Special request was successfully created.' }
        format.json { render :show, status: :created, location: @special_request }
      else
        format.html { render :new }
        format.json { render json: @special_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /special_requests/1
  # PATCH/PUT /special_requests/1.json
  def update
    respond_to do |format|
      if @special_request.update(special_request_params)
        format.html { redirect_to @special_request, notice: 'Special request was successfully updated.' }
        format.json { render :show, status: :ok, location: @special_request }
      else
        format.html { render :edit }
        format.json { render json: @special_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /special_requests/1
  # DELETE /special_requests/1.json
  def destroy
    @special_request.destroy
    respond_to do |format|
      format.html { redirect_to special_requests_url, notice: 'Special request was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_special_request
      @special_request = SpecialRequest.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def special_request_params
      params.require(:special_request).permit(:request_type, :request_value)
    end
end

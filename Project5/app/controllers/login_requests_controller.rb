class LoginRequestsController < ApplicationController
  before_action :set_login_request, only: [:show, :edit, :update, :destroy]

  # GET /login_requests
  # GET /login_requests.json
  def index
    @login_requests = LoginRequest.all
  end

  # GET /login_requests/1
  # GET /login_requests/1.json
  def show
  end

  # GET /login_requests/new
  def new
    @login_request = LoginRequest.new
  end

  # GET /login_requests/1/edit
  def edit
  end

  # POST /login_requests
  # POST /login_requests.json
  def create
    @login_request = LoginRequest.new(login_request_params)

    respond_to do |format|
      if @login_request.save
        format.html { redirect_to @login_request, notice: 'Login request was successfully created.' }
        format.json { render :show, status: :created, location: @login_request }
      else
        format.html { render :new }
        format.json { render json: @login_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /login_requests/1
  # PATCH/PUT /login_requests/1.json
  def update
    respond_to do |format|
      if @login_request.update(login_request_params)
        format.html { redirect_to @login_request, notice: 'Login request was successfully updated.' }
        format.json { render :show, status: :ok, location: @login_request }
      else
        format.html { render :edit }
        format.json { render json: @login_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /login_requests/1
  # DELETE /login_requests/1.json
  def destroy
    @login_request.destroy
    respond_to do |format|
      format.html { redirect_to login_requests_url, notice: 'Login request was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_login_request
      @login_request = LoginRequest.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def login_request_params
      params.require(:login_request).permit(:fname, :lname, :username, :department, :email)
    end
end

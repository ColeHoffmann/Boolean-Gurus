class UsersController < ApplicationController

  #skip_before_action :authorized, only [:new, :create]
  def search
    if (params[:searchLname].blank?  && params[:searchUsername].blank? && params[:searchAffiliation].blank?)
      @list = User.all
    else
      @parameter1 = params[:searchLname]
      @parameter2 = params[:searchUsername]
      @parameter3 = params[:searchAffiliation]
      @query = ""
      @query += "lname LIKE '%#@parameter1%' AND " unless params[:searchLname].blank?
      @query += "username LIKE '%#@parameter2%' AND " unless params[:searchUsername].blank?
      @query += "affiliation LIKE '%#@parameter3%' AND " unless params[:searchAffiliation].blank?
      @query.delete_suffix!(" AND ")
      @list = User.where(@query)

    end
  end
  def new
    @user = User.new
  end


  def index
    @users = User.all
  end

  def show
  end

  def edit
  end

  def create
    @user = User.create(user_params)
    @user.affiliation = "Student" if !logged_in?

		if @user.save 
      redirect_to users_path
		else 
			render "new"
		end


  end

  def update
    set_user
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'Profile was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end 

  def destroy
    set_user
    @user.destroy
    redirect_to users_path
	end



  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:fname,:lname,:affiliation,:username,:password,:phone_number, :email)
    end
end

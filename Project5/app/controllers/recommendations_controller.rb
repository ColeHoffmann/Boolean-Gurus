class RecommendationsController < ApplicationController
  # def search
  #   if (params[:searchLname].blank?  && params[:searchUsername].blank? && params[:searchAffiliation].blank?)
  #     @list = Recommendation.all
  #   else
  #     @parameter1 = params[:searchLname]
  #     @parameter2 = params[:searchUsername]
  #     @parameter3 = params[:searchAffiliation]
  #     @query = ""
  #     @query += "lname LIKE '%#@parameter1%' AND " unless params[:searchLname].blank?
  #     @query += "username LIKE '%#@parameter2%' AND " unless params[:searcUsername].blank?
  #     @query += "affiliation LIKE '%#@parameter3%' AND " unless params[:searchAffiliation].blank?
  #     @query.delete_suffix!(" AND ")
  #     @list = Recommendation.where(@query)
  #
  #   end
  # end
  def new
    @recommendation = Recommendation.new
  end

  def index
    @recommendations = Recommendation.all
  end

  def show
  end

  def edit
  end

  def create
    @recommendation = Recommendation.create(recommendation_params)

    redirect_to '/'
  end

  def update
    set_recommendation
    respond_to do |format|
      if @recommendation.update(recommendation_params)
        format.html { redirect_to @recommendation, notice: 'Recommendation was successfully updated.' }
        format.json { render :show, status: :ok, location: @recommendation }
      else
        format.html { render :edit }
        format.json { render json: @recommendation.errors, status: :unprocessable_entity }
      end
    end
  end

  private
  def set_recommendation
    @recommendation = Recommendation.find(params[:id])
  end

  def recommendation_params
    params.require(:recommendation).permit(:ins_fname,:ins_lname, :ins_username, :type, :recommendation, :ta_fname, :ta_lname, :ta_username)
  end
end
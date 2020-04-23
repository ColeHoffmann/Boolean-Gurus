class EvaluationsController < ApplicationController
  # def search
  #   if (params[:searchLname].blank?  && params[:searchUsername].blank? && params[:searchAffiliation].blank?)
  #     @list = Evaluation.all
  #   else
  #     @parameter1 = params[:searchLname]
  #     @parameter2 = params[:searchUsername]
  #     @parameter3 = params[:searchAffiliation]
  #     @query = ""
  #     @query += "lname LIKE '%#@parameter1%' AND " unless params[:searchLname].blank?
  #     @query += "username LIKE '%#@parameter2%' AND " unless params[:searcUsername].blank?
  #     @query += "affiliation LIKE '%#@parameter3%' AND " unless params[:searchAffiliation].blank?
  #     @query.delete_suffix!(" AND ")
  #     @list = Evaluation.where(@query)
  #
  #   end
  # end
  def new
    @evaluation = Evaluation.new
  end

  def index
    @evaluations = Evaluation.all
  end

  def show
  end

  def edit
  end

  def create
    @evaluation = Evaluation.create(evaluation_params)

    redirect_to '/'
  end

  def update
    set_evaluation
    respond_to do |format|
      if @evaluation.update(evaluation_params)
        format.html { redirect_to @evaluation, notice: 'Evaluation was successfully updated.' }
        format.json { render :show, status: :ok, location: @evaluation }
      else
        format.html { render :edit }
        format.json { render json: @evaluation.errors, status: :unprocessable_entity }
      end
    end
  end

  private
  def set_evaluation
    @evaluation = Evaluation.find(params[:id])
  end

  def evaluation_params
    params.require(:evaluation).permit(:ins_fname,:ins_lname, :ins_username, :rating, :evaluation, :stud_fname, :stud_lname, :stud_username)
  end
end
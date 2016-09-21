class EmploymentsController < ApplicationController
  def index
    @employments = Employment.all
    @profiles = Profile.all
  end

  def show
    @employment = Employment.find_by_id(params[:id])
    render :show
  end

  def new
    @employment = Employment.new
    render :new
  end

  def create
    #need to refactor this so you can use params mroe easily
    employment_params = params.require(:employment).permit(:profile_id, :industry, :title, :company, :companyimg, :city, :state, :summary, :start_date, :end_date, :status)
    employment = Employment.create(employment_params)
    if @employment.save
      redirect_to @employment
    else
      render :new
    end
  end

  def edit
    @employment = Employment.find(params[:id])
    render :edit
  end

  def update
    employment_params = params.require(:employment).permit(:profile_id, :industry, :title, :company, :companyimg, :city, :state, :summary, :start_date, :end_date, :status)
    @employment = Employment.find(params[:id])
    @employment.update_attributes(employment_params)
  end

end

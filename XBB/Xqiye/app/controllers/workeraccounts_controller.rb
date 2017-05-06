class WorkeraccountsController < ApplicationController
  #load_and_authorize_resource
  before_action :set_workeraccount, only: [:show,:edit,:update,:destroy,:reset]
  before_filter :authenticate_workeraccount!
  def index
    #@workers = Workeraccount.all
    @workeraccounts = Workeraccount.paginate(page: params[:page], per_page: 10).order(updated_at: :desc)
  end

  def show
  end

  def new
    @workeraccount = Workeraccount.new
  end

  def create
    @workeraccount = Workeraccount.new(workeraccount_params)

    respond_to do |format|
      if @workeraccount.save
        format.html { redirect_to workeraccounts_path, notice: 'Workeraccount was successfully created.' }
        format.json { render :show, status: :created, location: @workeraccount }
      else
        format.html { render :new }
        format.json { render json: @workeraccount.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit

  end
  def reset
  	
  end

  def update
    respond_to do |format|
      if @workeraccount.update(workeraccount_params)

        format.html { redirect_to workeraccounts_path, notice: 'Workeraccount was successfully updated.' }
        format.json { render :show, status: :ok, location: @workeraccount }
      else
        format.html { render :reset }
        format.json { render json: @workeraccount.errors, status: :unprocessable_entity }
      end
    end
  end

  def change_current_city
    session[:current_city_id]=params[:id]
    redirect_to :back
  end

  private
  	  def set_workeraccount
      	@workeraccount = Workeraccount.find(params[:id])
      end
  	  def workeraccount_params

  		  params.require(:workeraccount).permit(:email, :password, :password_confirmation, role_ids: [], city_ids: [])

  	  end

end

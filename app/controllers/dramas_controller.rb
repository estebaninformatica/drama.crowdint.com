class DramasController < ApplicationController
  before_filter do
    redirect_to user_omniauth_authorize_path :google_apps unless current_user
  end

  # GET /dramas
  # GET /dramas.json
  def index
    @dramas = Drama.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @dramas }
    end
  end

  # GET /dramas/1
  # GET /dramas/1.json
  def show
    @drama = Drama.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @drama }
    end
  end

  # GET /dramas/new
  # GET /dramas/new.json
  def new
    @drama = Drama.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @drama }
    end
  end

  # GET /dramas/1/edit
  def edit
    @drama = Drama.find(params[:id])
  end

  # POST /dramas
  # POST /dramas.json
  def create
    @drama = Drama.new(params[:drama])

    respond_to do |format|
      if @drama.save
        format.html { redirect_to @drama, notice: 'Drama was successfully created.' }
        format.json { render json: @drama, status: :created, location: @drama }
      else
        format.html { render action: "new" }
        format.json { render json: @drama.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /dramas/1
  # PUT /dramas/1.json
  def update
    @drama = Drama.find(params[:id])

    respond_to do |format|
      if @drama.update_attributes(params[:drama])
        format.html { redirect_to @drama, notice: 'Drama was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @drama.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dramas/1
  # DELETE /dramas/1.json
  def destroy
    @drama = Drama.find(params[:id])
    @drama.destroy

    respond_to do |format|
      format.html { redirect_to dramas_url }
      format.json { head :no_content }
    end
  end
end

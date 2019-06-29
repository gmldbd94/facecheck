require 'carrierwave/orm/activerecord'
class ScafdsController < ApplicationController
  before_action :set_scafd, only: [:show, :edit, :update, :destroy]

  # GET /scafds
  # GET /scafds.json
  def index
    @scafds = Scafd.all
  end

  # GET /scafds/1
  # GET /scafds/1.json
  def show
  end

  # GET /scafds/new
  def new
    @scafd = Scafd.new
    @score = params[:score]
  end

  # GET /scafds/1/edit
  def edit
  end

  # POST /scafds
  # POST /scafds.json
  def create
    @scafd = Scafd.new
    @scafd.user_name = params[:user_name]
    @scafd.univ = params[:univ]
    @scafd.birth = params[:birth]
    @scafd.major = params[:major]
    @scafd.image = params[:image]
    @scafd.score = params[:score]

    respond_to do |format|
      if @scafd.save
        format.html { redirect_to "/result/result/#{@scafd.id}", notice: 'Scafd was successfully created.' }
        format.json { render :show, status: :created, location: @scafd }
      else
        format.html { render :new }
        format.json { render json: @scafd.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /scafds/1
  # PATCH/PUT /scafds/1.json
  def update
    respond_to do |format|
      if @scafd.update(scafd_params)
        format.html { redirect_to @scafd, notice: 'Scafd was successfully updated.' }
        format.json { render :show, status: :ok, location: @scafd }
      else
        format.html { render :edit }
        format.json { render json: @scafd.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /scafds/1
  # DELETE /scafds/1.json
  def destroy
    @scafd.destroy
    respond_to do |format|
      format.html { redirect_to scafds_url, notice: 'Scafd was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_scafd
      @scafd = Scafd.find(params[:id])
    end


end

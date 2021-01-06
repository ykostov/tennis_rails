class GladiatorsController < ApplicationController
  before_action :set_gladiator, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_admin!, except: [:show, :index]
  # GET /gladiators
  # GET /gladiators.json
  def index
    @gladiators = Gladiator.all
  end

  # GET /gladiators/1
  # GET /gladiators/1.json
  def show
  end

  # GET /gladiators/new
  def new
    @gladiator = Gladiator.new
  end

  # GET /gladiators/1/edit
  def edit
  end

  # POST /gladiators
  # POST /gladiators.json
  def create
    @gladiator = Gladiator.new(gladiator_params)
    @competition.admin = current_admin
    respond_to do |format|
      if @gladiator.save
        format.html { redirect_to @gladiator, notice: 'Gladiator was successfully created.' }
        format.json { render :show, status: :created, location: @gladiator }
      else
        format.html { render :new }
        format.json { render json: @gladiator.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /gladiators/1
  # PATCH/PUT /gladiators/1.json
  def update
    respond_to do |format|
      if @gladiator.update(gladiator_params)
        format.html { redirect_to @gladiator, notice: 'Gladiator was successfully updated.' }
        format.json { render :show, status: :ok, location: @gladiator }
      else
        format.html { render :edit }
        format.json { render json: @gladiator.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /gladiators/1
  # DELETE /gladiators/1.json
  def destroy
    @gladiator.destroy
    respond_to do |format|
      format.html { redirect_to gladiators_url, notice: 'Gladiator was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_gladiator
      @gladiator = Gladiator.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def gladiator_params
      params.require(:gladiator).permit(:title, :start_date, :info)
    end
end

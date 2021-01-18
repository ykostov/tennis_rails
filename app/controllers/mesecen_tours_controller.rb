class MesecenToursController < ApplicationController
  before_action :set_mesecen_tour, only: [:show, :edit, :update, :destroy]

  # GET /mesecen_tours
  # GET /mesecen_tours.json
  def index
    @mesecen_tours = MesecenTour.all
  end

  # GET /mesecen_tours/1
  # GET /mesecen_tours/1.json
  def show
  end

  # GET /mesecen_tours/new
  def new
    @mesecen_tour = MesecenTour.new
  end

  # GET /mesecen_tours/1/edit
  def edit
  end

  # POST /mesecen_tours
  # POST /mesecen_tours.json
  def create
    @mesecen_tour = MesecenTour.new(mesecen_tour_params)

    respond_to do |format|
      if @mesecen_tour.save
        format.html { redirect_to @mesecen_tour, notice: 'Mesecen tour was successfully created.' }
        format.json { render :show, status: :created, location: @mesecen_tour }
      else
        format.html { render :new }
        format.json { render json: @mesecen_tour.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /mesecen_tours/1
  # PATCH/PUT /mesecen_tours/1.json
  def update
    respond_to do |format|
      if @mesecen_tour.update(mesecen_tour_params)
        format.html { redirect_to @mesecen_tour, notice: 'Mesecen tour was successfully updated.' }
        format.json { render :show, status: :ok, location: @mesecen_tour }
      else
        format.html { render :edit }
        format.json { render json: @mesecen_tour.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mesecen_tours/1
  # DELETE /mesecen_tours/1.json
  def destroy
    @mesecen_tour.destroy
    respond_to do |format|
      format.html { redirect_to mesecen_tours_url, notice: 'Mesecen tour was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mesecen_tour
      @mesecen_tour = MesecenTour.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def mesecen_tour_params
      params.require(:mesecen_tour).permit(:title, :info, :start_date, :admin_id)
    end
end

class BottleTypesController < ApplicationController
  before_action :set_bottle_type, only: %i[ show edit update destroy ]

  # GET /bottle_types or /bottle_types.json
  def index
    @bottle_types = BottleType.all
  end

  # GET /bottle_types/1 or /bottle_types/1.json
  def show
  end

  # GET /bottle_types/new
  def new
    @bottle_type = BottleType.new
  end

  # GET /bottle_types/1/edit
  def edit
  end

  # POST /bottle_types or /bottle_types.json
  def create
    @bottle_type = BottleType.new(bottle_type_params)

    respond_to do |format|
      if @bottle_type.save
        format.html { redirect_to @bottle_type, notice: "Bottle type was successfully created." }
        format.json { render :show, status: :created, location: @bottle_type }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @bottle_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bottle_types/1 or /bottle_types/1.json
  def update
    respond_to do |format|
      if @bottle_type.update(bottle_type_params)
        format.html { redirect_to @bottle_type, notice: "Bottle type was successfully updated." }
        format.json { render :show, status: :ok, location: @bottle_type }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @bottle_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bottle_types/1 or /bottle_types/1.json
  def destroy
    @bottle_type.destroy!

    respond_to do |format|
      format.html { redirect_to bottle_types_path, status: :see_other, notice: "Bottle type was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bottle_type
      @bottle_type = BottleType.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def bottle_type_params
      params.require(:bottle_type).permit(:name, :image_url)
    end
end

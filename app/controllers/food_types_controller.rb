class FoodTypesController < ApplicationController
  before_action :set_food_type, only: %i[ show edit update destroy ]

  # GET /food_types or /food_types.json
  def index
    @food_types = FoodType.all
  end

  # GET /food_types/1 or /food_types/1.json
  def show
  end

  # GET /food_types/new
  def new
    @food_type = FoodType.new
  end

  # GET /food_types/1/edit
  def edit
  end

  # POST /food_types or /food_types.json
  def create
    @food_type = FoodType.new(food_type_params)

    respond_to do |format|
      if @food_type.save
        format.html { redirect_to @food_type, notice: "Food type was successfully created." }
        format.json { render :show, status: :created, location: @food_type }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @food_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /food_types/1 or /food_types/1.json
  def update
    respond_to do |format|
      if @food_type.update(food_type_params)
        format.html { redirect_to @food_type, notice: "Food type was successfully updated." }
        format.json { render :show, status: :ok, location: @food_type }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @food_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /food_types/1 or /food_types/1.json
  def destroy
    @food_type.destroy!

    respond_to do |format|
      format.html { redirect_to food_types_path, status: :see_other, notice: "Food type was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_food_type
      @food_type = FoodType.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def food_type_params
      params.require(:food_type).permit(:name, :description)
    end
end

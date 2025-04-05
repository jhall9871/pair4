class FoodSubtypesController < ApplicationController
  before_action :set_food_subtype, only: %i[ show edit update destroy ]

  # GET /food_subtypes or /food_subtypes.json
  def index
    @food_subtypes = FoodSubtype.all
  end

  # GET /food_subtypes/1 or /food_subtypes/1.json
  def show
  end

  # GET /food_subtypes/new
  def new
    @food_subtype = FoodSubtype.new
  end

  # GET /food_subtypes/1/edit
  def edit
  end

  # POST /food_subtypes or /food_subtypes.json
  def create
    @food_subtype = FoodSubtype.new(food_subtype_params)

    respond_to do |format|
      if @food_subtype.save
        format.html { redirect_to @food_subtype, notice: "Food subtype was successfully created." }
        format.json { render :show, status: :created, location: @food_subtype }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @food_subtype.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /food_subtypes/1 or /food_subtypes/1.json
  def update
    respond_to do |format|
      if @food_subtype.update(food_subtype_params)
        format.html { redirect_to @food_subtype, notice: "Food subtype was successfully updated." }
        format.json { render :show, status: :ok, location: @food_subtype }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @food_subtype.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /food_subtypes/1 or /food_subtypes/1.json
  def destroy
    @food_subtype.destroy!

    respond_to do |format|
      format.html { redirect_to food_subtypes_path, status: :see_other, notice: "Food subtype was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_food_subtype
      @food_subtype = FoodSubtype.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def food_subtype_params
      params.require(:food_subtype).permit(:name, :description, :food_type_id)
    end
end

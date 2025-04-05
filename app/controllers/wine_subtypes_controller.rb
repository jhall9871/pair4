class WineSubtypesController < ApplicationController
  before_action :set_wine_subtype, only: %i[ show edit update destroy ]

  # GET /wine_subtypes or /wine_subtypes.json
  def index
    @wine_subtypes = WineSubtype.all
  end

  # GET /wine_subtypes/1 or /wine_subtypes/1.json
  def show
  end

  # GET /wine_subtypes/new
  def new
    @wine_subtype = WineSubtype.new
  end

  # GET /wine_subtypes/1/edit
  def edit
  end

  # POST /wine_subtypes or /wine_subtypes.json
  def create
    @wine_subtype = WineSubtype.new(wine_subtype_params)

    respond_to do |format|
      if @wine_subtype.save
        format.html { redirect_to @wine_subtype, notice: "Wine subtype was successfully created." }
        format.json { render :show, status: :created, location: @wine_subtype }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @wine_subtype.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /wine_subtypes/1 or /wine_subtypes/1.json
  def update
    respond_to do |format|
      if @wine_subtype.update(wine_subtype_params)
        format.html { redirect_to @wine_subtype, notice: "Wine subtype was successfully updated." }
        format.json { render :show, status: :ok, location: @wine_subtype }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @wine_subtype.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /wine_subtypes/1 or /wine_subtypes/1.json
  def destroy
    @wine_subtype.destroy!

    respond_to do |format|
      format.html { redirect_to wine_subtypes_path, status: :see_other, notice: "Wine subtype was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_wine_subtype
      @wine_subtype = WineSubtype.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def wine_subtype_params
      params.require(:wine_subtype).permit(:name, :description, :wine_type_id)
    end
end

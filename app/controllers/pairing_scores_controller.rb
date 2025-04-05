class PairingScoresController < ApplicationController
  before_action :set_pairing_score, only: %i[ show edit update destroy ]

  # GET /pairing_scores or /pairing_scores.json
  def index
    @pairing_scores = PairingScore.all
  end

  # GET /pairing_scores/1 or /pairing_scores/1.json
  def show
  end

  # GET /pairing_scores/new
  def new
    @pairing_score = PairingScore.new
  end

  # GET /pairing_scores/1/edit
  def edit
  end

  # POST /pairing_scores or /pairing_scores.json
  def create
    @pairing_score = PairingScore.new(pairing_score_params)

    respond_to do |format|
      if @pairing_score.save
        format.html { redirect_to @pairing_score, notice: "Pairing score was successfully created." }
        format.json { render :show, status: :created, location: @pairing_score }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @pairing_score.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pairing_scores/1 or /pairing_scores/1.json
  def update
    respond_to do |format|
      if @pairing_score.update(pairing_score_params)
        format.html { redirect_to @pairing_score, notice: "Pairing score was successfully updated." }
        format.json { render :show, status: :ok, location: @pairing_score }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @pairing_score.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pairing_scores/1 or /pairing_scores/1.json
  def destroy
    @pairing_score.destroy!

    respond_to do |format|
      format.html { redirect_to pairing_scores_path, status: :see_other, notice: "Pairing score was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pairing_score
      @pairing_score = PairingScore.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def pairing_score_params
      params.require(:pairing_score).permit(:score, :wine_type_id, :food_subtype_id)
    end
end

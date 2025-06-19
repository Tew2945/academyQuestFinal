class QuestsController < ApplicationController
  before_action :set_quest, only: [ :update, :destroy ]

  # GET /quests or /quests.json
  def index
    @quests = Quest.all.order(created_at: :desc)
  end

  # POST /quests or /quests.json
  def create
    @quest = Quest.new(quest_params)
    @quests = Quest.all

    respond_to do |format|
      if @quest.save
        format.turbo_stream
        format.html { redirect_to quests_path, notice: "Quest was successfully created." }
      else
      end
    end
  end

  # PATCH/PUT /quests/1 or /quests/1.json
  def update
    respond_to do |format|
      if @quest.update(quest_params)
        format.turbo_stream
        format.html { redirect_to quests_path, notice: "Quest was successfully updated." }
        format.json { render :show, status: :ok, location: @quest }
      end
    end
  end

  # DELETE /quests/1 or /quests/1.json
  def destroy
    @quest.destroy!

    respond_to do |format|
      format.turbo_stream
      format.html { redirect_to quests_path, status: :see_other, notice: "Quest was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_quest
      @quest = Quest.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def quest_params
      params.require(:quest).permit(:name, :status)
    end
end

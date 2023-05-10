class EventHistoriesController < ApplicationController
  before_action :set_event_history, only: %i[ show edit update destroy ]

  # GET /event_histories or /event_histories.json
  def index
    @event_histories = EventHistory.all
  end

  # GET /event_histories/1 or /event_histories/1.json
  def show
  end

  # GET /event_histories/new
  def new
    @event_history = EventHistory.new
  end

  # GET /event_histories/1/edit
  def edit
  end

  # POST /event_histories or /event_histories.json
  def create
    @event_history = EventHistory.new(event_history_params)

    respond_to do |format|
      if @event_history.save
        format.html { redirect_to event_history_url(@event_history), notice: "Event history was successfully created." }
        format.json { render :show, status: :created, location: @event_history }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @event_history.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /event_histories/1 or /event_histories/1.json
  def update
    respond_to do |format|
      if @event_history.update(event_history_params)
        format.html { redirect_to event_history_url(@event_history), notice: "Event history was successfully updated." }
        format.json { render :show, status: :ok, location: @event_history }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @event_history.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /event_histories/1 or /event_histories/1.json
  def destroy
    @event_history.destroy

    respond_to do |format|
      format.html { redirect_to event_histories_url, notice: "Event history was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event_history
      @event_history = EventHistory.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def event_history_params
      params.require(:event_history).permit(:subscription_id, :type)
    end
end

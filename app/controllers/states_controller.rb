class StatesController < ApplicationController
  before_action :set_country
  before_action :set_state, only: %i[show edit update destroy]

  def index
    @states = @country.states.all
  end

  def show
    @state
  end

  def new
    @state = @country.states.new
  end

  def create
    @state = @country.states.new(state_params)

    respond_to do |format|
      if @state.save
        format.html { redirect_to country_state_url(@state), notice: 'State was successfully created.' }
        format.json { render :show, status: :created, location: @state }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @state.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @state.update!(state_params)
        format.html { redirect_to country_states_url(@state), notice: 'State was successfully updated.' }
        format.json { render :show, status: :ok, location: @state }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @state.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @state.destroy

    respond_to do |format|
      format.html { redirect_to country_states_url(@state.country_id), notice: 'State was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_country
    @country = Country.find(params[:country_id])
  end

  def set_state
    @state = @country.states.find(params[:id])
  end

  def state_params
    params.require(:state).permit(:name, :acronym)
  end
end

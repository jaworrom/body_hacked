class HackTipsController < ApplicationController

  #->Prelang (scaffolding:rails/scope_to_user)
  before_filter :require_user_signed_in, only: [:new, :edit, :create, :update, :destroy]

  before_action :set_hack_tip, only: [:show, :edit, :update, :destroy, :vote]

  # GET /hack_tips
  # GET /hack_tips.json
  def index
    @hack_tips = HackTip.all
  end

  # GET /hack_tips/1
  # GET /hack_tips/1.json
  def show
  end

  # GET /hack_tips/new
  def new
    @hack_tip = HackTip.new
  end

  # GET /hack_tips/1/edit
  def edit
  end

  # POST /hack_tips
  # POST /hack_tips.json
  def create
    @hack_tip = HackTip.new(hack_tip_params)

    respond_to do |format|
      if @hack_tip.save
        format.html { redirect_to @hack_tip, notice: 'Hack tip was successfully created.' }
        format.json { render action: 'show', status: :created, location: @hack_tip }
      else
        format.html { render action: 'new' }
        format.json { render json: @hack_tip.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /hack_tips/1
  # PATCH/PUT /hack_tips/1.json
  def update
    respond_to do |format|
      if @hack_tip.update(hack_tip_params)
        format.html { redirect_to @hack_tip, notice: 'Hack tip was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @hack_tip.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /hack_tips/1
  # DELETE /hack_tips/1.json
  def destroy
    @hack_tip.destroy
    respond_to do |format|
      format.html { redirect_to hack_tips_url }
      format.json { head :no_content }
    end
  end


  #->Prelang (voting/acts_as_votable)
  def vote

    direction = params[:direction]

    # Make sure we've specified a direction
    raise "No direction parameter specified to #vote action." unless direction

    # Make sure the direction is valid
    unless ["like", "bad"].member? direction
      raise "Direction '#{direction}' is not a valid direction for vote method."
    end

    @hack_tip.vote voter: current_user, vote: direction

    redirect_to index
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hack_tip
      @hack_tip = HackTip.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def hack_tip_params
      params.require(:hack_tip).permit(:title, :description, :user_id)
    end
end

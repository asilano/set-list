class GigSetsController < ApplicationController
  before_action :set_gig_set, only: [:edit, :update, :destroy]

  # Can't do anything unless signed in
  before_filter :authenticate_user!

  # POST /gig_sets
  # POST /gig_sets.json
  def create
    @gig_set = GigSet.new(gig_set_params)
    @gig_set.number = (@gig_set.gig.gig_sets.map(&:number).compact.max || 0) + 1

    respond_to do |format|
      if @gig_set.save
        format.html { redirect_to edit_gig_path(@gig_set.gig) }
        format.json { redirect_to edit_gig_path(@gig_set.gig) }
      else
        format.html { redirect_to edit_gig_path(@gig_set.gig), error: "Couldn't add a new set" }
        format.json { redirect_to edit_gig_path(@gig_set.gig), status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /gig_sets/1
  # PATCH/PUT /gig_sets/1.json
  def update
    respond_to do |format|
      if @gig_set.update(gig_set_params)
        format.html { redirect_to edit_gig_path(@gig_set.gig) }
        format.json { redirect_to edit_gig_path(@gig_set.gig) }
      else
        format.html { redirect_to edit_gig_path(@gig_set.gig), error: "Couldn't update set" }
        format.json { redirect_to edit_gig_path(@gig_set.gig), status: :unprocessable_entity }
      end
    end
  end

  # DELETE /gig_sets/1
  # DELETE /gig_sets/1.json
  def destroy
    gig = @gig_set.gig
    @gig_set.destroy
    gig.gig_sets.each_with_index do |set, ix|
      set.number = ix + 1
      set.save!
    end

    respond_to do |format|
      format.html { redirect_to edit_gig_path(gig) }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_gig_set
      @gig_set = GigSet.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def gig_set_params
      params.require(:gig_set).permit(:number, :gig_id)
    end
end

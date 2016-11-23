class SongInstancesController < ApplicationController
  before_action :set_song_instance, only: [:edit, :update, :destroy, :move_up, :move_down]
  rescue_from ActiveRecord::RecordNotFound, with: :rescue_from_not_found

  # Can't do anything unless signed in
  before_filter :authenticate_user!

  # POST /song_instances
  # POST /song_instances.json
  def create
    @song_instance = SongInstance.new(song_instance_params)
    @song_instance.order ||= (@song_instance.gig_set.song_instances.map(&:order).compact.max || 0) + 1

    respond_to do |format|
      if @song_instance.save
        format.html { redirect_to edit_gig_path(@song_instance.gig) }
        format.json { redirect_to edit_gig_path(@song_instance.gig) }
      else
        format.html { redirect_to edit_gig_path(@song_instance.gig), error: "Couldn't add a new song to this set" }
        format.json { redirect_to edit_gig_path(@song_instance.gig), status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /song_instances/1
  # PATCH/PUT /song_instances/1.json
  def update
    respond_to do |format|
      if @song_instance.update(song_instance_params)
        format.html { redirect_to edit_gig_path(@song_instance.gig) }
        format.json { redirect_to edit_gig_path(@song_instance.gig) }
      else
        format.html { redirect_to edit_gig_path(@song_instance.gig), error: "Couldn't update something" }
        format.json { redirect_to edit_gig_path(@song_instance.gig), status: :unprocessable_entity }
      end
    end
  end

  # PUT /song_instances/1/move_up
  def move_up
    # Swap order numbers between this instance, and the one above it.
    earlier_inst = @song_instance.gig_set.song_instances.where { order < my{@song_instance.order} }.last
    my_order = @song_instance.order
    @song_instance.order = earlier_inst.order
    earlier_inst.order = my_order

    respond_to do |format|
      SongInstance.transaction do
        begin
          @song_instance.save!
          earlier_inst.save!

          format.html { redirect_to edit_gig_path(@song_instance.gig) }
          format.json { redirect_to edit_gig_path(@song_instance.gig) }
        rescue
          format.html { redirect_to edit_gig_path(@song_instance.gig), error: "Couldn't update something" }
          format.json { redirect_to edit_gig_path(@song_instance.gig), status: :unprocessable_entity }
        end
      end
    end
  end

  # PUT /song_instances/1/move_down
  def move_down
    # Swap order numbers between this instance, and the one after it.
    later_inst = @song_instance.gig_set.song_instances.where { order > my{@song_instance.order} }.first
    my_order = @song_instance.order
    @song_instance.order = later_inst.order
    later_inst.order = my_order

    respond_to do |format|
      SongInstance.transaction do
        begin
          @song_instance.save!
          later_inst.save!

          format.html { redirect_to edit_gig_path(@song_instance.gig) }
          format.json { redirect_to edit_gig_path(@song_instance.gig) }
        rescue
          format.html { redirect_to edit_gig_path(@song_instance.gig), error: "Couldn't update something" }
          format.json { redirect_to edit_gig_path(@song_instance.gig), status: :unprocessable_entity }
        end
      end
    end
  end

  # DELETE /song_instances/1
  # DELETE /song_instances/1.json
  def destroy
    gig_set = @song_instance.gig_set
    @song_instance.destroy
    gig_set.song_instances.each_with_index do |song, ix|
      song.order = ix + 1
      song.save!
    end

    respond_to do |format|
      format.html { redirect_to edit_gig_path(gig_set.gig) }
      format.json { head :no_content }
    end
  end

protected
  def rescue_from_not_found
    redirect_to :back
  end

private
  # Use callbacks to share common setup or constraints between actions.
  def set_song_instance
    @song_instance = SongInstance.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def song_instance_params
    params.require(:song_instance).permit(:order, :song_id, :gig_set_id)
  end
end

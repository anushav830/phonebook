class PhoneContactsController < ApplicationController
	 before_action :set_entry, only: [:destroy]
  
  def destroy
    session[:return_link] = @entry
    @phone_contact.destroy
    @phone_contact.save
    respond_to do |format|
         format.html { redirect_to request.referrer, notice: 'Selected Phone Number was successfully deleted.'  }
         format.json { head :no_content }
         #format.js {render inline: "location.reload();" }
    end
  end
  private
  
    # Use callbacks to share common setup or constraints between actions.
    def set_entry
      @phone_contact = PhoneContact.find_by(id: params[:id])
    end
end
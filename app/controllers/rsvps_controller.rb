class RsvpsController < ApplicationController
  
  def create
    @rsvp = Rsvp.new(rsvp_params)
    @rsvp.request = request
    session[:from] = "rsvp"

    if @rsvp.valid?
    	if @rsvp.deliver
		    flash[:success] = "Thanks for your RSVP!"
			redirect_to root_path
		end
	else
	    flash[:errors] = @rsvp.errors.full_messages
	    flash[:name] = @rsvp.name
	    flash[:email] = @rsvp.email
      flash[:response] = @rsvp.response
	    flash[:guest] = @rsvp.guest
	    flash[:nickname] = @rsvp.nickname
        flash.now[:error] = 'RSVP failed. Please try again.'
        redirect_to root_path
	end
  end


private

  def rsvp_params
      params.require(:rsvp).permit(:name, :email, :response, :guest, :nickname)
  end

end
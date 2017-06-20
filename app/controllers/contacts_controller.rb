class ContactsController < ApplicationController
  
  def create
    @contact = Contact.new(contact_params)
    @contact.request = request
    session[:from] = "contact"

    if @contact.valid?
    	if @contact.deliver
		    flash[:success] = "Thanks for your message. We'll check it out soon!"
			redirect_to root_path
		end
	else
	    flash[:errors] = @contact.errors.full_messages
	    flash[:name] = @contact.name
	    flash[:email] = @contact.email
	    flash[:message] = @contact.message
	    flash[:nickname] = @contact.nickname
        flash.now[:error] = 'Cannot send message. Please try again.'
        redirect_to root_path
	end
  end


private

  def contact_params
      params.require(:contact).permit(:name, :email, :message, :nickname)
  end

end
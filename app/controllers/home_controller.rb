class HomeController < ApplicationController
  
  def index
  	@contact = Contact.new
  	@rsvp = Rsvp.new
  end

end

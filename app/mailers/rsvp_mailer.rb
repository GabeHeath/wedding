class RsvpMailer < ApplicationMailer
	default from: 'rsvp@gabe-and-ellen.us', to: 'gabe.d.heath+weddingsrv@gmail.com'

	def rsvp_message(user)
    	@user = user
   		# I am overriding the 'to' default
    	mail(subject: 'New Rsvp')
  	end
end

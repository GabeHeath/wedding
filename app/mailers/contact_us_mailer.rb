class ContactUsMailer < ApplicationMailer
	default from: 'contact-us@gabe-and-ellen.us', to: 'gabe.d.heath+weddingsrv@gmail.com'

	def contact_message(user)
    	@user = user
   		# I am overriding the 'to' default
    	mail(subject: 'New Contact Inquiry')
  	end
end

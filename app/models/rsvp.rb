class Rsvp < MailForm::Base

  attribute :name,      :validate => true
  attribute :email,     :allow_blank => true, :validate => /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
  attribute :response
  attribute :guest
  attribute :nickname,  :captcha  => true

  append :remote_ip, :user_agent, :session

  # Declare the e-mail headers. It accepts anything the mail method
  # in ActionMailer accepts.
  def headers
    {
      :subject => "New RSVP",
      :to => "gabe.d.heath+weddingsrv@gmail.com",
      :from => "rsvp@gabe-and-ellen.us"
    }
  end
end
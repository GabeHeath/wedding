class Contact < MailForm::Base

  attribute :name,      :validate => true
  attribute :email,     :validate => /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
  attribute :message,   :validate => true
  attribute :nickname,  :captcha  => true

  append :remote_ip, :user_agent, :session

  # Declare the e-mail headers. It accepts anything the mail method
  # in ActionMailer accepts.
  def headers
    {
      :subject => "New Contact Form",
      :to => "gabe.d.heath+weddingsrv@gmail.com",
      :from => "contact@gabe-and-ellen.us"
    }
  end
end
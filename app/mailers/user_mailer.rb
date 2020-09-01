class UserMailer < ApplicationMailer
  default from: ENV['SENDGRID_FROM']
  def welcome_email(user)
    #on récupère l'instance user pour ensuite pouvoir la passer à la view en @user
    @user = user 
  #on définit une variable @url qu'on utilisera dans la view d’e-mail
    @url  = ENV['SENDGRID_HOSTNAME']
  
    mail(to: @user.email, subject: 'Bienvenue chez nous !') 
  end

end

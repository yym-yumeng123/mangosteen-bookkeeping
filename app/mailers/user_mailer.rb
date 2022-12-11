class UserMailer < ApplicationMailer
  def welcome_email
    mail(to: "1614527443@qq.com", subject: "Hi, yym")
  end
end

class UserMailer < ApplicationMailer

  default from: "God <god@example.com>"

  def new_book(user,book)
    @user = user
    @book = book
    mail(to: @user.email, subject: "New book added!",)
  end

end

class UserMailer < ActionMailer::Base
  default from: 'from@example.com'
  layout 'mailer'

  def loan_created_email(book_loan)
      @title = book_loan.book.title
      @date = book_loan.due_date

      # binding.b

      email_address = book_loan.user.email
      email_subject = "Cześć, nie zapomniałeś o czymś?"
      mail(to: email_address, subject: email_subject)
  end

  def due_date_notification_email
      @title = book_loan.book.title
      @date = book_loan.due_date

      email_address = book_loan.user.email
      email_subject = "Cześć, nie zapomniałeś o czymś?"
      mail(to: email_address, subject: email_subject)
  end
end

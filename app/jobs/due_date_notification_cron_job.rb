class DueDateNotificationJob

  include Sidekiq::Job

  def perform
    # BookLoan.where(...).each.where(status: 'checked_out').where(due_date: Date.tomorrow)
   
    zbior = BookLoan.checked_out.where(...).each.where(due_date: Time.zone.now..Time.zone.now + 4.minutes)
       
    # book_loan = BookLoan.find(book_loan_id)
  
    zbior.each(UserMailer.loan_created_email(book_loan).deliver_now)
  end
end

# frozen_string_literal: true

class SolutionMailer < ActionMailer::Base
  include SendGridMailer

  def notify_admins(admin_emails, new_solution)
    admin_emails.each do |email|
      sendgrid_mail(
        I18n.t('mail.solution.subject.new_solution'),
        Email.new(email: email),
        get_content('solution_mailer/notify_admins', new_solution: new_solution)
      )
    end
  end
end

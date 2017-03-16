class ApplicationMailer < ActionMailer::Base
  include Roadie::Rails::Automatic

  default from: 'no_reply@lyria.com'

  layout 'mailer'

  private

  def roadie_options
    super unless Rails.env.test?
  end
end

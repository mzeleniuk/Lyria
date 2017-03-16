class DeviseCustomMailer < Devise::Mailer
  include Roadie::Rails::Automatic

  layout 'mailer'

  private

  def roadie_options
    super unless Rails.env.test?
  end
end

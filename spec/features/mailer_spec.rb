require 'rails_helper'


describe 'Test mailer' do



  include EmailSpec::Helpers
  include EmailSpec::Matchers
  # include ActionController::UrlWriter - old rails
  include Rails.application.routes.url_helpers

  before(:all) do
    @email = MailerHelper.send_mail_to_user()
  end

  it "should be set to be delivered to the email passed in" do
    expect(@email).to deliver_to("jojo@yahoo.com")
  end

  it "should contain the user's message in the mail body" do
    expect(@email).to have_body_text(/Jojo Binks/)
  end

  it "should contain a link to the confirmation link" do
    expect(@email).to have_body_text(/#{confirm_account_url}/)
  end

  it "should have the correct subject" do
    expect(@email).to have_subject(/Account confirmation/)
  end


  it 'should not send mail to nonexistent e-mail' do


  end


  it 'should send e-mail successfully' do


  end

end

describe EmailSpec::EmailViewer do
  describe ".open_in_browser" do
    it "should open with launchy" do
      EmailSpec::EmailViewer.open_in_browser("a_file")
    end
  end
end
require 'spec_helper'

describe command('openssl version') do
  it { should return_stdout /^OpenSSL\ 1\.0\.1g/ }
end

describe 'visit Heartbleed test' ,:type => :feature do

  before :each do
    Capybara.app_host = 'https://filippo.io'
  end

  it 'show testpage' do
    visit '/Heartbleed/'
    expect(page).to have_content 'Heartbleed test'
  end

  it 'check google ssl' do
    visit '/Heartbleed/'
    fill_in 'hostname', :with => 'google.com'
    click_on 'Go!'
    expect(page).to have_content 'All good, google.com seems fixed or unaffected!'
  end
end


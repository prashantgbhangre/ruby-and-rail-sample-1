require 'spec_helper'

describe "StaticPages" do
  subject { page }
  describe "Home Page" do
    before { visit root_path }
    it { should have_content('Parami Soft') }
    it { should have_title('Welcome to parami soft | Home') }
  end
    
    describe "Help page" do
      before { visit help_path }
      it { should have_content('Help') }
      it { should have_title('Welcome to parami soft | Help') }
  end
  
  describe "About Page" do
    before { visit about_path }
    it { should have_content('About us') }
    it { should have_title('Welcome to parami soft | About') }
  end
  
  describe "Contact Page" do
    before { visit contact_path }
    it { should have_content('Contact us') }
    it { should have_title('Welcome to parami soft | Contact') }  end
end
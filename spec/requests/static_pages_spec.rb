require 'spec_helper'

describe "StaticPages" do
  
  describe "Home Page" do
    it "should have the content 'Sample App'" do
      visit '/static_pages/home'
      expect(page).to have_content('Sample App')
    end
    
    it "Should have the right title" do
      visit '/static_pages/home'
      expect(page).to have_title('Welcome to parami soft | Home')
    end
  end
    
    describe "Help page" do
      it "Should have the content 'Help'" do
      visit '/static_pages/help'
      expect(page).to have_content('Help')
    end
    
    it "Should have the right title" do
      visit '/static_pages/help'
      expect(page).to have_title('Welcome to parami soft | Help')
    end
  end
  
  describe "About Page" do
    it "Should have the content 'About us'" do
      visit '/static_pages/about'
      expect(page).to have_content('About us')
    end
    
    it "Should have the right title" do
      visit '/static_pages/about'
      expect(page).to have_title('Welcome to parami soft | About')
    end
  end
  
  describe "Contact Page" do
    it "Should have the content 'Contact us'" do
      visit '/static_pages/contact'
      expect(page).to have_content('Contact us')
    end
    
    it "Should have the right title" do
      visit '/static_pages/contact'
      expect(page).to have_title('Welcome to parami soft | Contact')
    end
  end
end
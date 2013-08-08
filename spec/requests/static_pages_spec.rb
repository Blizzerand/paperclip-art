require 'spec_helper'

describe "Static Pages" do
  describe "Home page" do
    it "should have the content 'Paperclip-art'" do
    	visit '/static_pages/home'
    	expect(page).to have_content("Paperclip-art")

   end

   it "should have the title 'Paperclip-art | Home'"	do
   		visit '/static_pages/home'
   		expect(page).to have_title('Home')
   	end
  end

  describe  "Help Page" do
  	it "should have the content 'Help'" do
  		visit '/static_pages/help'
  		expect(page).to have_content("Help") 
  	end

  	it "should have the title 'Paperclip-art | Help'"	do
   		visit '/static_pages/help'
   		expect(page).to have_title('Help')
   	end
  end

  describe "About Page"do
  	it "should have the content 'About Paperclip-art'" do
  		visit '/static_pages/about'
  		expect(page).to have_content("About Paperclip-art") 
  	end

  	it "should have the title 'Paperclip-art | About'"	do
   		visit '/static_pages/about'
   		expect(page).to have_title('About')
   	end
  end
end
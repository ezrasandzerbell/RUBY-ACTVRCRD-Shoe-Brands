require('spec_helper')

describe('navigation') do
  describe('routing to index', {:type => :feature}) do
    it('successfully loads index') do
      visit('/')
      expect(page).to have_content("Stores and Brands")
    end
    it('clicks on brand object link and navigates to new page') do
      visit('/')
      fill_in("brand_name", :with => "Toms")
      click_button("Register New Brand")
      click_link("Toms")
      expect(page).to have_content("Toms")
    end
  end
end

describe('creating instances of brand and store class') do
  describe('submitting forms', {:type => :feature}) do
    it('fills out brand name form and submits') do
      visit('/')
      fill_in("brand_name", :with => "Rebok")
      click_button("Register New Brand")
      expect(page).to have_content("Rebok")
    end
    it('fills out store name form and submits') do
      visit('/')
      fill_in("store_name", :with => "Foot Locker")
      click_button("Register New Store")
      expect(page).to have_content("Foot Locker")
    end
  end
end

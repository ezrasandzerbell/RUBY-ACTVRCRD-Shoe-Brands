require('spec_helper')

describe('navigation') do
  describe('routing to index', {:type => :feature}) do
    it('successfully loads index') do
      visit('/')
      expect(page).to have_content("Foot Warehouse")
    end
    it('clicks on brand object link and navigates to new page') do
      visit('/')
      fill_in("brand_name", :with => "Toms")
      click_button("Register New Brand")
      click_link("Toms")
      expect(page).to have_content("Affiliates:")
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

describe('selecting opposite class from dropdown menu and assigning to current class') do
  describe('assign brands to a store', {:type => :feature}) do
    it('selects brand from dropdown and submits form') do
      visit('/')
      fill_in("brand_name", :with => "bootsies")
      click_button("Register New Brand")
      fill_in("store_name", :with => "Target")
      click_button("Register New Store")
      click_link('Target')
      select('Bootsies', :from => 'brand_name')
      click_button('Add Brand Affiliate')
      expect(page).to have_content("You added Bootsies as an affiliate")
    end
    it('fills out store name form and submits') do
      visit('/')
      click_link('Toms')
      select('Foot Locker', :from => 'store_name')
      click_button('Add Store Affiliate')
      expect(page).to have_content("You added Foot Locker as an affiliate")
    end
  end
end

describe('index page brand and store navigation') do
  describe('update classes', {:type => :feature}) do
    it('creates a store') do
      visit('/')
      first(:link, 'Update Store Name').click
      expect(page).to have_content("Change the Store's Name")
    end
    it('creates a brand') do
      visit('/')
      first(:link, 'Update Brand Name').click
      expect(page).to have_content("Change the Brand's Name")
    end
    it('updates a store') do
      visit('/')
      first(:link, 'Update Store Name').click
      fill_in("store_name", :with => "Target")
      click_button("Submit")
      expect(page).to have_content("Target")
    end
    it('updates a brand') do
      visit('/')
      first(:link, 'Update Brand Name').click
      fill_in("brand_name", :with => "rei")
      click_button("Submit")
      expect(page).to have_content("Rei")
    end
  end
  describe('deletes classes', {:type => :feature}) do
    it('deletes a store') do
      visit('/')
      first(:button, 'Delete Store').click
      expect(page).to have_content("Foot Warehouse")
    end
    it('deletes a brand') do
      visit('/')
      first(:button, 'Delete Brand').click
      expect(page).to have_content("Foot Warehouse")
    end
  end
end

describe('tests for validation and callback on both classes') do
  describe('tests for titleize callback', {:type => :feature}) do
    it('runs callback test on store input') do
      visit('/')
      fill_in("store_name", :with => "home depot")
      click_button("Register New Store")
      expect(page).to have_content("Home Depot")
    end
    it('runs callback test on brand input') do
      visit('/')
      fill_in("brand_name", :with => "puma sport")
      click_button("Register New Brand")
      expect(page).to have_content("Puma Sport")
    end
  end
end

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

describe('selecting opposite class from dropdown menu and assigning to current class') do
  describe('assign brands to a store', {:type => :feature}) do
    it('selects brand from dropdown and submits form') do
      visit('/')
      click_link('Foot Locker')
      select('Toms', :from => 'brand_name')
      click_button('Add Brand Affiliate')
      expect(page).to have_content("Toms")
    end
    it('fills out store name form and submits') do
      visit('/')
      click_link('Toms')
      select('Foot Locker', :from => 'store_name')
      click_button('Add Store Affiliate')
      expect(page).to have_content("Foot Locker")
    end
  end
end

describe('navigation') do
  describe('update classes', {:type => :feature}) do
    it('creates a store') do
      visit('/')
      first(:link, 'Update Store Name').click
      expect(page).to have_content("Hello World")
    end
    it('creates a store') do
      visit('/')
      first(:link, 'Update Brand Name').click
      expect(page).to have_content("Hello World")
    end
  end
end

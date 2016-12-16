require('spec_helper')

describe('navigation') do
  describe('routing to index', {:type => :feature}) do
    it('successfully loads index') do
      visit('/')
      expect(page).to have_content("Hello World")
    end
  end
end

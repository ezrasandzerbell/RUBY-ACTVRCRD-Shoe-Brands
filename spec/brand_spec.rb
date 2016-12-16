require('spec_helper')

describe(Brand) do
  describe('test Brand object') do
    it('test for name') do
      brand_test = Brand.create({:name => "Nike"})
      expect(brand_test.name).to(eq("Nike"))
    end
    it('successfully loads index') do
      brand_test = Brand.create({:name => "Adidas", :store_id => "1"})
      expect(brand_test.store_id).to(eq(1))
    end
  end
end

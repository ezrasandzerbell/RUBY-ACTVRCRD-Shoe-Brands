require('spec_helper')

describe(Brand) do
  describe('test Brand object') do
    it('test for name') do
      brand_test = Brand.create({:name => "Nike"})
      expect(brand_test.name).to(eq("Nike"))
    end
  end
end

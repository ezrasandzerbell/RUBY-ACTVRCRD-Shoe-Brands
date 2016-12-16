require('spec_helper')

describe(Store) do
  describe('test Store object') do
    it('test for name') do
      store_test = Store.create({:name => "Shoe World"})
      expect(store_test.name).to(eq("Shoe World"))
    end
    it('successfully loads index') do
      store_test = Store.create({:name => "Foot Locker", :brand_id => "1"})
      expect(store_test.brand_id).to(eq(1))
    end
  end
end

require('spec_helper')

describe(Store) do
  describe('test Store object') do
    it('test for name') do
      store_test = Store.create({:name => "Shoe World"})
      expect(store_test.name).to(eq("Shoe World"))
    end
    it("validates presence of description") do
    store = Store.new({:name => ""})
    expect(store.save()).to(eq(false))
    end
  end
end

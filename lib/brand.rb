class Brand < ActiveRecord::Base
  has_many(:stores)
end

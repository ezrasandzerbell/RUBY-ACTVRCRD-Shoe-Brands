class CreateTables < ActiveRecord::Migration[5.0]
  def change
    create_table(:brands) do |t|
     t.column(:name, :string)
     t.column(:store_id, :integer)
   end
   create_table(:stores) do |t|
     t.column(:name, :string)
     t.column(:brand_id, :integer)
   end
  end
end

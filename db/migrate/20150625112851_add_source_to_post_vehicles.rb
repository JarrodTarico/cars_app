class AddSourceToPostVehicles < ActiveRecord::Migration
  def change
    add_column :post_vehicles, :source, :string
  end
end

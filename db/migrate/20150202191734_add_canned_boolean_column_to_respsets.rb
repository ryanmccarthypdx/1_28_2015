class AddCannedBooleanColumnToRespsets < ActiveRecord::Migration
  def change
    change_table :respsets do |t|
      t.boolean :canned
    end
  end
end

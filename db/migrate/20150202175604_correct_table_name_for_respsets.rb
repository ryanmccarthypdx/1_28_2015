class CorrectTableNameForRespsets < ActiveRecord::Migration
  def change
    create_table(:respsets) do |t|
      t.string :name
    end
    drop_table(:respset)
  end
end

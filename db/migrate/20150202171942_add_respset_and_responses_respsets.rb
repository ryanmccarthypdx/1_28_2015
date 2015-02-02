class AddRespsetAndResponsesRespsets < ActiveRecord::Migration
  def change
    create_table(:respset) do |t|
      t.string :name
    end
    create_table(:responses_respsets) do |t|
      t.integer :response_id
      t.integer :respset_id
    end
  end
end

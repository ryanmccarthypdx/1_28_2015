class ReplaceM2mQuestionsResponseSetsWith12m < ActiveRecord::Migration
  def change
    drop_table :questions_response_sets
    change_table :questions do |t|
      t.integer :response_set_id
    end
  end
end

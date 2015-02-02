class AddJoinTableBetweenQuestionsAndResponseSets < ActiveRecord::Migration
  def change
    create_table :questions_response_sets do |t|
      t.integer :question_id
      t.integer :response_set_id
    end
  end
end

class RemoveResponsesQuestions < ActiveRecord::Migration
  def change
    drop_table :responses_questions
  end
end

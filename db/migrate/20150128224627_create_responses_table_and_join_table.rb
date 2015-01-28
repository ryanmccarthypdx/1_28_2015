class CreateResponsesTableAndJoinTable < ActiveRecord::Migration
  def change
    create_table(:responses) do |t|
      t.string(:answer)
    end
    create_table(:responses_questions) do |t|
      t.integer(:question_id)
      t.integer(:response_id)
    end
  end
end

class CreatesQuestionsTable < ActiveRecord::Migration
  def change
    create_table(:questions) do |t|
      t.integer :survey_id
      t.string :query
    end
  end
end

class CreateThreeWayTableLoggedResponses < ActiveRecord::Migration
  def change
    create_table :logged_responses do |t|
      t.integer :session_id
      t.integer :question_id
      t.integer :response_id
    end
    create_table :sessions do |t|
    end
  end
end

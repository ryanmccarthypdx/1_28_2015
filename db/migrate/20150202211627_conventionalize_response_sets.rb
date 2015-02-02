class ConventionalizeResponseSets < ActiveRecord::Migration
  def change
    rename_table :responsesets, :response_sets
    rename_table :responses_responsesets, :responses_response_sets
    rename_column :responses_response_sets, :responseset_id, :response_set_id
  end
end

class FixDamnResponseSetAlphabetization < ActiveRecord::Migration
  def change
    rename_table :responses_response_sets, :response_sets_responses
  end
end

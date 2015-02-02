class RenameRespsetsToResponsesets < ActiveRecord::Migration
  def change
    rename_table :respsets, :responsesets
    rename_table :responses_respsets, :responses_responsesets
    rename_column :responses_responsesets, :respset_id, :responseset_id 
  end
end

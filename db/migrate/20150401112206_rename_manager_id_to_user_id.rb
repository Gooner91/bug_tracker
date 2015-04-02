class RenameManagerIdToUserId < ActiveRecord::Migration
  def change
    rename_column :projects, :manager_id, :user_id
  end
end

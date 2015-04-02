class ChangeColumnNameBug < ActiveRecord::Migration
  def change
    rename_column :bugs, :type, :bug_type
  end
end

class AddReferenceOfProjectToBugs < ActiveRecord::Migration
  def change
    add_reference :bugs, :project, index: true
  end
end

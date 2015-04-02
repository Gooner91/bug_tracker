class AddReferenceToBugs < ActiveRecord::Migration
  def change
     add_reference :bugs, :creator, index: true
     add_reference :bugs, :developer, index: true
  end
end

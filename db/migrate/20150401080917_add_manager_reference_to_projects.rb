class AddManagerReferenceToProjects < ActiveRecord::Migration
  def change
    add_reference :projects, :manager, index: true
  end
end

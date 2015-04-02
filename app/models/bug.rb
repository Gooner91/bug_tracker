class Bug < ActiveRecord::Base
  validates_presence_of :title, :status, :bug_type
  validates :title, uniqueness: { scope: :project,
    message: "Already created a project with the same name" }
  validates_uniqueness_of :title
  belongs_to :creator, :class_name => "User"
  belongs_to :developer, :class_name => "User"
  belongs_to :project

  mount_uploader :image, ImageUploader
end

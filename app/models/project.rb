class Project < ActiveRecord::Base
  validates :title, uniqueness: { scope: :user,
    message: "Already created a project with the same name" }
  has_many :bugs
  belongs_to :user
  has_and_belongs_to_many :developers, :class_name => "User"
end

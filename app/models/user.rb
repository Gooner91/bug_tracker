class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :bugs_created, :foreign_key => "creator_id", :class_name => "Bug"
  has_many :bugs_to_fix, :foreign_key => "developer_id", :class_name => "Bug"
  has_many :projects
  has_and_belongs_to_many :working_projects, :foreign_key => "developer_id", :class_name => "Project"
end

class Team < ActiveRecord::Base
  attr_accessible :name, :supervisor_id
  
  has_many :memberships, :class_name => "TeamMembership"
  has_many :members, :through => :memberships, :source => :employee
  
  belongs_to :supervisor, :foreign_key => "supervisor_id",
             :class_name => "Employee"
             
end

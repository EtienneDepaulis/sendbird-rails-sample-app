class Member < ActiveRecord::Base
  belongs_to :user
  belongs_to :group

  validates_presence_of :user, :group
end

class User < ActiveRecord::Base

	has_many :members
  has_many :groups, through: :members

  def to_s
    name
  end
end

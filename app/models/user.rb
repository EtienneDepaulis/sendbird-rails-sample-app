class User < ActiveRecord::Base

	has_many :members
  has_many :groups, through: :members

  after_create :create_on_sendbird

  def to_s
    name
  end

  def create_on_sendbird
  	sendbird_user.create
  end

  def sendbird_user
  	Sendbird::User.new(nickname: name, id: sendbird_user_id)
  end

	def sendbird_user_id
		"user_#{id}"
	end

end

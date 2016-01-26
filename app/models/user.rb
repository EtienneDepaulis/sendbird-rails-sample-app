class User < ActiveRecord::Base

	has_many :members
  has_many :groups, through: :members

  after_create :create_on_sendbird

  def to_s
    name
  end

  def create_on_sendbird
  	return unless sendbird_id.nil?

  	sendbird_user = Sendbird::User.new(nickname: name, id: sendbird_user_id).create

  	self.sendbird_id = sendbird_user.user_id
  	save
  end

  def sendbird_user
  	Sendbird::User.new(nickname: name, id: sendbird_user_id, user_id: sendbird_id)
  end

  private

  	def sendbird_user_id
  		"user_#{id}"
  	end
end

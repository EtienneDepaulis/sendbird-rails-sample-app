class Group < ActiveRecord::Base

	has_many :members
  has_many :users, through: :members

  after_create :create_on_sendbird

  def to_s
    name
  end

  def add_user(user)
    users << user

    invite_user_on_sendbird(user)
  end

  def sendbird_group
    Sendbird::Messaging.new(name: name, channel_url: sendbird_channel_url)
  end

  def create_on_sendbird
    return unless sendbird_channel_url.nil?

    created_group = sendbird_group.create

    self.sendbird_channel_url = created_group.channel_url
    save
  end

  private

  	def invite_user_on_sendbird(user)
      sendbird_group.invite(user.sendbird_user)
  	end

end

class Group < ActiveRecord::Base

	has_many :members
  has_many :users, through: :members

  after_create :create_on_sendbird_and_save_url

  def to_s
    name
  end

  def add_user(user)
    users << user

    invite_user_on_sendbird(user)
  end

  private

  	def create_on_sendbird_and_save_url
  	end

  	def invite_user_on_sendbird(user)
  	end

end

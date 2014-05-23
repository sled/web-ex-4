class User < ActiveRecord::Base
  include Clearance::User
  include Authority::UserAbilities

  has_and_belongs_to_many :groups
  has_many :groups_as_owner, class_name: 'Group', foreign_key: 'owner_id', dependent: :destroy
  has_many :identities

  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true
  validates :location, presence: true, length: {maximum: 50}

  scope :without, lambda{|user| where.not(id: user.id) }


  def tweet(message)
    twitter_identity = self.identities.twitter.first

    if twitter_identity.present?
      client = Twitter::REST::Client.new do |config|
        config.consumer_key        = Rails.application.config.twitter_key
        config.consumer_secret     = Rails.application.config.twitter_secret
        config.access_token        = twitter_identity.token
        config.access_token_secret = twitter_identity.secret
      end
      client.update(message)
    end
  end
end

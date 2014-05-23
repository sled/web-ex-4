class Identity < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :uid, :provider
  #validates_uniqueness_of :uid, :scope => :provider

  scope :twitter, lambda{where(provider: 'twitter')}
end

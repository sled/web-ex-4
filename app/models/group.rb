class Group < ActiveRecord::Base
  include Authority::Abilities
  
  has_many :events, dependent: :destroy
  has_and_belongs_to_many :users, dependent: :destroy
  belongs_to :owner, class_name: 'User'

  delegate :name, to: :owner, prefix: true, allow_nil: true

  validates :name, presence: true, length: { maximum: 50 }
  validates :hometown, presence: true, length: {maximum: 50}
  validates :owner, presence: true
end

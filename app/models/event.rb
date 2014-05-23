class Event < ActiveRecord::Base
  attr_accessor :photo
  attr_accessor :start_date_str


  has_and_belongs_to_many :users
  belongs_to :group

  validates :group, presence: true
  validates :name, presence: true, length: {maximum: 50}
  validates :location, presence: true, length: {maximum: 50}
  validates :duration, presence: true, length: {maximum: 50}
  validates :description, presence: true, length: {maximum: 600}
  validates :start_date, presence: true

  validate :start_date_in_future

  scope :upcoming, lambda{where('events.start_date > ?', Time.now)}
  scope :finished, lambda{where('events.start_date < ?', Time.now)}

  # maybe use a counter cache, pretty inefficient query
  def self.by_popularity
    select('events.*,  SUM(popularity) AS event_popularity').
      joins('LEFT JOIN (SELECT events_users.event_id AS event_id, COUNT(*) AS popularity FROM events_users GROUP BY events_users.event_id) AS sq ON sq.event_id = events.id').
      group('events.id').
      order('event_popularity DESC, events.start_date DESC')
  end


  def upcoming?; start_date > Time.now  end
  def confirmed?; upcoming? && confirmed_at.present? end
  def finished?; start_date < Time.now end

  def photo=(id)
    begin
      photo_info              = Array.wrap(flickr.photos.getInfo(photo_id: id)).first
      self.photo_id           = photo_info.id
      self.photo_author       = photo_info.owner.realname
      self.photo_profile_url  = FlickRaw.url_profile(photo_info)
      self.cached_photo_url   = FlickRaw.url(photo_info)
      self.cached_thumb_url   = FlickRaw.url_q(photo_info)
    rescue FlickRaw::FailedResponse
      self.photo_id           = nil
      self.photo_author       = nil
      self.photo_profile_url  = nil
      self.cached_photo_url   = nil
      self.cached_thumb_url   = nil
    end
  end

  def photo
    self.photo_id
  end

  def start_date=(obj)
    if obj.is_a?(String)
      write_attribute(:start_date, (DateTime.strptime(obj, "%m/%d/%Y %H:%M %p") rescue nil))
    else
      write_attribute(:start_date, obj)
    end
  end

  protected


  def start_date_in_future
    if new_record? && start_date.present? && start_date < Time.now
      errors.add(:start_date, 'must be in the future') 
    end
  end
end

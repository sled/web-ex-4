class GroupAuthorizer < ApplicationAuthorizer
  # check only presence
  def self.creatable_by?(user)
    !!user
  end

  # must be part of the group in order to access it
  def readable_by?(user)
    resource.owner == user || resource.users.include?(user)
  end

  def updatable_by?(user)
    resource.owner == user
  end

  def likeable_by?(user)
    readable_by?(user)
  end
end
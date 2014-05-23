class VotingService
  def self.vote(user, event)
    if user.votes.for(event: event).exists?
      user.votes.for(event: event).destroy
    else
      user.votes.for(event: event).create!
    end
  end
end
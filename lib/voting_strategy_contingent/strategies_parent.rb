module VotingStrategyContingent
  class StrategiesParent
    def initialize(ballots)
      @ballots = ballots
    end

    protected

    def counted_votes_hash
      @counted_votes_hash ||= VotesCounter.new(all_votes).preferred
    end

    def all_votes
      @ballots.map(&:votes).flatten
    end

    def sorted_counted_votes_hash
      counted_votes_hash.sort_by { |k, v| v }.reverse
    end

    def empty_ballots
      @ballots.nil?
    end
  end
end
module VotingStrategyContingent
  class VotesCounter
    PREFERRED_POSITION = 1

    def initialize(votes)
      @votes = votes
    end

    def preferred
      count(PREFERRED_POSITION)
    end

    def count(position)
      @votes.inject({}) do |sum, vote|
        sum[vote.candidate] ||= 0
        sum[vote.candidate] += 1 if vote.position == position
        sum
      end
    end
  end
end
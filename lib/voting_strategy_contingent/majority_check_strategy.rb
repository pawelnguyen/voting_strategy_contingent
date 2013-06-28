module VotingStrategyContingent
  class MajorityCheckStrategy < StrategiesParent
    def winner
      return if empty_ballots
      [winning_candidate] if has_majority(winning_candidate)
    end

    protected

    def winning_candidate
      winning_vote[0]
    end

    def winning_vote
      sorted_counted_votes_hash.first
    end

    def has_majority(candidate)
      counted_votes_hash[candidate] > counted_votes_sum / 2
    end

    def counted_votes_sum
      counted_votes_hash.values.inject(0) {|sum, votes_num| sum + votes_num}
    end
  end
end
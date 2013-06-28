module VotingStrategyContingent
  class MajorityCheck
    def initialize(ballots)
      @ballots = ballots
    end

    def winner
      return if empty_ballots
      [winning_candidate] if has_majority(winning_candidate)
    end

    protected

    def empty_ballots
      @ballots.nil?
    end

    def winning_candidate
      winning_vote[0]
    end

    def winning_vote
      counted_votes_hash.sort_by { |k, v| v }.last
    end

    def counted_votes_hash
      @counted_votes_hash ||= @ballots.map(&:votes).flatten.inject({}) do |sum, vote|
        sum[vote.candidate] ||= 0
        sum[vote.candidate] += 1 if vote.position == 1
        sum
      end
    end

    def has_majority(candidate)
      counted_votes_hash[candidate] > counted_votes_sum / 2
    end

    def counted_votes_sum
      counted_votes_hash.values.inject(0) {|sum, votes_num| sum + votes_num}
    end
  end
end
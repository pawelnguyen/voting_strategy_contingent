module VotingStrategyContingent
  class SecondCountStrategy < StrategiesParent

    def winner
      return if empty_ballots

      result = Hash.new(0)
      @ballots.each do |ballot|
        result[best_candidate(ballot)] += 1
      end
      top_candidates(result)
    end

    protected

    def best_candidate(ballot)
      best_candidate = nil
      best_candidate_position = nil
      highest_voted_candidates.each do |candidate|
        current_ballot_vote = ballet_vote(ballot, candidate)
        if best_candidate_position.nil? || current_ballot_vote.position < best_candidate_position
          best_candidate_position = current_ballot_vote.position
          best_candidate = candidate
        end
      end
      best_candidate
    end

    def highest_voted_candidates(amount = 2)
      @highest_voted_candidates ||= sorted_counted_votes_hash[0..(amount - 1)].map(&:first)
    end

    def ballet_vote(ballot, candidate)
      ballot.votes.each do |vote|
        return vote if vote.candidate == candidate
      end
    end

    def top_candidates(result)
      best_result = result.values.max
      result.select {|k, v| v == best_result}.keys
    end
  end
end
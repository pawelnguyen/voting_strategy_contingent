require 'voting_strategy_contingent/version'
require 'voting_strategy_contingent/majority_check'

module VotingStrategyContingent
  class Strategy
    def result(ballots, candidates)
      @ballots = ballots
      @candidates = candidates

      majority_check_winner = MajorityCheck.new(@ballots).winner
      return majority_check_winner unless majority_check_winner.nil?

      ballots[0].votes.shuffle.map(&:candidate)
    end
  end
end

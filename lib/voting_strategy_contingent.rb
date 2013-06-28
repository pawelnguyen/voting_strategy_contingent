require 'voting_strategy_contingent/version'
require 'voting_strategy_contingent/votes_counter'
require 'voting_strategy_contingent/strategies_parent'
require 'voting_strategy_contingent/majority_check_strategy'
require 'voting_strategy_contingent/second_count_strategy'

module VotingStrategyContingent
  class Strategy
    def result(ballots, candidates)
      MajorityCheckStrategy.new(ballots).winner || SecondCountStrategy.new(ballots).winner
    end
  end
end

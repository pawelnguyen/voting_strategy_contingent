require 'voting_strategy_schulze/version'

module VotingStrategySchulze
  class Strategy
    def result(candidates, ballots)
      ballots[0].votes.shuffle.map(&:candidate)
    end
  end
end

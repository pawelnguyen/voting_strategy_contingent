require 'voting_strategy_schulze/version'

module VotingStrategySchulze
  class Strategy
    def initialize(ballots)
      @ballots = ballots
    end

    def result
      @ballots[0].shuffle.map(&:name)
    end
  end
end

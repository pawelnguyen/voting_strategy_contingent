require File.dirname(__FILE__) + '/../spec_helper'

include VotingStrategyContingent

describe 'MajorityCheck' do

  Ballot = Struct.new(:votes)
  Vote = Struct.new(:candidate, :position)

  describe 'winner' do
    subject { VotingStrategyContingent::MajorityCheck.new(ballots).winner }

    let(:ballots) {
      [Ballot.new(votes_1), Ballot.new(votes_2)]
    }

    let(:votes_1) { [Vote.new(candidate_1, 1), Vote.new(candidate_2, 2)] }
    let(:votes_2) { [Vote.new(candidate_1, 1), Vote.new(candidate_2, 2)] }

    let(:candidate_1) { 'Candidate1' }
    let(:candidate_2) { 'Candidate2' }

    context 'empty ballots, candidates' do
      let(:ballots) { nil }
      it { should be_nil }
    end

    context 'one winning candidate' do
      it { should eq [candidate_1] }

      context 'four voters, four candidates' do
        let(:candidate_3) { 'Candidate3' }
        let(:candidate_4) { 'Candidate4' }
        let(:votes_1) { [Vote.new(candidate_1, 1), Vote.new(candidate_2, 2), Vote.new(candidate_3, 3), Vote.new(candidate_4, 4)] }
        let(:votes_2) { [Vote.new(candidate_1, 1), Vote.new(candidate_2, 2), Vote.new(candidate_3, 3), Vote.new(candidate_4, 4)] }
        let(:votes_3) { [Vote.new(candidate_1, 2), Vote.new(candidate_2, 1), Vote.new(candidate_3, 3), Vote.new(candidate_4, 4)] }
        let(:votes_4) { [Vote.new(candidate_1, 2), Vote.new(candidate_2, 3), Vote.new(candidate_3, 1), Vote.new(candidate_4, 4)] }
        let(:ballots) {
          [Ballot.new(votes_1), Ballot.new(votes_2), Ballot.new(votes_3), Ballot.new(votes_4)]
        }
        it { should be_nil }
      end
    end

    context 'no winning candidates' do
      let(:votes_2) { [Vote.new(candidate_1, 2), Vote.new(candidate_2, 1)] }
      it { should be_nil }
    end
  end
end
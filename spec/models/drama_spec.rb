require 'spec_helper'

describe Drama do
  let(:current_user) { User.new }

  describe :can_vote? do

    context "provided user is not the creator" do
      before do
        subject.creator = User.new
      end

      context "user has already voted for drama" do
        before do
          subject.should_receive(:voters).and_return [current_user]
        end

        it "returns false" do
          subject.can_vote?(current_user).should be_false
        end
      end

      context "user has not voted for drama" do
        it "returns true" do
          subject.can_vote?(current_user).should be_true
        end
      end
    end

    context "provided user is the creator" do
      before do
        subject.creator = current_user
      end

      it "retruns false" do
        subject.can_vote?(current_user).should be_false
      end
    end
  end

  describe :days_without_drama do
    it "returns the difference in days from last drama to today" do
      last_drama = Drama.new
      last_drama.drama_at = 5.days.ago

      Drama.days_without_drama(last_drama).should eq(5)
    end
  end

  describe :upvote_by do
    let(:vote) { Vote.new }

    before do
      vote.stub(:save!)
      subject.stub_chain(:votes, :build).and_return vote
      subject.upvote_by current_user
    end

    it "sets the provided user as the voter" do
      vote.voter.should be(current_user)
    end
  end

  describe :add_drama_at do
    let(:timestamp) { Time.at(111111111111) }

    context "drama_at is not set" do
      before do
        subject.drama_at = nil
      end

      it "sets new drama_at date" do
        Time.stub(:now).and_return timestamp

        subject.add_drama_at
        subject.drama_at.should == Time.zone.now
      end
    end

    context "drama_at is already set" do
      before do
        subject.drama_at = timestamp
      end

      it "leaves it alone" do
        subject.add_drama_at.should == timestamp
      end
    end
  end

  describe :expired? do
    context "created at later than allowed hours" do
      before do
        subject.created_at = Drama::EXPIRATION_HOURS + 10
      end

      it "returns true" do
        subject.expired?.should be_true
      end
    end

    context "created at recently" do
      before do
        subject.created_at = 1.hour.ago
      end

      it "returns false" do
        subject.expired?.should be_false
      end
    end
  end
end

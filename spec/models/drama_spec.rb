require 'spec_helper'

describe Drama do
  describe :can_vote? do
    let(:current_user) { User.new }

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

  context :days_without_drama do
    it "returns the difference in days from last drama to today" do
      last_drama = Drama.new
      last_drama.drama_at = 5.days.ago

      Drama.days_without_drama(last_drama).should eq(5)
    end
  end

  context :add_drama_at do
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
end

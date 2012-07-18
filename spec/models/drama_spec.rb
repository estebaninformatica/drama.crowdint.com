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
end

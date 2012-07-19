require 'spec_helper'

describe Streak do
  describe ".best_streak" do
    context "a streak exists" do
      it "returns the max value found for days_without_drama" do
        subject.stub(:days_without_drama).and_return(10)

        Streak.stub_chain(:ordered_by_days_without_drama_desc, :first).
            and_return subject

        Streak.best_streak.should eq(10)
      end
    end

    context "no streak exists" do
      it "returns 0" do
        Streak.stub_chain(:ordered_by_days_without_drama_desc, :first).
            and_return nil
        Streak.best_streak.should eq(0)
      end
    end
  end
end

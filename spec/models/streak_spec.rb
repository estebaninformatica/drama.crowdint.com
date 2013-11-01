require 'spec_helper'

describe Streak do
  describe ".best_streak" do

    let(:current_streak) { 5 }

    context "a streak exists" do
      context "and is max than current streak" do
        it "returns the max value found for Drama.days_without_drama" do
          subject.stub(:days_without_drama).and_return(10)

          Streak.stub_chain(:ordered_by_days_without_drama_desc, :first).
              and_return subject

          Drama.stub(:days_without_drama).and_return(current_streak)

          Streak.best_streak.should eq(10)
        end
      end

      context "and is min than current streak" do
        it "returns current streak" do
          subject.stub(:days_without_drama).and_return(1)

          Streak.stub_chain(:ordered_by_days_without_drama_desc, :first).
              and_return subject

          Drama.stub(:days_without_drama).and_return(current_streak)

          Streak.best_streak.should eq(current_streak)
        end
      end

    end

    context "no streak exists" do
      it "returns current streak" do
        Streak.stub_chain(:ordered_by_days_without_drama_desc, :first).
            and_return nil

        Drama.stub(:days_without_drama).and_return(current_streak)

        Streak.best_streak.should eq(current_streak)
      end
    end
  end
end

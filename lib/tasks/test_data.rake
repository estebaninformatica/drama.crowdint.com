namespace :load do
  desc "Create random data to test the system"
  task :data => :environment do
    raise "DATA FOUND: Run rake db:schema:load first" if User.count > 0

    # 10 users
    9.times do |i|
      User.create! email: "test#{i}@crowdint.com"
    end

    @users = User.all

    # Fake dramas with 9 votes
    10.times do |i|
    	drama = random_drama

      @users.each do |user|
        drama.upvote_by user
      end
    end

  	random_drama
  end
end

def random_drama
  drama = Drama.new description: Faker::Lorem.paragraph
  drama.creator = @users.sample
  drama.save!

  drama
end

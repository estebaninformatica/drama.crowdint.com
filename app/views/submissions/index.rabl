collection :@dramas => :submissions
attributes :id, :description, :drama_at, :created_at
node(:votes) { |drama| drama.votes.count }
node(:user_can_vote) {|drama| drama.can_vote?(current_user)}

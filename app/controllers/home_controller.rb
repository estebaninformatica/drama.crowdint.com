class HomeController < ApplicationController
  def show
    # Have to call all so I can get the last drama for the
    # second statement
    @dramas = Drama.all_ordered_and_published.all
    @days_without_drama = Drama.days_without_drama
  end
end

class HomeController < ApplicationController
  def show
    @dramas = Drama.all_ordered
    @days_without_drama = Drama.days_without_drama
  end
end

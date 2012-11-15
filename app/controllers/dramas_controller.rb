class DramasController < ApplicationController
  respond_to :json

  def index
    @dramas = Drama.all_ordered_and_published
    respond_with @dramas
  end
end

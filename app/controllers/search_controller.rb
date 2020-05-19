class SearchController < ApplicationController
  def index
    @members = Potter::Character.phoenix_members_by_house(params[:house])
  end
end

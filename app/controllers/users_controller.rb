class UsersController < ApplicationController
  def show
    @data = GithubService.get_user_data
  end
end

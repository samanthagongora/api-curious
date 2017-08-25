class UsersController < ApplicationController
  def show
    @data = GithubService.get_user_data(current_user)
  end
end

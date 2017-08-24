class UsersController < ApplicationController
  def show
    @conn = Faraday.new('https://api.github.com/') do |faraday|
          faraday.headers['Authorization'] = "token #{current_user.token}"
          faraday.adapter Faraday.default_adapter
    end

    response = @conn.get "/user"

    @data = JSON.parse(response.body, symbolize_names: true)
  end
end

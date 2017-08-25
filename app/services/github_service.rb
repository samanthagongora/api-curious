class GithubService
  def initialize(user)
    @user = user
    @conn = Faraday.new('https://api.github.com/') do |faraday|
            faraday.headers['Authorization'] = "token #{user.token}"
            faraday.adapter Faraday.default_adapter
    end
  end

  def user_data
    get_url("/user")
  end

  def get_url(url)
    response = @conn.get(url).body
    JSON.parse(response, symbolize_names: :true)
  end

  def self.get_user_data(user)
    new(user).user_data
  end
end

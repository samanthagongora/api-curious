class GithubService
  @conn = Faraday.new('https://api.github.com/') do |faraday|
        faraday.headers['Authorization'] = "token #{current_user.token}"
        faraday.adapter Faraday.default_adapter
  end

  def get_user_data
    get_url("/user")
  end

  def get_url(url)
    response = @conn.get(url).body
    JSON.parse(response, symbolize_names: :true)[:results]
  end

  def self.get_user_data
    new.get_user_data
  end
end

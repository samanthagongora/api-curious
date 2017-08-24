module OmniauthMacros
  def mock_auth_hash
    OmniAuth.config.mock_auth[:github] = {
      provider:     'github',
      uid:          ENV['user_id'],
      info:         {name: 'Samantha Gongora'},
      credentials:  {token: ENV['user_token']}
    }
  end
end

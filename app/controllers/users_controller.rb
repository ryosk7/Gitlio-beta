class UsersController < ApplicationController
  def show
    @user = current_user
    basic_data = Faraday.get("https://api.github.com/user?access_token=#{@user.token}")
    followers_data = Faraday.get("https://api.github.com/users/#{@user.login}/followers?access_token=#{@user.token}")
    @user.assign_followers(JSON.parse(followers_data.body, symbolize_names: true))
    @user.basic_info(JSON.parse(basic_data.body, symbolize_names: true))
  end
end

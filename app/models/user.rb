class User < ApplicationRecord

  has_many :starred_repos
  has_many :followers
  has_many :followed_users

  def self.from_omniauth(auth)
    create! do |user|
      user.provider = auth[:provider]
      user.uid = auth[:uid]
      user.name = auth[:extra][:raw_info][:name]
      user.login = auth[:extra][:raw_info][:login]
      user.token = auth[:credentials][:token]
    end
  end

  def basic_info(profile_data)
    assign_attributes(avatar_url: profile_data[:avatar_url])
  end

  def assign_followers(follower_data)
    follower_data.each do |follower|
      Follower.find_or_create_by(follower_uid: follower[:id], name: follower[:login], user: self)
    end
  end
end

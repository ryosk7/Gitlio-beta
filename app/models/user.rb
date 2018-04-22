class User < ApplicationRecord

  has_many :starred_repos
  has_many :followers
  has_many :followed_users

  def self.from_omniauth(response_data)
    where(uid: response_data[:uid]).first_or_create do |user|
      user.uid = response_data[:uid]
      user.name = response_data[:extra][:raw_info][:name]
      user.login = response_data[:extra][:raw_info][:login]
      user.token = response_data[:credentials][:token]
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

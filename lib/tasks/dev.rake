task sample_data: :environment do
  p "Creating sample data..."


  FollowRequest.delete_all
  Comment.delete_all
  Like.delete_all
  Photo.delete_all
  User.delete_all

  # Table name: users
#
#  id                     :bigint           not null, primary key
#  comments_count         :integer          default(0)
#  email                  :citext           default(""), not null
#  encrypted_password     :string           default(""), not null
#  likes_count            :integer          default(0)
#  private                :boolean          default(TRUE)
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  username               :citext
#  created_at             :datetime         not null
#  updated_at             :datetime         not null

usernames = Array.new { Faker::Name.first_name }

  10.times do
    usernames << Faker::Name.first_name
  end

  usernames << "will"
  usernames << "admin"

  usernames.each do |username|
    name = username
    User.create(
      email: "#{username}@example.com",
      password: "password",
      username: username,
      private: [true, false].sample,
    )
  end

  p "#{User.count} users have been created."
  
  users = User.all

  users.each do |first_user|
    users.each do |second_user|
      if rand() < 0.75
        first_user.sent_follow_requests.create(
          recipient: second_user,
          status: FollowRequest.statuses.values.sample
        )
      end

      if rand() < 0.75
        second_user.sent_follow_requests.create(
          recipient: first_user,
          status: FollowRequest.statuses.values.sample
        )
      end
    end
  end

  users.each do |user|
    rand(15).times do
      photo = user.own_photos.create(
        caption: Faker::Quote.jack_handey,
        image: "https://robohash.org/#{rand(9999)}"
      )

      user.followers.each do |follower|
        if rand < 0.5
          photo.fans << follower
        end

        if rand < 0.25
          photo.comments.create(
            body: Faker::Quote.jack_handey,
            author: follower
          )
        end
      end
    end
  end

  p "There are now #{FollowRequest.count} follow requests."
  p "There are now #{Photo.count} photos."
  p "There are now #{Like.count} likes."
  p "There are now #{Comment.count} comments."

end
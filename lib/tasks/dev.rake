task :sample_data do
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

x = 30

  for i in 1..x do
    user = User.new
    user.email = Faker::Internet.email
    user.encrypted_password = "$2a$12$ZH887xOQ2Goghx/fRSVQrObrunPYPlbvFt1Gt7DiZ.ZCABSn3rAPG"
    user.username = Faker::IDNumber.valid
    user.private = rand(0,1)

    
  end

  Faker

  
  

end
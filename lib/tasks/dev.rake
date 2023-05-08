if Rails.env.development? || Rails.env.test?
  namespace :dev do
    desc "Add sample data for development environment"
    task sample_data: :environment do
      5.times do |i|
        # create sample user
        name = Faker::Creature::Animal.name
        username = "#{name}-#{i}"
        user = User.find_or_create_by(username: username, email: "#{username}@example.com") do |u|
          u.password = "password"
        end

        # create post by user
        user.posts.create(content: Faker::Lorem.paragraph)

        # make comment on random post
        Post.all.sample.comments.create(
          user: user,
          content: Faker::Movies::Lebowski.quote,
        )
      end
    end
  end
end

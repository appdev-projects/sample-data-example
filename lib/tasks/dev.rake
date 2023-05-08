unless Rails.env.production?
  namespace :dev do
    desc "TODO"
    task sample_data: :environment do
      puts "adding sample data"
      5.times do |i|
        # add 5 users
        name = Faker::Creature::Cat.name.split(" ").join("-").downcase
        username = "#{name}-#{i}"
        user = User.create(
          email: "#{username}@example.com",
          username: username,
          password: "password",
        )
        # add a post

        post = user.posts.create(
          content: Faker::Fantasy::Tolkien.character,
        )
        # make a comment on a random post
        user.comments.create(
          post: Post.all.sample,
          content: Faker::Music::Prince.lyric,
        )
      end
      puts "done"
    end
  end
end

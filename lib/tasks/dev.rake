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

    task add_cities: :environment do
      puts "adding cities"

      require "csv"

      csv_text = File.read(Rails.root.join("lib", "sample_data", "cities.csv"))
      csv = CSV.parse(csv_text, :headers => true, :encoding => "ISO-8859-1")
      csv.each do |row|
        # {"City"=>"Robbins", "State short"=>"IL", "State full"=>"Illinois", "County"=>"COOK", "City alias"=>"Robbins"}
        City.find_or_create_by(
          name: row.fetch("City"),
          state_short: row.fetch("State short"),
          state_full: row.fetch("State full"),
        )
      end
    end
  end
end

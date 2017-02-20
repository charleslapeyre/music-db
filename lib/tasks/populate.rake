namespace :db do
  desc "Clear the database and fill is with sample data"
  task populate: :environment do
    require 'populator'
    require 'faker'

  # clear out old junk
    [Genre, Artist, Song].each do |i|
      i.destroy_all
    end

    # add genres artist and songs
    Genre.all.each do |genre|
      # genre.name = Faker::Hacker.noun

      Artist.populate 5..10 do |artist|
        artist.name = Faker::Name.first_name
        artist.genre_id = genre.id

        Song.populate 10..20 do |song|
          song.name = Faker::Company.catch_phrase
          song.artist_id = artist.id
        end
      end
    end
  # show a done message
    puts "booya, done populating"
  end
end
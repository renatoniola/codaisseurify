# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Song.destroy_all
Artist.destroy_all

motor = Artist.create!( name: 'motorpsycho' ,
   bio: 'motorpsycho is simply dummy text of the printing and typesetting industry.
   Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s,' )

afghan = Artist.create!( name: 'afghan whigs' ,
    bio: 'afghan whigs is simply dummy text of the printing and typesetting industry.
    Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s,')

dire = Artist.create!( name: 'dire straits' ,
    bio: 'dire straits is simply dummy text of the printing and typesetting industry.
    Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s,' )

biber = Artist.create!( name: 'justin biber',
    bio: 'justin biber is simply dummy text of the printing and typesetting industry.
    Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s,')

song1 = Song.create!(title: 'sinful , wind-borne' , artist: motor)
song2 = Song.create!(title: 'drug thing' , artist: motor)
song3 = Song.create!(title: 'greener' , artist: motor)
song4 = Song.create!(title: 'S.T.G.' , artist: motor)

song5 = Song.create!(title: 'neglekted' , artist: afghan)
song6 = Song.create!(title: 'my curse' , artist: afghan)
song7 = Song.create!(title: 'gentlemen' , artist: afghan)
song8 = Song.create!(title: 'debonair' , artist: afghan)

song9 = Song.create!(title: 'money for nothing' , artist: dire)
song10 = Song.create!(title: 'tunnel of love' , artist: dire)
song11 = Song.create!(title: 'lady writer' , artist: dire)
song12 = Song.create!(title: 'sultan of swing' , artist: dire)

song13 = Song.create!(title: 'F.Y. justin' , artist: biber)
song14 = Song.create!(title: 'i am a turd' , artist: biber)
song15 = Song.create!(title: 'is this music? really?' , artist: biber)
song16 = Song.create!(title: 'what a douche' , artist: biber)

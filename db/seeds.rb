# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


User.create(user_name: 'Blackbeard', email: 'black@beard.com')
User.create(user_name: 'Schmee', email: 'schmee@hook.org')
User.create(user_name: 'HenryMorgan', email: 'henry@henrymorgan.com')
User.create(user_name: 'Captain Drake', email: 'theboss@theseas.com')


Song.create(title: 'Jolly Rovin Tar', origin: 'England', image: 'http://www.traditionalmusic.co.uk/irish-songs-ballads-lyrics/irish-lyrics-png/jolly_roving_tar.png')
Song.create(title: 'Whiskey in the Jar', origin: 'England', image: 'https://rigandjeels.files.wordpress.com/2011/12/whiskey-int-jar-lyrics.jpg')
Song.create(title: 'Whiskey You are the Devil', origin: 'Ireland', image: 'http://www.traditionalmusic.co.uk/irish-songs-ballads-lyrics/irish-lyrics-png/whisky_youre_the_devil.png')
Song.create(title: 'All For Me Grog', origin: 'England')

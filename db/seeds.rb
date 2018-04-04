babys = Venue.create(name: "Baby's All Right", bio: "Cool haunt offering live music most nights, plus gourmet bar fare, creative drinks & weekend brunch.", address: "46 Broadway, Brooklyn, NY 11211", username: "babys", password: "password")
babys.save


elsewhere = Venue.create(name: "Elsewhere", bio: "Elsewhere is a live music venue, nightclub & arts space in Brooklyn built to celebrate creativity and instigate multi-disciplinary experimentation.", address: "599 Johnson Ave, Brooklyn, NY 11237", username: "elsewhere", password: "password")
elsewhere.save

pcourts = Artist.create(name: "Parquet Courts", bio: "American rock band formed in New York City in 2010.", username: "pcourts", password: "password")
pcourts.save

casanova = Artist.create(name: "Casanova", bio: "Brooklyn rapper known as Casanova who became popular for producing catchy street bangers such as his debut single 'Don't Run.'", username: "casanova", password: "password")
casanova.save

sfemales = Artist.create(name: "Screaming Females", bio: "Formed in New Brunswick, NJ in 2005, Screaming Females are Marissa Paternoster (guitar, vox), Mike Abbate (bass), and Jarrett Dougherty (drums).", username: "sfemales", password: "password")

rodhad = Artist.create(name: "Rødhåd", bio: "Rødhåd has been socialized by Berlin's looptechno nights and always finds the perfect balance of timeless techno to lift the dancefloor higher and higher.", username: "rodhad", password: "password")
rodhad.save

names = %w[Josefina Shawnee Norah Lanette Robbi Tomas Dustin Lashandra Ronny Lucas]

names.each do |n|
	fan = Fan.create(name: n, username: n, password: "password")
	fan.save
end




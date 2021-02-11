pooplo = User.create(user_name: "pooplo", email: "pooplo@pooplo.com", password: "password")
peep = User.create(user_name: "peeplo", email: "peeplo@peeplo.com", password: "password")
mars = User.create(user_name: "mars", email: "mars@bitchslut.com", password:"password")
a1 = Anime.create(name:"inuyasha")
a2 = Anime.create(name:"attack on titan")
a3 = Anime.create(name:"demon slayer")
list = List.create(name: "my poop list")
list.animes << a1
list.animes << a2
list.animes << a3
pooplo.lists << list

User.find(1).profile = Profile.new(name: "pooplo", bio: "Write your bio here!", age: 0, favorite_series: "Enter your favorite series here!")
User.find(2).profile = Profile.new(name: "peep", bio: "Write your bio here!", age: 0, favorite_series: "Enter your favorite series here!")
User.find(3).profile = Profile.new(name: "mars", bio: "Write your bio here!", age: 0, favorite_series: "Enter your favorite series here!")
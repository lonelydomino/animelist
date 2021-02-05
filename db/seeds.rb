pooplo = User.create(user_name: "pooplo", email: "pooplo@pooplo.com", password: "password")
a1 = Anime.create(name:"inuyasha")
a2 = Anime.create(name:"attack on titan")
a3 = Anime.create(name:"demon slayer")
list = List.create(name: "my poop list")
list.animes << a1
list.animes << a2
list.animes << a3
pooplo.lists << list

a = User.create(user_name: "bob", email: "bob@gmail.com", password: "password")
b = User.create(user_name: "joe", email: "joelo@gmail.com", password: "password")
c = User.create(user_name: "steve   ", email: "steve@gmail.com", password:"password")

User.find(1).profile = Profile.new(name: "Bob", bio: "Write your bio here!", age: 24, favorite_series: "Enter your favorite series here!")
User.find(2).profile = Profile.new(name: "Joe", bio: "Write your bio here!", age: 44, favorite_series: "Enter your favorite series here!")
User.find(3).profile = Profile.new(name: "Steve", bio: "Write your bio here!", age: 33, favorite_series: "Enter your favorite series here!")
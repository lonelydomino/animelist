# Specifications for the Sinatra Assessment

Specs:
- [x] Use Sinatra to build the app
- [x] Use ActiveRecord for storing information in a database
- [x] Include more than one model class (e.g. User, Post, Category)
- [x] Include at least one has_many relationship on your User model (e.g. User has_many Posts)
- [x] Include at least one belongs_to relationship on another model (e.g. Post belongs_to User)
- [x] Include user accounts with unique login attribute (username or email)
- [x] Ensure that the belongs_to resource has routes for Creating, Reading, Updating and Destroying
- [?] Ensure that users can't modify content created by other users
- [?] Include user input validations
- [x] BONUS - not required - Display validation failures to user with error message (example form URL e.g. /posts/new)
- [ ] Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code

Confirm
- [X] You have a large number of small Git commits
- [X] Your commit messages are meaningful
- [X] You made the changes in a commit that relate to the commit message
- [X] You don't include changes in a commit that aren't related to the commit message

Things to do:
- [ ] make pages of anime from search?
- [ ] add more anime details?
- [ ] make back button on anime details page go back to last page and add list index button
- [ ] fix back button after creating a list
- [ ] take away edit button on profile if not the user
- [ ]@list = List.find(params["id"])#How to account for this failing if user types ID into address bar?
- [ ] format the anime detail page better so image displays on the left, buttons at bottom, title at top and description at right
- [ ] fix crashing from a user typing in an anime id that doesnt exist in address bar
- [ ] are we supposed to account for user typing random gibberish into address bar?

- Profile page(show) mostly complete. Maybe make it auto adjust profile card width to account for larger bios. edit button takes you back up and makes you click edit a 2nd time

- [ ] whats the best way to deal with empty forms slots?
- [ ] hide API key?
- [ ] SELECTIOn border after clicking on back buttons?
- [ ]  <input type="button" value="Go back!" onclick="history.back()"> go back to any page EXCEPT  creation page?
- [ ] animes such as mui d and batman beyond titles still not shwoing

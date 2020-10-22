# Specifications for the Sinatra Assessment

Specs:
- [x] Use Sinatra to build the app: 
    Uses Sinatra gem to build a Sinatra web app with ruby
- [x] Use ActiveRecord for storing information in a database: 
    Each model inherits from Active Record Base
- [x] Include more than one model class (e.g. User, Post, Category): 
    There is a User model and a Vinyl model
- [x] Include at least one has_many relationship on your User model (e.g. User has_many Posts):
    A user has_many vinyl (macro in model)
- [x] Include at least one belongs_to relationship on another model (e.g. Post belongs_to User):
    Vinyl belongs_to a user (macro in model)
- [X] Include user accounts with unique login attribute (username or email):
    Username and email uniqueness is validated using the validates ruby method.
- [X] Ensure that the belongs_to resource has routes for Creating, Reading, Updating and Destroying:
    A user can add new Vinyl to their collection, see their list of vinyl and individual records, edit existing records, and delete records.
- [X] Ensure that users can't modify content created by other users
    Enabled Sinatra Sessions
- [X] Include user input validations
    User model validates email and password uniqueness and presence 
- [ ] BONUS - not required - Display validation failures to user with error message (example form URL e.g. /posts/new)
- [x] Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code

Confirm
- [X] You have a large number of small Git commits:
    Definitely should have had more commits! But commited whenever I thought about it.
- [X] Your commit messages are meaningful:
    Quick simple messages about each commit.
- [X] You made the changes in a commit that relate to the commit message
- [X] You don't include changes in a commit that aren't related to the commit message:
    A couple times, I forgot to mention updating this spec, but other changes were accounted for.
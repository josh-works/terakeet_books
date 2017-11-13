# README

## Notes on this project

The process of writing code is just as important as the code actually written. (I.E. the right code for the wrong solution is still bad code) so, were I working for Terakeet, step one would be to make sure I fully understand the problem space.

Some of the questions that would spring to mind are, if I were handed this spec:
- Who would be using this tool? Terakeet's customers or employees?
- Can I have access to some of the conversation around this new feature, so I can load up on the context?
- What sort of sad paths should I build? Should it fail "silently and gracefully", or perhaps in a more verbose but ugly way? (I'll just design my own sad paths for now)

This is the schema I put together, based on the instructions:

![schema](WWW_SQL_Designer_-_default.jpg)


I'll be writing just the `book` model, but I would obviously have lots of room to explore and define the relationships between existing models in the codebase and the new one I was working on. Unless instructed otherwise, I'd drop in a few unit and feature tests that pass before I even started writing new code. Those would help serve as guardrails to make sure I didn't cause problems elsewhere. I'd timebox this "guardrail code" to just an hour or so, though. A small investment.


### step 1 - 5-ish

Obviously the `Book::search()` will be the more interesting method, but to get there, and get there well, I'd like to have the model well-defined, as well as some factories set up that tests all aspects of the relationships.

I've set up all of the migrations, models, factories, and association/validation tests for:

- authors
- book_format_types
- book_formats
- books
- publishers
- book_reviews

and built a small seed file for all of these: `$ rake db:seed` will give you objects to play with in the console.

### Step 6 Book#instance_methods

Three instance methods:

`book_format_types` => super simple. This is a test of the MTM associations between `book` <> `book_formats` <> `book_format_types`.

It didn't require any methods in the `book` model, even though I wrote a test for this method, and placed it in `/spec/models/book_spec.rb`.

`author_name` => also very, very simple. Just return `l_name, f_name`, and done. I went ahead and added a test and a similar method name in the `author.rb`, called `#name`, and it prints out the author's name as `f_name l_name`. Seemed like an appropriate method to be able to call on an `author` object.

`average_rating` => I simply plucked the values of the ratings, did a `reduce` to get the total, then divided by the count of the ratings, and it worked. It's a bit of an anti-pattern to mix ActiveRecord and Ruby, so I am going to clean that method up.

### Step 7 Book::search

`Book::search(query, options)` =>

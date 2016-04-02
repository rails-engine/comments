# Comments

Comment feature for any applications's any models.

[![Gem Version](https://badge.fury.io/rb/comments.svg)](https://badge.fury.io/rb/comments) [![Build Status](https://travis-ci.org/rails-engine/comments.svg)](https://travis-ci.org/rails-engine/comments) [![Code Climate](https://codeclimate.com/github/rails-engine/comments/badges/gpa.svg)](https://codeclimate.com/github/rails-engine/comments) [![codecov.io](https://codecov.io/github/rails-engine/comments/coverage.svg?branch=master)](https://codecov.io/github/rails-engine/comments?branch=master) [![](http://inch-ci.org/github/rails-engine/comments.svg?branch=master)](http://inch-ci.org/github/rails-engine/comments?branch=master)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'comments'
```

And then execute:

```bash
$ bundle
```

## Mount engine

in `config/routes.rb`

```rb
mount Comments::Engine => "/comments"
```

## In view, render comment list:

```erb
# app/views/posts/show.html.erb

<%= comments_tag(@post) %>
```

## Contributing

Contribution directions go here.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

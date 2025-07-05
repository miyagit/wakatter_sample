# RSpec Tests for Model Instance Methods

This directory contains RSpec tests specifically for instance methods in the models, along with the corresponding FactoryBot factories.

## Setup

The following gems have been added to the Gemfile:
- `rspec-rails` - RSpec testing framework for Rails
- `factory_bot_rails` - Factory library for creating test data

## Test Files

### Spec Files
- `spec/models/post_spec.rb` - Tests for Post model instance methods
- `spec/models/user_spec.rb` - Tests for User model instance methods

### Factory Files
- `spec/factories/categories.rb` - Factory for Category model
- `spec/factories/users.rb` - Factory for User model
- `spec/factories/posts.rb` - Factory for Post model
- `spec/factories/post_likes.rb` - Factory for PostLike model
- `spec/factories/post_comments.rb` - Factory for PostComment model
- `spec/factories/follows.rb` - Factory for Follow model

## Instance Methods Tested

### Post Model
- `liked_by?(user)` - Tests whether a specific user has liked the post
  - Tests when user has liked the post (returns true)
  - Tests when user has not liked the post (returns false)
  - Tests when different users have liked the post

### User Model
- `follow(user)` - Tests adding a user to the following list
  - Tests following a new user
  - Tests following an already followed user (should not duplicate)
- `unfollow(user)` - Tests removing a user from the following list
  - Tests unfollowing a followed user
  - Tests unfollowing a user not being followed
- `following?(user)` - Tests whether the user is following another user
  - Tests when user is following another user (returns true)
  - Tests when user is not following another user (returns false)
  - Tests after unfollowing a user (returns false)

## Running the Tests

To run all model tests:
```bash
bundle exec rspec spec/models/
```

To run specific test files:
```bash
bundle exec rspec spec/models/post_spec.rb
bundle exec rspec spec/models/user_spec.rb
```

To run with documentation format:
```bash
bundle exec rspec spec/models/ --format documentation
```

## Database Requirements

These tests require a database connection. Ensure your test database is set up and migrated:
```bash
rails db:test:prepare
```

## Note

All tests focus specifically on instance methods only, as requested. The factories create minimal test data needed to test the methods without interfering with existing application functionality.
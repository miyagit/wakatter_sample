# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Commands

- **Install Gems**: `bundle install`
- **Create Database**: `rails db:create`
- **Run Migrations**: `rails db:migrate`
- **Seed Database**: `rails db:seed`
- **Install Frontend Dependencies**: `yarn install`
- **Start Rails Server**: `rails s`
- **Start Webpack Dev Server**: `./bin/webpack-dev-server`
- **Run RSpec tests**: `bundle exec rspec` (based on `spec/` directory)

## Architecture

This is a Ruby on Rails application with a standard MVC (Model-View-Controller) architecture.

- **`app/models`**: Contains the application's data models, representing database tables and business logic.
- **`app/views`**: Contains ERB templates for rendering the user interface.
- **`app/controllers`**: Handles incoming requests, interacts with models, and prepares data for views.
- **`app/assets`**: Contains static assets like stylesheets, JavaScript, and images.
- **`app/frontend`**: Likely contains JavaScript code managed by Webpacker, potentially including components or other frontend-specific logic.
- **`config/routes.rb`**: Defines the application's URL routes and maps them to controller actions.
- **`db/migrate`**: Contains database migration files for schema changes.
- **`spec/`**: Contains RSpec tests for the application.
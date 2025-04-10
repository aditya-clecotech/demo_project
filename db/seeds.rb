# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?



Post.create(title: "Exploring the Rails Magic", content: "Rails makes web dev fun and efficient!", user_id: 4)
Post.create(title: "Why I Love Ruby", content: "Ruby is elegant, expressive, and super friendly.", user_id: 7)
Post.create(title: "Turbo Streams in Action", content: "Real-time updates without JS? Yes please!", user_id: 1)
Post.create(title: "Sidekiq Tips", content: "Background jobs done right in Rails.", user_id: 6)
Post.create(title: "ActiveRecord Deep Dive", content: "Mastering queries in Rails.", user_id: 14)
Post.create(title: "Building Chat with ActionCable", content: "WebSockets in Rails are easier than you think.", user_id: 5)
Post.create(title: "Rails Routing Tricks", content: "Clean and clever routes for RESTful apps.", user_id: 13)
Post.create(title: "How to Use Devise Like a Pro", content: "Authentication made easy.", user_id: 15)
Post.create(title: "Service Objects FTW", content: "Keep your code clean and organized.", user_id: 16)
Post.create(title: "Working with Forms in Rails 7", content: "Turbo-powered forms are slick!", user_id: 4)
Post.create(title: "Stimulus + Turbo", content: "Hotwire makes frontend smooth and reactive.", user_id: 1)
Post.create(title: "Handling File Uploads", content: "ActiveStorage or Shrine? Here's what I picked.", user_id: 7)
Post.create(title: "Caching in Rails", content: "Make your app blazing fast!", user_id: 6)
Post.create(title: "Using RSpec Effectively", content: "Testing should be painless and powerful.", user_id: 5)
Post.create(title: "Migrations Mastery", content: "Keep your DB in sync with confidence.", user_id: 16)
Post.create(title: "Custom Validations in Rails", content: "Guard your data like a pro.", user_id: 14)
Post.create(title: "Webhooks in Rails", content: "Connect your app with external services.", user_id: 13)
Post.create(title: "Pagination with Kaminari", content: "Make large datasets user-friendly.", user_id: 1)
Post.create(title: "Debugging Rails Apps", content: "Tools and tips that save hours.", user_id: 15)
Post.create(title: "Deploying with Capistrano", content: "Smooth deploys with automation.", user_id: 5)

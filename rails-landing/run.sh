# Install dependencies
bundle install

# Create and migrate the database
rails db:create db:migrate

# Run the Rails server
rails server

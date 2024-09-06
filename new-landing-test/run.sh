#!/bin/bash

# Install dependencies
bundle install

# Run necessary parts of the codebase
rails new landing_page_app
cd landing_page_app
rails generate controller Pages home

# Start the Rails server
rails server

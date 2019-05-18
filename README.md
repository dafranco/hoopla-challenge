# Hoopla coding challenge

## Getting this up and running
### Using docker compose
1. docker-compose build
2. docker-compose run web rake db:create
3. docker-compose run web rake db:migrate RAILS_ENV=development
4. docker-compose up
5. That's it! now the app is running on http://localhost:3000

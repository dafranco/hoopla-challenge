# Hoopla coding challenge

## Getting this up and running
### Using docker compose
1. set CLIENT_SECRET and CLIENT_ID env variables at docker-compose.yml
2. docker-compose build
3. docker-compose run web rake db:create
4. docker-compose run web rake db:migrate RAILS_ENV=development
5. docker-compose up
6. That's it! now the app is running on http://localhost:3000/metrics

# Time spent: 4hs
## Missing Funcionality
Edition of metrics is pending. I've stopped coding when the bell rang.

Error handling is not considered, if a request fails it would just show the rails failure page

Tests are always important but they were not included

Links on edition could have been modularized. I've struggled a little bit with local variables and then kept it repeated

## Pitfalls
Struggled with lack of documentation of OAuth library



## Further considerations
Using a cache would be a good idea for common read-only requests. It takes a long time asking for data through http

I didn't feel confident enough of implementing a HATEOAS client. For long-term solutions brings easier modeling + request lifecicle

## Thanks for checking this code!


### David.
 

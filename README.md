# Measureabl
The core customer for Measurabl is an owner or operator of commercial real estate.
## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes.

### Installing


* Ruby version
 2.7.1

 ```
 rvm install 2.7.1
 ```
* Database
postgresql

```
brew install postgres
```


* Clone the repository


```
git clone https://github.com/usmanasifzai/measureabl

cd measureabl
```

* Install Gems
```
bundle install
```
* Database creation

```
  rails db:create
  rails db:migrate
```

* Populate Database with dummy data
```
  rails db:seed
```
* Run app locally on 3000 port

```
rails server
```

it will run the app on this url. Visit it and you can play with it
http://localhost:3000/

* To login user

```
  url: http://localhost:3000/auth
  body: {
    "email": "test-user@gmail.com",
    "password": "password",
    "password_confirmation": "password"
  }
```

* To authenticate api send these headers in requests

```
  Headers:
    access-token: ***
    Content-Type: application/json; charset=utf-8
    client: ***
    uid: ***
    token-type: Bearer

```

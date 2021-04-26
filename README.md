# Track Driver


### Description
Track Driver is a simple Ruby on Rails application to track the time the drivers spent working for company S.

* Can create a driver, edit their data, and remove drivers from the system.
* A driver should be able to check-in the numbers of hours they have worked as often as they need to.
* A driver has an email, a name, and many check-ins.

The application is available [here](https://intense-sands-29083.herokuapp.com/drivers).


### Prerequisites
The setups steps expect following tools installed on the system.

+ Ruby 2.7.2
+ Rails 5.1.7
+ PostgreSQL 13.1
+ Github
+ Heroku

#### 1. Clone the repository
```
$ git clone https://github.com/StuartHiring/ruby-test-myllinhtran.git
```

#### 2. Run the application locally

Install the required dependencies:
```
$ bundle install
```
Run tests locally
```
$ bundle exec rspec
```
Start the application:
```
$ rails server
```
Visit the site at the URL: http://localhost:3000


#### 3. Deploy to Heroku

[Create a Heroku user account](https://signup.heroku.com/devcenter)
[Install the Heroku CLI](https://devcenter.heroku.com/articles/heroku-cli#download-and-install)
Login into your Heroku account:
```
$ heroku login
 ```

Navigate to folder '/track-driver'.
  
Installing gems:
```
$ bundle install
```

Initialize and commit your code to git
```
$ git init
$ git add .
$ git commit -m "Initial commit"
```

Deploy the app to Heroku
```
$ heroku create
$ git push heroku master
```

Migrate the database to Heroku
```
$ heroku run rake db:migrate
```

Visit the app in browser
```
$ heroku open
```

#### Navigating through the website
Endpoints | Description
--- | ---
GET    /drivers | List all drivers
GET    /drivers/new | View to create a new driver
GET    /drivers/:id/edit | View to edit a driver
POST   /drivers | Create a new driver
PUT    /drivers/:id | Update a driver
DELETE /drivers/:id | Delete a driver
GET    /drivers/:driver_id/checkins | View to check-in worked hours per driver
POST   /drivers/:driver_id/checkins | Update worked hours per driver

#### Future work
- Add unit test, integration test, and load test.
- Expose Prometheus metrics to create (RED) dashboards.
- Create a dev environment in Heroku, right now there is a single environment (prod).
- Add a Dockerfile to improve local development.  
- Monetize the app :)
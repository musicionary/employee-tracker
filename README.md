As a project manager, I want to be able to remove employees from projects when their part is completed or they have moved on.
As a project manager, I want to be able to update which project an employee is working on.
As a project manager, I want to see all of the employees on a given project.
For this app, a project has many employees but an employee is assigned to one project at a time.

# _employees-projects_

##### This application is a demonstration application designed to show a many-to-many relationship between employees and projects using Active Record.

## Technologies Used

Application: Ruby, Sinatra, Active Record<br>
Testing: Rspec, Capybara<br>
Database: Postgres

Installation
------------

```
$ git clone https://github.com/musicionary/employees-projects
```

Install required gems:
```
$ bundle install
```

Create databases:
```
rake db:create
rake db:schema:load
```

Start the webserver:
```
$ ruby app.rb
```

Navigate to `localhost:4567` in browser.

License
-------

GNU GPL v2. Copyright 2015 **Chip Carnes**

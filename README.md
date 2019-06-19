# :bookmark: Bookmark Manager :bookmark:

[![Build Status](https://travis-ci.com/petraartep/bookmark-manager.svg?branch=master)](https://travis-ci.com/petraartep/bookmark-manager)

## User Stories

```
As a time-pressed user
So that I can quickly go to web sites I regularly visit
I would like to see a list of bookmarks

As a time-pressed user
So that I can save a website
I would like to add the site's address and title to bookmark manager
```

## Domain Model

![Bookmark Manager domain model](https://user-images.githubusercontent.com/23095774/59607355-1edd5400-910b-11e9-8c46-d69e375b14e0.png)

- When the user visits the '/bookmarks' path, their browser sends a request to a controller we built.
- When the controller gets the request, it asks the Bookmark class to give it all the bookmarks, i.e. the controller asks for Bookmark.all.
- The Bookmark class goes and gets the bookmarks, and gives back all the bookmarks in an array to the controller.
- The controller renders the array of bookmarks to a webpage, which it sends as a response to the user



## How to use

### To set up the project

Clone this repository and then run:

```
bundle
```

### To set up the database

Connect to `psql` and create the `bookmark_manager` database:

```
CREATE DATABASE bookmark_manager;
```

To set up the appropriate tables, connect to the database in `psql` and run the SQL scripts in the `db/migrations` folder in the given order.

### To run the Bookmark Manager app:

```
rackup -p 3000
```
To view bookmarks, navigate to `localhost:3000/bookmarks`.


### To run tests:

```
rspec
```

### To run linting:

```
rubocop
```
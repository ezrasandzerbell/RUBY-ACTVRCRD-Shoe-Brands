# _Foot Warehouse: Stores and Brands_

#### _A web app that allows user to register shoe brands and the stores that carry them. Features a many-to-many relationship between the two._

#### By _**Ezra Sandzer-Bell**_

## Specifications

* _contains store and brand classes_
* _inputs store and brand information to database tables_
* _joins database tables in a "brands_stores" table_
* _assign stores to brands and brands to stores_
* _displays information using lists and dropdown menus_
* _employs CRUD functionality for both classes in UI_
* _css styling with bootstrap_
* _header features image and font styling_
* _makes use of panels, rows and columns to organize and style content_

## Setup/Installation Requirements

_Works in any web browser. To run Foot Warehouse Application, open terminal and navigate to desktop. In command line, run the following code:_

```
$ git clone https://github.com/ezrasandzerbell/shoe_brands_code_review
$ cd shoe_brands_code_review
$ bundle install
$ rake db:create
$ rake db:migrate
$ rake db:test:prepare
$ Open new terminal tab - enter "postgres" (may already be running)
$ Open new terminal tab - enter "psql" - use psql to navigate tables
$ Open new terminal window - enter "ruby app.rb"
$ Go to localhost:4567 in web browser

```

## Support and contact details

_Contact us on Github at ezrasandzerbell_

## Technologies Used

* _HTML_
* _CSS_
* _Bootstrap_
* _Ruby_
* _Sinatra_
* _Postgres_
* _ActiveRecord_

### License

Foot Warehouse App is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.

Foot Warehouse App is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.

You should have received a copy of the GNU General Public License along with the Foot Warehouse App. If not, see http://www.gnu.org/licenses/.

Copyright (c) 2016 **_Ezra Sandzer-Bell_**

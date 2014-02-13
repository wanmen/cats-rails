Schrödinger's cat - Ruby on Rails
==

## Requirement:
 * \>= Ruby 1.9.2
 * \>= Rails 4.0.0

## Quickstart
 * Ruby requirement
 	* `bundle install`
 * Configuration
 * Database Creation
 	* configure the database criteria 
 		* `config/database.yml` database names and the database user/password
 	* load the database from schema
 		* `rake db:schema:load`
 * Carrierwave credentials
    * copy the carrierwave file
    	* `cp config/initializers/carrierwave.rb.example config/initializers/carrierwave.rb`
 	* configure the carrierwave criteria
 		* `config/initializers/carrierwave.rb' Upyun is suggested. You can also use local file system
 * run
 	* `rails server`

## Dev Guide
 * User System
 	* Use devise for user authentication
 	* `gem 'devise'`
 * Database
 	* Use mysql for database
 	* `gem 'mysql2'`
 	* ubuntu
 		* `sudo apt-get install mysql-client libmysqlclient-dev`
 * Mail System
 	* `gem 'tlsmail'`
 	* `config/environments/development.rb` set up the third party oauth2 logins
 	*  sending mail from smtp mail servers
 * SNS Auth
 	* `gem 'omniauth'`
 	* `gem 'omniauth-weibo-oauth2'`
 	* `gem 'omniauth-renren-oauth2'`
 	* `gem 'omniauth-douban-oauth2'`
 	* `config/initializers/devise.rb` set up the smtp mail

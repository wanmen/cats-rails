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
 * run
 	* `rails server`

## Dev Guide
 * User System
 	* Use devise for user authentication
 	* 用户登录系统包
 	* `gem 'devise'`
 * Database
 	* Use mysql for database
 	* mysql包
 	* `gem 'mysql2'`
 	* ubuntu
 		* `sudo apt-get install mysql-client libmysqlclient-dev`
 * Mail System
 	* `gem 'tlsmail'`
 	* `config/environments/development.rb` set up the third party oauth2 logins
 	* sending mail from smtp mail servers用来发smtp邮件
 * SNS Auth
 	* `gem 'omniauth'`
 	* `gem 'omniauth-weibo-oauth2'`
 	* `gem 'omniauth-renren-oauth2'`
 	* `gem 'omniauth-douban-oauth2'`
 	* `config/initializers/devise.rb` set up the smtp mail
 * Async Mail
 	* `gem 'devise-async'`
    * `gem 'sidekiq'`
    * sending mail asynchronously. You will need to start redis in order to make it work.

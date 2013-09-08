==
薛定谔的猫 Rails版本

要求：
* Ruby version
>= Ruby 1.9.2
Rails Version
>= Rails 4.0.0

* System dependencies

# Use devise for user authentication
用户登录系统包
gem 'devise'

# Use mysql for database
mysql包
gem 'mysql2'

# in ubuntu, you will probably need to install some dependent libraries: sudo apt-get install mysql-client libmysqlclient-dev
如果你用ubuntu，或许得先装mysql-client libmysqlclient-dev

gem 'tlsmail'
#sending mail from smtp mail servers用来发smtp邮件

gem 'omniauth'
gem 'omniauth-weibo-oauth2'
gem 'omniauth-renren-oauth2'
gem 'omniauth-douban-oauth2'
# social logins用来处理社交登录

* Configuration

In<code>config/environments/development.rb</code> to set up the smtp mail.设置smtp email的信息
In<code>config/initializers/devise.rb</code>to set up the third party oauth2 logins.设置第三方社交网站登录
run<code> bundle install</code> to install the dependent gems.
安装以上相关的包

* Database creation

In<code>config/database.yml</code> to configure the database criteria. Like the database names and the database user/password 更新你的数据库的信息

run<code> rake db:schema:load </code> to load the database from schema
运行添加数据库

* Database initialization

* How to run the test suite
运行整个系统
run <code>rails server</code>

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...



# Docker + Codeigniter + MariaDB + Automated Tests (Cucumber) #
### What is this repository for? ###
This is a docker compose Web Application project using the PHP framework Codeigniter, a database with MariaDB and automated tests with Cucumber and Ruby.


### How do I start? ###
Run the command bellow as root to start the application:
- `docker-compose up -d --build --force-recreate web`

To show logs use:
- `docker-compose logs -f -t <container_name>`

After a few minutes you will find the codeigniter project at `./web/myapp/`.

Edit the environment variables in `./mariadb/Dockerfile` to configure your MySQL server. Make sure to leave the root password empty at first use to create the codeigniter project successfully. Then you can change it and disallow empty passwords. 

You can define you database schema adding your *.sql files to `./mariadb/schema/scripts/`.
They will be automatic executed after the mysql server started. If you have changed the root password, you must change it in `./mariadb/schema/Dockerfile` too. 

After the first use you can start the application by executing just `docker-compose up -d web`. 

### How to persist my database? ###
By default, when you start the MariaDB container your database scheme is build and when you stop it, it is destroyed. But, if you want to keep your scheme and entries built, you have to set up a volume for your MariaDB container. Do it by uncommenting the `volumes` configuration in the file `docker-compose.yml`.

### How to run the automated tests? ###
You can run the tests in a cucumber bash using the commands bellow:
- `docker-compose run cucumber bash`
- `bundle exec cucumber <feature_file>`

Save your features in the path `./cucumber/features/`. If you want to execute a specific scenario, use:
- `bundle exec cucumber <feature_file>:<scenario_line_number>`

Define your steps using Ruby by adding *.rb files to `./cucumber/features/step_definitions/`.
The ruby environment configuration file is `./cucumber/features/support/env.rb`.

### How do I stop? ###
Just run `docker-compose down` to stop all containers.
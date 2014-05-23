web: ./bin/puma --config config/puma/development.rb --port $PORT
mc: bundle exec mailcatcher -v --http-port $PORT
postgres: postgres -D /usr/local/var/postgres
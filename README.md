# wheels

> Wheels app

## Requirements
- ruby 2.3
- postgresql 9.4
- npm 2.14

## Build Setup

``` bash
# Setup the app
bin/setup

# It will install all dependencies (backend and frontend),
# create db, clear cache, and restart the app.
```

## Development
```bash
# Run dev server for hot reloading of the frontend (using localhost:8080)
npm run dev

# Run rails server and access the app (either `rails s` or pow/prax)

# After development build front to check if everything works
npm run build

# During dev remember to run tests
rake spec   # to run BE tests
npm test    # to run FE tests
rake test   # to run everything (build, linters, security checks included)
```
For detailed explanation on how things work, consult the [docs for vue-loader](http://vuejs.github.io/vue-loader).

## ROM
ROM is used instead of Rails Way because:

1. The origin of data is mixed - some comes from sql database, some from gems, some from api calls. We need unified way to map them into entities and join the data across the origins.
2. Separation of concerns - mixing peristance layer with business leads to monoobjects that are harder to maintain.
3. Repositories - allows to switch source of given relations with ease - the source implementation (like ActiveRecord) does not leak into other parts of the system (controllers mostly, but others as well)
4. Change ActiveRecord to Sequel - allows for far more flexible queries.
5. Multitenancy should be easier to accomplish (via repo pattern).

lib/wheels_app.rb is a configurable app (see initializers). The app is a container to repositories and commands required for the app to work.
Accessing a global ROM container is a bad practice, therefore the setup.
A container is accessible in the Rails app via `WheelsApp.instance["namespace.name"]`

Please follow documentation on http://rom-rb.org/, dive into code (and specs)
in https://github.com/rom-rb/, and also look at http://dry-rb.org/ to
grasp the concepts.

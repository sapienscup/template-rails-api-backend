# Build rails-toolbox

With this _rails-toolbox_ you don't need to install ruby, or ruby-gems in your system.

```ruby
docker build -t rails-toolbox --build-arg USER_ID=$(id -u) --build-arg GROUP_ID=$(id -g) -f Dockerfile.rails .
```

Use this rails-toolbox to create an rails template app or api, doing the following command:

> Maybe you will need to install `sudo apt-get install ruby-dev`, because of permissions constraints!

```ruby
docker run -it -v $PWD:/opt/app rails-toolbox rails new --api -T --skip-bundle ./
```

# Features

[x] Graphql Error Handler

[x] Feature List Order Checker

[x] Graphql Capability of Doing Operations Directly in the Frontend

[x] Trailblazer's philosophy

[x] I18n Organized

# Links

- [Dockerizing rails app](https://semaphoreci.com/community/tutorials/dockerizing-a-ruby-on-rails-application)

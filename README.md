# Build rails-toolbox

With this _rails-toolbox_ you don't need to install ruby, or ruby-gems in your system.

`docker build -t rails-toolbox --build-arg USER_ID=$(id -u) --build-arg GROUP_ID=$(id -g) -f Dockerfile.rails .`

Use this rails-toolbox to create an rails template app or api, doing the following command:

`rails new api-rest-graphql-name --api -T`

# Features

[x] Graphql Error Handler

[x] Feature List Order Checker

[x] Graphql Capability of Doing Operations Directly in the Frontend

[x] Trailblazer's philosophy

[x] I18n Organized

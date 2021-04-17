# Build rails-toolbox

docker build -t rails-toolbox --build-arg USER_ID=$(id -u) --build-arg GROUP_ID=$(id -g) -f Dockerfile.rails .

# Features

[] Graphql Error Handler
[] Feature List Order Checker
[] Graphql Capability of Doing Operations Directly in the Frontend

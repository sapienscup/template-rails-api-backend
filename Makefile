api_template_docker:
	docker build --build-arg USER_ID=1000 --build-arg GROUP_ID=1000 -t lptonussi/rails-api-template -f Dockerfile .
	docker push lptonussi/rails-api-template

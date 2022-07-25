.PHONY: build_api_template push_api_template

build_api_template:
	docker build --build-arg USER_ID=1000 --build-arg GROUP_ID=1000 -t lptonussi/rails-api-template -f Dockerfile .

push_api_template:
	docker push lptonussi/rails-api-template

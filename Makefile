build-image:
	docker build -t youtube-api-job .

build-container:
	docker run -it -p 8080:8080 youtube-api-job


docker-clean:

	docker stop $(docker ps -a -q)
	docker rm $(docker ps -a -q)


test-service:
	curl -X GET https://youtube-api-job-pal7kd4esq-od.a.run.app/trigger-youtube-api-job



tag_image:
	# only for mac
	docker buildx build --platform linux/amd64 -t youtube-api-job .

	docker tag 9be95f9ad8ea europe-west9-docker.pkg.dev/vocal-eon-416516/epita-examplye-register/youtube-api-job

	docker push europe-west9-docker.pkg.dev/vocal-eon-416516/epita-examplye-register/youtube-api-job


	gcloud auth configure-docker {REGION}-docker.pkg.dev --quiet
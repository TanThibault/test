build-image:
	docker build -t youtube-api-job .

build-container:
	docker run -it -p 8080:8080 youtube-api-job


docker-clean:

	docker stop $(docker ps -a -q)
	docker rm $(docker ps -a -q)


test-service:
	curl -X GET https://youtube-api-job-pal7kd4esq-od.a.run.app/trigger-youtube-api-job
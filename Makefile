CONTAINER_IMAGE?=sipsynergy/go-builder:v2.4

buildAndPush:
	docker build -t ${CONTAINER_IMAGE} . && \
	docker tag ${CONTAINER_IMAGE} ${CONTAINER_IMAGE}
	docker push ${CONTAINER_IMAGE}

remove:
	(docker rm -f ${APP_NAME} &> /dev/null; true)

build-sample-jvm-app:
	docker build sample-jvm-app -t pnyak/sample-jvm-app

push-sample-jvm-app: build-sample-jvm-app
	docker push pnyak/sample-jvm-app

create-ns:
	kubectl apply -f manifests/ns.yaml

delete-ns:
	kubectl delete -f manifests/ns.yaml

deploy-sample-jvm-app:
	if [[ -z "${NS}" ]]; then \
		echo "please provide a namespace to deploy this app"; \
		exit 1; \
	fi
	@echo "+++ deploying application"
	kubectl -n ${NS} apply -f manifests/sample-jvm-app.yaml

delete-sample-jvm-app:
	if [[ -z "${NS}" ]]; then \
		echo "please provide a namespace to deploy this app"; \
		exit 1; \
	fi
	kubectl -n ${NS} delete -f manifests/sample-jvm-app.yaml

deploy-grafana:
	kubectl apply -f manifests/grafana.yaml

delete-grafana:
	kubectl delete -f manifests/grafana.yaml

deploy-prom:
	kubectl apply -f manifests/prometheus.yaml

delete-prom:
	kubectl delete -f manifests/prometheus.yaml

port-forward-prom:
	kubectl --namespace kube-system port-forward $$(kubectl get pods --namespace kube-system -l "app=prometheus,group=prometheus" -o jsonpath="{.items[0].metadata.name}") 9090

deploy-elastic:
	kubectl apply -f manifests/logging.yaml

delete-elastic:
	kubectl delte -f manifests/logging.yaml

.PHONY: build-sample-jvm-app \
push-sample-jvm-app \
deploy-sample-jvm-app \
delete-sample-jvm-app \
deploy-grafana \
delete-grafana \
deploy-all-loki \
delete-all-loki \
deploy-prom \
delete-prom \
port-forward-prom \
deploy-elastic \
delete-elastic

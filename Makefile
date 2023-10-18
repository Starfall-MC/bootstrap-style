reapply:
	kubectl delete -f deploy-main.yaml
	kubectl apply -f deploy-main.yaml

deploy:
	kubectl apply -f deploy-ingress.yaml -f deploy-main.yaml
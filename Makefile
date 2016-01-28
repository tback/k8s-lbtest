all: healthy faulty

.PHONY: deploy healthy faulty

deploy:
	kubectl create -f rc-faulty.yaml
	kubectl create -f rc-healthy.yaml
	kubectl create -f service.yaml
	kubectl create -f ingress.yaml

remove:
	kubectl delete rc/faulty rc/healthy svc/lbtest ing/lbtest

healthy: 
	docker build -t tback/lbtest:healthy healthy
	docker push tback/lbtest:healthy

faulty:
	docker build -t tback/lbtest:faulty faulty 
	docker push tback/lbtest:faulty

all:
	go run ./service/product/main.go -d

product:
	go run ./service/product/main.go

policy-push:
	kubectl create secret generic opa-policy --from-file policy/policy.rego
all:
	go run ./service/bff/main.go -d
	go run ./service/product/main.go -d
	go run ./service/order/main.go -d

bff:
	go run ./service/bff/main.go

product:
	go run ./service/product/main.go

order:
	go run ./service/order/main.go

admin:
	go run ./service/admin/main.go

store-policy:
	kubectl create secret generic opa-policy --from-file policy/policy.rego
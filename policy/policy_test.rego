package envoy.authz

test_get_product_by_admin_allowed {
	allow with input as {
     	"attributes": {
        	"request": {
            	"http": {
                	"method": "GET",
                    "path": "/product",
                    "headers": {
                    	"authorization": "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoiYWRtaW4iLCJzdWIiOiJZbTlpIiwibmJmIjoxNTE0ODUxMTM5LCJleHAiOjE2NDEwODE1Mzl9.WCxNAveAVAdRCmkpIObOTaSd0AJRECY2Ch2Qdic3kU8"
                    }
                }
            }
        }
    }
}

test_post_product_by_admin_allowed {
    allow with input as {
     	"attributes": {
        	"request": {
            	"http": {
                	"method": "POST",
                    "path": "/product",
                    "headers": {
                    	"authorization": "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoiYWRtaW4iLCJzdWIiOiJZbTlpIiwibmJmIjoxNTE0ODUxMTM5LCJleHAiOjE2NDEwODE1Mzl9.WCxNAveAVAdRCmkpIObOTaSd0AJRECY2Ch2Qdic3kU8"
                    }
                }
            }
        },
        "parsed_body": {
            "firstname":"Charlie", 
            "lastname":"Opa"
        }
    }
}

test_post_product_by_guest_not_allowed {
    not allow with input as {
     	"attributes": {
        	"request": {
            	"http": {
                	"method": "POST",
                    "path": "/product",
                    "headers": {
                    	"authorization": "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoiZ3Vlc3QiLCJzdWIiOiJZbTlpIiwibmJmIjoxNTE0ODUxMTM5LCJleHAiOjE2NDEwODE1Mzl9.jbhWEuIizusK3OL9Fe4-l2Hi-i1xQ9t8xADBUZkGICc"
                    }
                }
            }
        },
        "parsed_body": {
            "firstname":"Charlie", 
            "lastname":"Opa"
        }
    }
}

test_get_invalid_token_not_allowed {
	not allow with input as {
     	"attributes": {
        	"request": {
            	"http": {
                	"method": "GET",
                    "path": "/product",
                    "headers": {
                    	"authorization": "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoiZ3Vlc3QiLCJzdWIiOiJZbTlpIiwibmJmIjoxNTE0ODUxMTM5LCJleHAiOjE2MDU2MTMxMzh9._dSuInBRH2wiTKISBot6WCyjaR12jroO9QMJ6Ql-ENE"
                    }
                }
            }
        }
    }
}
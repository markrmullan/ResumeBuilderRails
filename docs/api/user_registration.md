## Create a User

Request: `POST /users`

```
{
	"user": {
		"email": "test@test.com",
		"password": "password1"
	}
}
```

200 Response:

```
{
    "uuid": "3f7126e9-60a2-431d-9fdc-cafa3f44f354",
    "email": "test@test.com",
    "created_at": "2018-12-25T03:14:37.000Z",
    "updated_at": "2018-12-25T03:14:37.000Z"
}
```

### Sample validation errors response

Response: (status code 422)

```
{
    "errors": {
        "email": [
            "has already been taken"
        ],
        "password": [
            "can't be blank"
        ]
    }
}
```

```
{
    "errors": {
        "email": [
            "is invalid"
        ],
        "password": [
            "is too short (minimum is 6 characters)"
        ]
    }
}
```

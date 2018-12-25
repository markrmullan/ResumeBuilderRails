## Login: `POST /users/sign_in.json`

Request body:

```
{
	"user": {
		"email": "test@test.com",
		"password": "password1"
	}
}
```

Response body:

```
{
    "uuid": "3f7126e9-60a2-431d-9fdc-cafa3f44f354",
    "email": "test@test.com",
    "created_at": "2018-12-25T03:14:37.000Z",
    "updated_at": "2018-12-25T03:14:37.000Z"
}
```

### Validation errors:

Status code 401:

```
{
    "error": "Invalid Email or password."
}
```

## Logout: `DELETE /users/sign_out`

No request body required

Success returns an empty response body, status code 204.

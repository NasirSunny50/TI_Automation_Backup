import requests
import base64

# Set the token endpoint URL
token_url = 'http://tiger-iam.com/iam/oauth2/token'

# Set the client ID and secret
client_id = 'fqtz8UnL2sFfKcVZGgoMvzf3kmWEdfkE'
client_secret = 'MZcgtYtOOxigj02Q2CAIZeHodACRT825OdLZGDCqAruPY2MJxH6dS4xreVcGiedX'

# Set the username and password
username = 'sunny@yopmail.com'
password = '123456'

# Set the scope
scope = 'iam_user admin'

# Set the authentication headers
auth_headers = {
    # 'Authorization': 'Basic ' + base64.b64encode(f'{client_id}:{client_secret}'.encode()).decode(),
    'Authorization': 'Basic ZnF0ejhVbkwyc0ZmS2NWWkdnb012emYza21XRWRma0U6TVpjZ3RZdE9PeGlnajAyUTJDQUlaZUhvZEFDUlQ4MjVPZExaR0RDcUFydVBZMk1KeEg2ZFM0eHJlVmNHaWVkWA==',
    'Content-Type': 'application/x-www-form-urlencoded'
}

# Set the request parameters
token_params = {
    'grant_type': 'password',
    'username': username,
    'password': password,
    'scope': scope
}

# Send the token request
response = requests.post(token_url, headers=auth_headers, data=token_params)

# Check if the request was successful
if response.status_code == 200:
    # Get the token from the response
    token = response.json()['access_token']
    print(f'Bearer {token}')
else:
    # Handle the error
    print(f'Error {response.status_code}: {response.text}')

import random
import string

def generate_email():
    # Randomly select a domain for the email address
    domains = ["yopmail.com"]
    domain = random.choice(domains)

    # Generate a random string for the username
    username = ''.join(random.choices(string.ascii_letters + string.digits, k=8))

    # Combine the username and domain to create the email address
    email = username + "@" + domain

    return email

# Example usage
email = generate_email()
print(email)

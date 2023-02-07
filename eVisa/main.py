import random
import string
import subprocess

# Generate a random email address
def generate_email():
  # Pick a random domain
  domain_list = ['yopmail.com']
  domain = random.choice(domain_list)

  # Create a random username
  username = ''.join(random.choices(string.ascii_letters + string.digits, k=8))

  # Return the full email address
  return f"{username}@{domain}"

# Generate a random email and write it to a file
email = generate_email()
with open('email.txt', 'w') as f:
  f.write(email + '\n')

subprocess.run(['robot', 'evisaMFA.robot'])
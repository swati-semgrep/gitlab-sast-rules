# ok
with open('/abc/tmp', 'w') as f:
    f.write('def')

# ruleid:bandit.B108-2
with open('/var/tmp/123', 'w') as f:
    f.write('def')

# ruleid:bandit.B108-2
with open('/dev/shm/unit/test', 'w') as f:
    f.write('def')

# Negative test
with open('/foo/bar', 'w') as f:
    f.write('def')

# Cheat sheet
Tricks & tips for common tasks.

## How to restore pgadmin4 user password using CLI

1. Login to the server
```
ssh santiago@ribaguifi
```

2. Go to the directory where pgadmin4 is installed and start python shell using the user which runs pgadmin4 WSGI.
```
cd ~/environments/pgadmin4/lib/python3.8/site-packages/pgadmin4
sudo -u www-data ~/environments/pgadmin4/bin/python3
```

3. Run the following commands:
```python
from flask import Flask
from pgadmin import create_app
from pgadmin.model import db
from pgadmin.model import User


app = create_app()
app.app_context().push()
db.session.query(User).all()

# [<User 1>, <User 2>, <User 3>, <User 4>]

# TODO: define the user that you want to update
USER_ID = 1

user = db.session.query(User).filter_by(id=USER_ID.first()
user.password = '<new_password>'
db.session.commit()

```

4. Thats all folks!

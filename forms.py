from wtforms import Form, StringField, PasswordField
from wtforms.validators import Length, Email


class UserForm(Form):
    username = StringField('Username', [Length(min=5, max=20)])
    password = PasswordField('Password', [Length(min=8)])
    email = StringField('Email Address', [Email()])
    first_name = StringField('First name', [Length(min=3, max=30)])
    last_name = StringField('Last name', [Length(min=3, max=30)])


class LoginForm(Form):
    username = StringField('Username', [Length(min=5, max=20)])
    password = PasswordField('Password', [Length(min=8)])

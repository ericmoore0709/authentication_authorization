from flask import Flask, request, render_template, redirect, session
from uuid import uuid4
import os
from forms import LoginForm, UserForm
from models import User, db, connect_db

app = Flask(__name__)

app = Flask(__name__)
app.config['SQLALCHEMY_DATABASE_URI'] = os.environ.get('DATABASE_URI')
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
app.config['SQLALCHEMY_ECHO'] = True
app.config['SECRET_KEY'] = str(uuid4())

with app.app_context():
    connect_db(app)
    db.create_all()


@app.get('/')
def index():
    if session.get('user'):
        return redirect('/users/' + session.get('user'))
    return redirect('/register')


@app.get('/register')
def displayRegister():
    if session.get('user'):
        return redirect('/users/' + session.get('user'))
    form = UserForm()
    return render_template('register.html', form=form)


@app.post('/register')
def processRegister():
    form = UserForm(request.form)
    if form.validate():
        user = User.register(
            username=form.username.data,
            password=form.password.data,
            email=form.email.data,
            first_name=form.first_name.data,
            last_name=form.last_name.data
        )

        db.session.add(user)
        db.session.commit()

        session['user'] = user.username
        return redirect('/users/' + user.username)
    else:
        return render_template('register.html', form=form)


@app.get('/login')
def displayLogin():
    if session.get('user'):
        return redirect('/users/' + session.get('user'))
    form = LoginForm()
    return render_template('login.html', form=form)


@app.post('/login')
def processLogin():
    form = LoginForm(request.form)
    if form.validate():

        username = form.username.data
        password = form.password.data

        attemptedUser = User.authenticate(username, password)

        if (attemptedUser):
            session['user'] = attemptedUser.username
            return redirect('/users/' + attemptedUser.username)
        else:
            return render_template('login.html', form=form, errors=['Credentials invalid. Please try again.'])
    else:
        return render_template('login.html', form=form)


@app.get('/users/<username>')
def displayUser(username: str):
    if not session.get('user'):
        return redirect('/register')

    user: User = User.query.filter_by(username=username).first()
    return render_template('user.html', user=user)


@app.get('/logout')
def logout():
    session.pop('user')
    return redirect('/register')

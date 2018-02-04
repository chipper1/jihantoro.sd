from flask import Flask, request, render_template, redirect, session, flash, jsonify
from flask_session import Session
from werkzeug.utils import secure_filename
import time, bcrypt, os, md5, json, datetime, sys
from multiprocessing import Process

app = Flask(__name__, template_folder='templates')

SESSION_TYPE = 'redis'
UPLOAD_FOLDER = './static/upload'
ALLOWED_EXTENSIONS = set(['png', 'jpg', 'jpeg', 'gif'])

app = Flask(__name__)
app.config['UPLOAD_FOLDER'] = UPLOAD_FOLDER
app.secret_key = "R298G3KSOKLH2UIGGLS36EJG"
app.config.from_object(__name__)
Session(app)

@app.route("/")
def _index():


@app.route("/new-post")
def _newpost():

@app.route("/edit-post/<id>")
def _editpost(id):


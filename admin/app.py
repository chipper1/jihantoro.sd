from flask import Flask, request, render_template, redirect, session, flash, jsonify
from flask_session import Session
from werkzeug.utils import secure_filename
import time, datetime, bcrypt, md5, os, sys, json, sqlite3

conn = sqlite3.connect('../db.sql', check_same_thread=False)
conn.row_factory = lambda c, r: dict([(col[0], r[idx]) for idx, col in enumerate(c.description)])
c = conn.cursor()
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
@app.route("/all-post")
def _index():
    if "username" not in session:
        return redirect("/login")
    data = c.execute("select * from main_post order by id desc")
    data = data.fetchall()
    return render_template("allpost.html", data=data)

@app.route("/add-post", methods=["GET", "POST"])
def _addpost():
	if "username" not in session:
		return redirect("/login")
	if request.method == "GET":
		return render_template("addpost.html")
	else:
		post = {}
		for k, v in request.form.iteritems():
			post[k] = v
		date = datetime.date.today()
		arr = ["1", post["title"], post["content"], post["url"], str(date)]
		c.execute("INSERT INTO main_post (wdyw,title,content,url,date) VALUES (?,?,?,?,?);", arr)
		conn.commit()
		return redirect("/all-post")

@app.route("/delete/<id>")
def _deletepost(id):
	if "username" not in session:
		return redirect("/login")
	c.execute("DELETE FROM main_post WHERE id=?", id)
	conn.commit()
	return redirect("/all-post")

@app.route("/login", methods=["GET", "POST"])
def _login():
	if request.method == "GET":
		if "username" in session:
			return redirect("/")
		else:
			return render_template("login.html")
	else:
		post = {}
		for k, v in request.form.iteritems():
			post[k] = v
		check = c.execute("select * from users where username=? limit 1", [post["username"]])
		check = check.fetchone()
		if check:
			password = str(post["password"])
			hashed = str(check["password"])
			if bcrypt.checkpw(password, hashed):
				session["username"] = post["username"]
				return redirect("/")
			else:
				# wrong password
				return redirect("/login")
		else:
			# user not found
			return redirect("/login")

@app.route("/logout")
def _logout():
	session.clear()
	return redirect("/login")

if __name__ == "__main__":
    app.run(host='0.0.0.0', port=2500, debug=True)

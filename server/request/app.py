from flask import Flask, request, render_template

app = Flask(__name__)

request_data = []

@app.route("/", methods=["GET", "POST"])
def index():
	request_dict = {}
	request_dict["remote_addr"] = request.remote_addr
	request_dict["method"] = request.method
	request_dict["path"] = request.path
	request_dict["query_string"] = request.query_string
	
	request_dict["headers"] = request.headers
	request_dict["values"] = request.values.to_dict()
	return "success"

@app.route("/request_list")
def request_list():
	return render_template("index.html")

app.run(host="0.0.0.0", port=5000)

import json
import datetime
from flask_cors import CORS
from flask import Flask, request, render_template, jsonify

app = Flask(__name__)
CORS(app)

request_data = []

@app.route("/", methods=["GET", "POST"])
@app.route("/<path:subpath>", methods=["GET", "POST"])
def index(subpath=None):
	request_dict = {}
	request_dict["idx"] = len(request_data)
	request_dict["remote_addr"] = request.remote_addr
	request_dict["method"] = request.method
	request_dict["path"] = request.path
	request_dict["query_string"] = request.query_string.decode()
	
	request_header = {}
	for key, value in request.headers:
		request_header[key] = value
	
	request_dict["headers"] = request_header
	request_dict["values"] = request.values.to_dict()
	request_dict["time"] = datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S")
	request_data.append(request_dict)

	return "success"

@app.route("/request/<int:idx>", methods=["POST"])
def request_info(idx):
	return jsonify(request_data[idx])
	

@app.route("/request_list")
def request_list():
	return render_template("index.html", request_data=request_data)

app.run(host="0.0.0.0", port=5000)

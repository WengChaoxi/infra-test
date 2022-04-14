#!/bin/env python3

from flask import Flask

app = Flask(__name__)

@app.route("/", methods=['GET', 'POST'])
def hello():
    return "/\n"

@app.route("/<path:path>", methods=['GET', 'POST'])
def world(path):
    return str(path + "\n")

if __name__ == "__main__":
    app.run(port=10000)

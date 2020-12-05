"""
Program to print hello with flask
"""
from flask import Flask, request
app = Flask(__name__)

app.config['DEBUG'] = True

@app.route("/")

def hello():
    """ hello function """

    print(request.headers)

    return "Hello World!"

if __name__ == "__main__":
    app.run()

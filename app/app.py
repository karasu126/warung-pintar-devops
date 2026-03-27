from flask import Flask, app, jsonify

myapp  = Flask(__name__)

@myapp.route('/', methods=['GET'])
def welcome():
    return 'Hello world, my name is Luqman, this project is a simple flask app. (Testing purpose) This is version 1.0'

@myapp.route('/health', methods=['GET'])
def health():
    data = {
        "status": "ok"
        }
    return jsonify(data)

if __name__ == '__main__':
    myapp.run(host='0.0.0.0', port=5000, debug=False)
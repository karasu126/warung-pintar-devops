from flask import Flask, app, jsonify

myapp  = Flask(__name__)

@myapp.route('/', methods=['GET'])
def welcome():
    return 'Hello world, my name is Luqman, this project is a simple flask app. I am learning how to build CI/CD pipelines with github actions and docker. I hope you find this project useful. There is so much part of this project that can be improved. This is a simple Flask app with rollback functionality (branch improve/v2).'

@myapp.route('/health', methods=['GET'])
def health():
    data = {
        "status": "ok"
        }
    return jsonify(data)

if __name__ == '__main__':
    myapp.run(host='0.0.0.0', port=5000, debug=False)
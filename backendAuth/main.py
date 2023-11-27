#import io
#import os
import random
import string
from flask import Flask, send_file,jsonify,request
import flask
import sqlite3
from flask_cors import CORS
import json
import base64
from flask import Flask, jsonify
from cryptography.hazmat.primitives import serialization
from cryptography.hazmat.primitives.asymmetric import rsa
import requests
import functional as fu
app=Flask(__name__)
CORS(app)



'''

@app.route('/get_keys', methods=['GET'])
def get_keys():
    return jsonify({
        'public_key': public_key
    })
'''


#---------------------TESTING AREA---------------------
@app.route("/tes",methods=["POST"])
def tes():
  with open("./pubKeyByte.pem","rb") as file:
    return file.read().decode("utf-8")
@app.route("/tesFernet",methods=["GET"])
def PENET():
  return json.dumps([fu.encryptDataString("uwasng","apple.098").decode("utf-8"),"hui"])
@app.route("/sign",methods=["GET"])
def sign():
   return fu.serverSign()
@app.route("/tesAWAL",methods=["POST"])
def tesAWAL():
  return request.data
@app.route("/byte",methods=["GET"])
def encrypt():
  msg="halo aku suka bebel"
  key="OSM1.829438.039"
  enc_msg=fu.encryptDataString(msg,key)
  print(enc_msg)
  print(type(enc_msg))
  return (enc_msg)
@app.route("/pubkey",methods=["POST"])
def encryptpub():
  return fu.decryptByPrivKey(request.data)
@app.route("/toLocal",methods=["GET"])
def tesLocal():
  r = requests.get('http://localhost:9098/toLocal')
  return r.text

#------------------END TESTING AREA------------------------
@app.before_request
def load_user():
  if request.endpoint=="login" or request.endpoint=="basicFernet":
    print(request.headers.get("Authorization"))
    if request.headers.get("Authorization")==None:
      return "auth required"
    print("encrpt data before request=",request.data)
    request.data=fu.decryptByPrivKey(request.data)
    print("decrypt data before request=",request.data)
      
@app.route('/firstComer',methods=["POST"])
def register():
  #request [username,password,deviceId]
  data=json.loads(request.data)
  username=data[0]
  password=data[1]
  deviceId=data[2]
  fu.storeFirstComer(deviceId,username,password)
  with open("./pubKeyByte.pem","rb") as file:
    return json.dumps([file.read().decode("utf-8"),username])

@app.route("/login",methods=["POST"])
def login():
  #auth:bearertoken => sha256hash(deviceid+username)
  #request base64string of password (karena byte dalam dart berbentuk list<int> atau Uint8list)

    a=(request.headers)
    token=a.get("Authorization")[7:]
    password=(request.data)
    #decryptdata=fu.decryptByPrivKey(password)
    #print(token,"\n",decryptdata)
    #return fu.doLogin(decryptdata,token)
    try:
      return fu.doLogin(password,token),200
    except:
      return "invalid login",406
@app.route("/basicFernet",methods=["POST"])
def basicFernet():
  a=(request.headers)
  token=a.get("Authorization")[7:]
  msg=(request.data)
  #decryptdata=fu.decryptByPrivKey(msg)
  #return fu.basicFernet( decryptdata,token)
  return fu.basicFernet( msg,token)
app.run(host="0.0.0.0" ,port=8080,debug=True)
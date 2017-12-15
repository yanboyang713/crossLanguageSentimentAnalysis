import random
import json
import sys
import requests
import hashlib
class BaiduTranslate(object):
    def __init__(self):
        #app id
        self.id = "20171209000103394"
        #pass ward
        self.pwd = "YEdNgeDHkJxjfSjYd1Zz"

    def translate(self, fromLanguage, toLanguage, translateText):
        try:
            salt = random.randint(32768, 65536)
            signString = self.id + translateText + str(salt) + self.pwd
            sign = hashlib.md5(signString.encode())
            url = "https://fanyi-api.baidu.com/api/trans/vip/translate?q=" + translateText + "&from=" + fromLanguage + "&to=" + toLanguage + "&appid=" + self.id +  "&salt=" + str(salt) + "&sign=" + sign.hexdigest()
            receiveMsg = requests.post(url)
            jsonObj = json.loads(receiveMsg.text)
            result = jsonObj["trans_result"][0]["dst"]
            return result
        except Exception as exception:
            print (exception)

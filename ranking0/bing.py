import sys
import sched, time
import xml.etree.ElementTree as ET
from xml.etree import ElementTree
import requests
import time
from threading import Timer

class Bing(object):
    def __init__(self):
            # subscription ID
            self.subscriptionID= "b668c1e1-3f49-4e40-8a6e-de094507d435"
            # key one
            self.keyOne = "a40788ec18b64b81bfecb29df029be6f"
            #key two
            self.keyTwo = "c3ea56f82dd5420cb0a08ea112726034"
            # tokenURL
            self.tokenUrl = "https://api.cognitive.microsoft.com/sts/v1.0/issueToken?Subscription-Key=" + self.keyOne
            # token
            self.token = ""
            # refresh token
            Timer(5, self.__refreshToken, ()).start()

    def getToken(self):
        receiveMsg = requests.post(self.tokenUrl)
        self.token = receiveMsg.text

    def translate(self, translateText, fromLanguage, toLanguage):
        translateUrl = "https://api.microsofttranslator.com/v2/http.svc/Translate"
        params = {'appid': 'Bearer '+ self.token, 'text': translateText, 'from': fromLanguage, 'to': toLanguage}
        headers = {'Accept': 'application/xml'}
        receivedTranslate = requests.get(translateUrl, params=params, headers=headers)
        tree = ElementTree.fromstring(receivedTranslate.content)
        return tree.text

    def __refreshToken(self):
        self.getToken()
        Timer(5, self.__refreshToken, ()).start()

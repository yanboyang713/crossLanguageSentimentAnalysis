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
            self.subscriptionID= "df8280a5-911e-417c-a313-4744ec6bfea7"
            # key one
            self.keyOne = "10336a7289554ddfa45f1a4189ae6673"
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

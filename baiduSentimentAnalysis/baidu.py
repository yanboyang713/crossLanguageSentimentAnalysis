import urllib, urllib.request, sys
import ssl
import json
class Baidu(object):
    def __init__(self):
        self.accessToken = ""
        self.baiduAnalyzeURL = ""
        self.positiveProb = ""
        self.confidence = ""
        self.negativeProb = ""
        self.sentiment = ""
        self.getToken()

    def getToken(self):
        putAccessToken = input("Do you want to inout access token? Y/n ")
        if putAccessToken == 'Y' or putAccessToken == 'y':
            self.accessToken = input ("Please input token: ")
            self.baiduAnalyzeURL = "https://aip.baidubce.com/rpc/2.0/nlp/v1/sentiment_classify?access_token=" + self.accessToken
        elif putAccessToken == 'N' or putAccessToken == 'n':
            # client_id == AK， client_secret == SK
            tokenFileURL = 'https://aip.baidubce.com/oauth/2.0/token?grant_type=client_credentials&client_id=aaNYxkX8cLQXjKacpjXkhtff&client_secret=gZSbG7M0KUNWo3df1Q69Iq7H0L30pDtx'
            tokenRequest = urllib.request.Request(tokenFileURL)
            tokenRequest.add_header('Content-Type', 'application/json; charset=UTF-8')
            tokenResponse = urllib.request.urlopen(tokenRequest)
            tokenContent = tokenResponse.read().decode("utf-8")
            #finish get token
            tokenJsonObj = json.loads(tokenContent)
            self.accessToken = tokenJsonObj["access_token"]#get access_token
            print ("access token = " + self.accessToken)
            self.baiduAnalyzeURL = "https://aip.baidubce.com/rpc/2.0/nlp/v1/sentiment_classify?access_token=" + self.accessToken

    def analyze(self, context):
        postData = "{\"text\":\"" + context + "\"}"
        postData = postData.encode('gbk')
        #post_data = "{\"text\":\"你太坏了\"}".encode('gbk')
        baiduRequest = urllib.request.Request(self.baiduAnalyzeURL , postData)
        baiduRequest.add_header('Content-Type', 'application/json')
        baiduResponse = urllib.request.urlopen(baiduRequest)
        content = baiduResponse.read().decode("latin-1")

        baiduContentJsonObj = json.loads(content)

        self.positiveProb =  baiduContentJsonObj["items"][0]["positive_prob"]
        self.confidence = baiduContentJsonObj["items"][0]["confidence"]
        self.negativeProb = baiduContentJsonObj["items"][0]["negative_prob"]
        self.sentiment = baiduContentJsonObj["items"][0]["sentiment"]

    def getPositiveProb(self):
        return self.positiveProb

    def getConfidence(self):
        return self.confidence

    def getNegativeProb(self):
        return self.negativeProb

    def getSentiment(self):
        return self.sentiment

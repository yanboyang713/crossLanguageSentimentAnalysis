from google.cloud import language
from google.oauth2 import service_account
import json
from pprint import pprint
# This class sets up the google cloud translation object with credentials and
# validates the target language.
class Google(object):
    def __init__(self):
        self.client = language.LanguageServiceClient()
        self.score = 0.0
        self.magnitude = 0.0
    def analyze(self, data, languageIn):
        document = language.types.Document(
            content=data,
            language=languageIn,
            type='PLAIN_TEXT'
        )
        response = self.client.analyze_sentiment(document=document)

        sentiment = response.document_sentiment

        self.score = sentiment.score
        self.magnitude = sentiment.magnitude

    def getScore(self):
        return self.score

    def getMagnitude(self):
        return self.magnitude

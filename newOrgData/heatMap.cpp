#include <iostream>
#include <vector>
#include <string>
#include "rapidcsv.h"
using namespace std;

int main()
{
    rapidcsv::Document doc("goodDataLatest.csv", rapidcsv::LabelParams(0, -1));

    std::vector<int> ranking = doc.GetColumn<int>("ranking");
    std::vertor<float> googleSentimentOriginData = doc.GetColumn<float>("Google Chinese sentiment analysis score(base on Chinese origin data)");
    std::vertor<float> googleSentimentGoogleTranslatedData = doc.GetColumn<float>("Google English sentiment analysis score(base on Google translated data)");
    std::vertor<float> googleSentimentYandexTranslatedData = doc.GetColumn<float>("Google English sentiment analysis score(base on Yandex translated data)");
    std::vertor<float> googleSentimentBaiduTranslatedData = doc.GetColumn<float>("Google English sentiment analysis score(base on Baidu translated data)");

    std::vector<float> baiduSentimentOriginData = doc.GetColumn<float>("Baidu Chinese sentiment analysis positive probability(base on Chinese origin data)");
    std::vector<float> baiduSentimentGoogleTranslatedData = doc.GetColumn<float>("Baidu English sentiment analysis positive probability(base on Google translated data)");
    std::vector<float> baiduSentimentYandexTranslatedData = doc.GetColumn<float>("Baidu English sentiment analysis postitive probability(base on Yandex translated data)");
    std::vector<float> baiduSentimentBaiduTranslatedData = doc.GetColumn<float>("Baidu English sentiment analysis postitive probability(base on Baidu translated data)");

    float interval = 0.001;
    vector< vector<float> > originDataMatrix;

https://www.geeksforgeeks.org/2d-vector-in-cpp-with-user-defined-size/
    for (int i = 0; i < vect.size(); i++) {// Displaying the 2D vector
        for (int j = 0; j < vect[i].size(); j++)
            cout << vect[i][j] << " ";
        cout << endl;
    }

    std::cout << "Read " << ranking.size() << " values." << std::endl;
    for (int i = 0; i < ranking.size(); i++){
        std::cout << ranking[i] << std::endl;

    }

    size_t colCount = doc.GetColumnCount();
    cout << colCount << endl;

    size_t rowCount = doc.GetRowCount();
    cout << rowCount << endl;
        for (int i = 0; i < rowCount; ++i) {
        origin[i] = 2 * origin[i] - 1;
        cout << "origin = " << origin[i] << " ";

        google[i] = 2 * google[i] - 1;
        cout << "google = " << google[i] << " ";

        yandex[i] = 2 * yandex[i] - 1;
        cout << "yandex = " << yandex[i] << " ";

        baidu[i] = 2 * baidu[i] - 1;
        cout << "baidu = " << baidu[i] << endl;

    }

    doc.Save();
    return 0;

}

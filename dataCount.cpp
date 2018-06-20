#include <iostream>
#include <vector>
#include "rapidcsv.h"
using namespace std;
int main(){

    rapidcsv::Document doc("goodDataLatest.csv", rapidcsv::LabelParams(0, -1));
    std::vector<int> ranking = doc.GetColumn<int>("ranking");
    std::vector<int> ranking10;
    std::vector<int> ranking20;
    std::vector<int> ranking30;
    std::vector<int> ranking40;
    std::vector<int> ranking50;

    std::vector<float> googleSentimentOriginData = doc.GetColumn<float>("Google English sentiment analysis score(base on Google translated data)");
    std::vector<float> baiduSentimentOriginData = doc.GetColumn<float>("Baidu positive probability to google standard(base on Google translated data)");

    unsigned int totalNumData = ranking.size();
    cout << "Total number of data: " << totalNumData << endl;

    for (int i = 0; i < totalNumData; ++i) {
        if (ranking[i] == 10) {
            ranking10.push_back (10);
        }
        else if (ranking[i] == 20) {
            ranking20.push_back (20);
        }
        else if (ranking[i] == 30) {
            ranking30.push_back(30);
        }
        else if (ranking[i] == 40) {
            ranking40.push_back(40);
        }
        else if (ranking[i] == 50) {
            ranking50.push_back(50);
        }
    }
    unsigned int ranking10Size = ranking10.size();
    unsigned int ranking20Size = ranking20.size();
    unsigned int ranking30Size = ranking30.size();
    unsigned int ranking40Size = ranking40.size();
    unsigned int ranking50Size = ranking50.size();

    cout << "number of data in ranking 10: " << ranking10Size << " - " << static_cast<float>(ranking10Size) / static_cast<float>(totalNumData) << endl;
    cout << "number of data in ranking 20: " << ranking20Size << " - " << static_cast<float>(ranking20Size) / static_cast<float>(totalNumData) << endl;
    cout << "number of data in ranking 30: " << ranking30Size << " - " << static_cast<float>(ranking30Size) / static_cast<float>(totalNumData) << endl;
    cout << "number of data in ranking 40: " << ranking40Size << " - " << static_cast<float>(ranking40Size) / static_cast<float>(totalNumData) << endl;
    cout << "number of data in ranking 50: " << ranking50Size << " - " << static_cast<float>(ranking50Size) / static_cast<float>(totalNumData) << endl;

    return 0;

}

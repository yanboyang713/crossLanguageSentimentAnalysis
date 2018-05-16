#include <iostream>
#include <vector>
#include "rapidcsv.h"
using namespace std;

int findIndex(float, float*&, const int&);
int main(){

    rapidcsv::Document doc("goodDataLatest.csv", rapidcsv::LabelParams(0, -1));
    //std::vector<float> googleSentimentOriginData= {-0.9, -0.2, 0.3, 0.4, 0.3};

    std::vector<float> googleSentimentOriginData = doc.GetColumn<float>("Google Chinese sentiment analysis score(base on Chinese origin data)");
    //std::vector<float> baiduSentimentOriginData = {-0.9, -0.1, 0.3, 0.5, 0.3};
    std::vector<float> baiduSentimentOriginData = doc.GetColumn<float>("Baidu positive probability to google standard(base on Chinese origin data)");

    float interval = 0.1;
    int size = static_cast<int>(2 / interval + 1);
    cout << "size = " << size << endl;

    float* xAndYindex = new float[size];
    xAndYindex[0] = -1.0;
    for (int i = 1; i < size; ++i) {
        xAndYindex[i] = xAndYindex[i - 1] + interval;
        cout << xAndYindex[i] << endl;
        }


    // dynamic allocation
    int** dataMatrix = new int*[size];
    for(int i = 0; i < size; ++i)
        dataMatrix[i] = new int[size];
    //init
    for(int i = 0; i < size; ++i)
        for(int j = 0; j < size; ++j)
            dataMatrix[i][j] = 0;
    int rowCount = googleSentimentOriginData.size();

    for (int i = 0; i < rowCount; ++i) {

        float baiduData = baiduSentimentOriginData[i];
        float googleData = googleSentimentOriginData[i];

        int baiduIndex = findIndex(baiduData, xAndYindex, size);
        int googleIndex = findIndex(googleData, xAndYindex, size);
        cout << "baiduIndex = " << baiduIndex << endl;
        cout << "baiduData = " << baiduData << endl;

        cout << "googleIndex = " << googleIndex << endl;
        cout << "googleData = " << googleData << endl;

        dataMatrix[baiduIndex][googleIndex]+= 1;
    }

    // print
    cout <<"size = " << size << endl;

    for(int y = size - 1; y >= 0; y--){
        for(int x = 0; x < size; ++x){
            std::cout << dataMatrix[x][y] << " ";
        }
        cout << endl;
    }


    // free
    for(int i = 0; i < size; ++i)
        delete [] dataMatrix[i];
    delete [] dataMatrix;




    return 0;

}

int findIndex(float data, float*& xAndYindex, const int& size){
    int index = -1;
    //cout << "data = " << data << endl;
    for (int m = 0; m < size; ++m) {
        if (data >= xAndYindex[m] && data < xAndYindex[m + 1]){
            index = m;
        }
    }
    //cout << "index = " << index << endl;
    return index;
}

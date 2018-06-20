#include <iostream>
#include <vector>
#include <math.h>
#include "rapidcsv.h"
using namespace std;
int findIndex(float, float*&, const int&);
int main(){

    rapidcsv::Document doc("goodDataLatest.csv", rapidcsv::LabelParams(0, -1));

    std::vector<float> googleSentimentOriginData = doc.GetColumn<float>("Google English sentiment analysis score(base on Baidu translated data)");
    std::vector<float> baiduSentimentOriginData = doc.GetColumn<float>("Baidu postitive probability to google standard(base on Baidu translated data)");

    float interval = 0.1;
    int size = static_cast<int>(2 / interval + 1);

    float* xAndYindex = new float[size];
    xAndYindex[0] = -1.0;
    for (int i = 1; i < size; ++i) {
        xAndYindex[i] = roundf((xAndYindex[i - 1] + interval) * 10) / 10;
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

        float baiduData = roundf(baiduSentimentOriginData[i] * 10) / 10;
        float googleData = roundf(googleSentimentOriginData[i] * 10) / 10;

        int baiduIndex = findIndex(baiduData, xAndYindex, size);
        int googleIndex = findIndex(googleData, xAndYindex, size);

        dataMatrix[baiduIndex][googleIndex]++;

    }

    // print
    cout << "[";
    for(int y = size - 1; y >= 0; y--){

        cout << "[";
        for(int x = 0; x < size; ++x){
            std::cout << dataMatrix[x][y];
            if (x != size - 1) {
                cout << ", ";
            }
        }
        cout << "]";
        if (y > 0) {
            cout << "," << endl;
        }
    }
    cout << "]" << endl;


    // free
    for(int i = 0; i < size; ++i)
        delete [] dataMatrix[i];
    delete [] dataMatrix;

    return 0;

}

int findIndex(float data, float*& xAndYindex, const int& size){
    int index = -1;
    for (int m = 0; m < size; ++m) {

        if (data >= xAndYindex[m] && data < xAndYindex[m + 1]){
            index = m;
        }
    }
    if (data == 1) {
        index = 20;
    }
    return index;
}

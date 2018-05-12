#include <iostream>
#include <vector>
#include <string>
#include "rapidcsv.h"
using namespace std;

int main()
{
    rapidcsv::Document doc("goodDataBackup.csv", rapidcsv::LabelParams(0, -1));
    /*
    std::vector<string> ranking = doc.GetColumn<string>("ranking");
    std::cout << "Read " << ranking.size() << " values." << std::endl;
    for (int i = 0; i < ranking.size(); i++){
        std::cout << ranking[i] << std::endl;

    }
    */

    doc.RemoveColumn("Baidu postitive probability change to Google score standard(Baidu English sentiment analysis postitive probability for Baidu)");
    doc.RemoveColumn("Baidu postitive probability change to Google score standard(Baidu English sentiment analysis postitive probability for Yandex)");
    doc.RemoveColumn("Baidu postitive probability tranform to Google score standard(base on Baidu English sentiment analysis positive probability for Google translate)");
    doc.RemoveColumn("Baidu postitive probability change to Google score standard(base on origin data Baidu sentiment analysis)");


    size_t colCount = doc.GetColumnCount();
    cout << colCount << endl;

    size_t rowCount = doc.GetRowCount();
    cout << rowCount << endl;

    std::vector<float> origin = doc.GetColumn<float>("Baidu Chinese sentiment analysis positive probability(base on Chinese origin data)");
    std::vector<float> google = doc.GetColumn<float>("Baidu English sentiment analysis positive probability(base on Google translated data)");
    std::vector<float> yandex = doc.GetColumn<float>("Baidu English sentiment analysis postitive probability(base on Yandex translated data)");
    std::vector<float> baidu = doc.GetColumn<float>("Baidu English sentiment analysis postitive probability(base on Baidu translated data)");

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

    cout << colCount << endl;
    cout << rowCount << endl;

    doc.SetColumn<float>(colCount, origin);

    doc.SetColumn<float>(colCount + 1, google);
    doc.SetColumn<float>(colCount + 2, yandex);
    doc.SetColumn<float>(colCount + 3, baidu);

    cout << "finish" << endl;

    doc.Save();

    cout << colCount << endl;
    doc.SetColumnLabel(colCount, "Baidu positive probability to google standard(base on Chinese origin data)");
    doc.SetColumnLabel(colCount + 1, "Baidu positive probability to google standard(base on Google translated data)");
    doc.SetColumnLabel(colCount + 2, "Baidu postitive probability to google standard(base on Yandex translated data)");
    doc.SetColumnLabel(colCount + 3, "Baidu postitive probability to google standard(base on Baidu translated data)");

    doc.Save();
    return 0;

}

#include <iostream>
#include <vector>
#include "rapidcsv.h"

int main()
{
    rapidcsv::Document doc("goodDataWithHeaderStartFromRanking.csv");
  std::vector<float> close = doc.GetColumn<float>("Baidu postitive probability change to Google score standard");
  std::cout << "Read " << close.size() << " values." << std::endl;
  for (int i = 0; i < close.size(); i++){
      std::cout << close[i] << std::endl;

  }
      /*
  long long volume = doc.GetCell<long long>("Baidu postitive probability change to Google score standard", "10");
  std::cout << "Volume " << volume << " on ranking 10." << std::endl;
      */
}

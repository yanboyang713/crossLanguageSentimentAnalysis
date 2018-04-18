#include <iostream>
#include <vector>
#include "rapidcsv.h"

int main()
{
  rapidcsv::Document doc("goodDataWithHeader.csv");

  std::vector<float> close = doc.GetColumn<float>("Baidu postitive probability change to Google score standard");
  std::cout << "Read " << close.size() << " values." << std::endl;
  for (int i = 0; i < close.size(); i++){
      std::cout << close[i] << std::endl;

  }
  /*
  long long volume = doc.GetCell<long long>("Volume", "2011-03-09");
  std::cout << "Volume " << volume << " on 2011-03-09." << std::endl;
  */
  // ...
}

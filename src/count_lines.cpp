#include <Rcpp.h>
#include <fstream>

using namespace Rcpp;


// [[Rcpp::export]]

int countLines(std::string file){
  int number_of_lines = 0;
  std::string line;
  std::ifstream infile(file.c_str());

  while (std::getline(infile, line))
    ++number_of_lines;

   return number_of_lines;

}


#include<iostream>
#include<cmath>
#include<array>
#include<vector>

const int SIZE = 32;
const int SW_SIZE = SIZE/2;

void get_num(std::array<int, SIZE>& arr){
  for(int i = 0; i < SIZE; i++){
    std::cin >> arr[i]; // get the input for the benes network
  }
}

int main()
{
  std::array<int, SIZE> benes_num;
  get_num(benes_num);
  for(int i = 0; i < SIZE; i++){
    std::cout << benes_num[i];
    }
  
  return 0;
}




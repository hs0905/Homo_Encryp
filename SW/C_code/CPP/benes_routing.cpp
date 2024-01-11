#include <iostream>
#include <array>
#include <algorithm> 
#include<math.h>
// parameter
const int SIZE = 32;
const int SW_SIZE = SIZE / 2;
const int LAYER = log2(SIZE);
const int STAGE = (LAYER * 2 ) -1;

// Function Declaration
void  get_num        (std::array<int, SIZE>& arr);
void  table_gen      (std::array< std::array<int, 2>, SIZE*2> & table);
int   start_point    (std::array< std::array<int, 2>, SIZE*2> & table);
void  get_used_switch(int &port);

int main() {
  
  std::array<int, SIZE> benes_num;
  get_num(benes_num);
  std::array< std::array<int, 2>, SIZE*2> table;
  for(int i=0; i<SIZE; i++){
    table[i][0] = i;
    table[i][1] = benes_num[i];
  }
  table_gen(table);
  int start = start_point(table);
}

//Funcion Definition
void  get_used_switch(int &port, std::array<int, SW_SIZE> &output_switch){
  int sw_num;
  output_switch[sw_num] = output_switch[sw_num] + 1;
} // 스위치의 사용 횟수 계산을 위한 함수

void get_num(std::array<int, SIZE>& arr) 
{
    bool isValid;
    do {
        isValid = true;
        for (int i = 0; i < SIZE; i++) {
            std::cin >> arr[i];
            // 범위 검사
            if (arr[i] < 0 || arr[i] >= SIZE) {
                std::cout << "Error" << std::endl;
                isValid = false;
                break; // 중단하고 다시 시작
            }
            for (int j = 0; j < i; j++) {
                if (arr[j] == arr[i]) {
                    std::cout << "Error" << std::endl;
                    isValid = false;
                    break; // 중단하고 다시 시작
                }
            }
            if (!isValid) {
                break; // 중단하고 다시 시작
            }
        }
    } while (!isValid); // 유효하지 않은 입력이 있으면 반복
}

void table_gen(std::array< std::array<int, 2>, SIZE*2> & table){
  int reverse_table[SIZE][2];
  for(int i = 0; i< SIZE; i++){
    reverse_table[i][1] = table[i][0];
    reverse_table[i][0] = table[i][1];
  }
  for(int i = 0; i < SIZE-1 ; i++){
    int min_index = i;
    for(int j = i+1; j< SIZE ; j++){
      if(reverse_table[j][0] > reverse_table[min_index][0]){
        min_index = j;
        }
        if(min_index != i){
          std::swap(reverse_table[i][0], reverse_table[min_index][0]); 
          std::swap(reverse_table[i][1], reverse_table[min_index][1]);
        }
    }
  }
  for(int i = SIZE ; i < SIZE*2 ; i++){
    table[i][0] = reverse_table[i-SIZE][0];
    table[i][1] = reverse_table[i-SIZE][1];
  }
}

int start_point(std::array< std::array<int, 2>, SIZE*2> & table){
  return table[SIZE][0];
}



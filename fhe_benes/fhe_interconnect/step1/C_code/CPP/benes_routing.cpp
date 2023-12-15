#include <iostream>
#include <array>
#include <algorithm> // std::find 함수를 사용하기 위해 필요

const int SIZE = 32;

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

void table_sort(std::array< std::array<int, 2>, SIZE*2> & table){
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

int main() {
    std::array<int, SIZE> benes_num;
    get_num(benes_num);

   std::array< std::array<int, 2>, SIZE*2> table;
    for(int i=0; i<SIZE; i++){
        table[i][0] = i;
        table[i][1] = benes_num[i];
    return 0;
    table_sort(table);
    int start = start_point(table);

}
}



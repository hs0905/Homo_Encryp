#include <iostream>
#include <array>
#include <algorithm> // std::find 함수를 사용하기 위해 필요

const int SIZE = 32;

void get_num(std::array<int, SIZE>& arr) {
    bool isValid;
    do {
        isValid = true;

        for (int i = 0; i < SIZE; i++) {
            std::cin >> arr[i];

            // 범위 검사
            if (arr[i] < 0 || arr[i] >= SIZE) {
                std::cout << "Error: Number out of range. Please enter all numbers again." << std::endl;
                isValid = false;
                break; // 중단하고 다시 시작
            }

            // 중복 검사
            for (int j = 0; j < i; j++) {
                if (arr[j] == arr[i]) {
                    std::cout << "Error: Duplicate number found. Please enter all numbers again." << std::endl;
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

int main() {
    std::array<int, SIZE> benes_num;
    get_num(benes_num);

    // 배열 출력
    for (int i = 0; i < SIZE; i++) {
        std::cout << benes_num[i] << " ";
    }
    std::cout << std::endl;

    return 0;
}

#include <iostream>
#include <unordered_map>
#include <limits>
#include <functional>
#include <string>

int main()
{
    int i = 10;
    std::hash<int> int_hash;
    std::cout << "int hash: " << int_hash(i) << std::endl;

    std::string str = "Hello, World!";
    std::hash<std::string> string_hash;
    std::cout << "string hash: " << string_hash(str) << std::endl;

    std::array<char, 16> arr = {0};
    std::hash<std::array<char, 16>> arr_hash; // compile time error
    std::cout << "array hash: " << arr_hash(arr) << std::endl;
}

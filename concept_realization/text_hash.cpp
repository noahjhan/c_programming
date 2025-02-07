#include <iostream>
#include <functional>
#include <string>

int main() {
    std::cout << "Hello, World!" << std::endl;
    std::hash<std::string> hash;
    std::cout << hash("Hello, World") << std::endl;
    return 0;
}


// tokenize by word
// hash each word

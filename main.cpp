#include <vector>

int foo() {
    int x = 4;
    return x;
}

int main() {
    int x;
    x = 4;

    if (x == 4) {
        x = foo();
    }
    if (x == 4) {
    }
}

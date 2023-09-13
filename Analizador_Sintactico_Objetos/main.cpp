#include "./Pila.cpp"

int main() {
    PilaLR p;

    p.expansion("a+b+c+d+e+f$");
    cout << p.imprimir() << std::endl;
    p.reduccion();
    cout << p.imprimir() << std::endl;

    return 0;
}

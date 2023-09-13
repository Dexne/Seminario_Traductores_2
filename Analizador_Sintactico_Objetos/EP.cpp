#ifndef EP_CLASS
#define EP_CLASS

#include "./includes.h"

class EP {
private:
    char valor;
    Token token;
public:
    EP(char valor) : valor(valor) {}
    friend class PilaLR;
};

class Terminal : public EP {
public:
    Terminal(char valor) : EP(valor) {}
};

class NoTerminal : public EP {
public:
    NoTerminal(char valor) : EP(valor) {}
};

class Estado : public EP {
public:
    Estado(char valor) : EP(valor) {}
};

#endif
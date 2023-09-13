#ifndef PILA_CLASS
#define PILA_CLASS

#include "./EP.cpp"


class PilaLR {
private:
    vector<EP> entrada;

public:
    PilaLR() {
        this->entrada.push_back(EP('$'));
        this->entrada.push_back(EP('0'));
    }

    void expansion(string);
    void reduccion();
    string imprimir() const;
};

void PilaLR::expansion(string datos) {
    Token token;
    
    datos.pop_back();
    for (auto c: datos) {
        if (c >= 'a' and c <= 'z') token = T_ID;
        else if (c == '+') token = T_MAS;

        int top = (int)(this->entrada[this->entrada.size() - 1].valor - '0');
        this->entrada.push_back(EP(c));
        this->entrada.push_back(EP(('0' + reglasProduccion[top][token])));
    }
    this->entrada.push_back(EP('$'));
}

void PilaLR::reduccion() {
    int top, remove;

    this->entrada.pop_back();
    
    while (true) {
        top = (int)(this->entrada.back().valor - '0');
        remove = reglasReduccion[top][T_DOLAR];

        // approved state
        if (!remove) break;

        for (int i = 0; i<remove; i++)
            this->entrada.pop_back();

        top = (int)(this->entrada.back().valor - '0');
        this->entrada.push_back(EP('E'));
        this->entrada.push_back(EP('0' + reglasProduccion[top][T_E]));
    }
}

string PilaLR::imprimir() const {
    string output;
    for (auto ep: this->entrada)
        output += ep.valor;
    return output;
}
#endif


// Estado inicial $0
// Entrada : a+b+c+d+e+f$          

/*
R2
tope con dolar 
retirar 2
insertar E
anterior de tope con tope = push de 4

R1
tope con dolar
retirar 6
insertar E
anterior de tope con tope = push de 4

$0a2+3b2+3c2+3d2+3e2+3f 2	$	r2 E -> id   
$0a2+3b2+3c2+3d2+3e2+3E4	$	r1  E -> id + E
$0a2+3b2+3c2+3d2+3E4	    $	r1 E -> id + E
$0a2+3b2+3c2+3E4	        $	r1 E -> id + E
$0a2+3b2+3E4	            $	r1 E -> id + E
$0a2+3E4	                $	r1 E -> id + E
$0E1	                    $	r0 acept
*/
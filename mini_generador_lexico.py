# Importamos el modulo re para trabajar con expresiones regulares
import re

# Pasamos la variable a analizar
def analyze_token(token):

    # Definimos la expresión regular
    if re.match(r'^[a-zA-Z_]\w*$', token):
        return "Identificador válido"
    
    # Signos ???
    elif re.match(r'^[+-]?\d+$', token):
        return "Entero válido"
    
    # verificar si es flotante
    elif re.match(r'^[+-]?\d+\.\d+$', token):
        return "Real válido"

    else:
        return "Token inválido"

def main():
    while True:
        input_token = input("Ingresa un token ('q' para salir): ")
        if input_token == 'q':
            break
        
        result = analyze_token(input_token)
        print(result)

if __name__ == "__main__":
    main()

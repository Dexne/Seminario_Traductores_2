# Made of Jared Isaias Monje Flores
#
# Mini analizador léxico capaz de reconocer tokens
# Esta versión es capaz de reconocer identificadores y valores reales
#
# Código elaborado en el entorno de desarrollo de Visual Studio Code
# Para ejecutarlo:
# Si te encuentras en un sistema Linux puedes abrir la terminal y dirigirte a la ruta donde
# se localice el archivo, una vez ahí deberás escribir "python3 Nombre_archivo.py" y enter.


# validación si un identificador es un token valido (inico con letra, _  seguido por letras, digitos...)
def is_valid_identifier(token):
    if token[0].isalpha() or token[0] == '_':
        for char in token[1:]:
            if not (char.isalpha() or char.isdigit() or char == '_'):
                return False
        return True
    return False

# validación para enteros (comienzo con signo, numero)
def is_valid_integer(token):
    if token[0] in ('+', '-') or token[0].isdigit():
        for char in token[1:]:
            if not char.isdigit():
                return False
        return True
    return False

# validación para un real valido (comienzo con signo, seguido de numero, un punto unico y mas numeros)
def is_valid_float(token):
    if token[0] in ('+', '-') or token[0].isdigit():
        has_dot = False
        for char in token[1:]:
            if char == '.' and not has_dot:
                has_dot = True
            elif not char.isdigit():
                return False
        return has_dot
    return False


# llamada a las funciones al recibir el token
def analyze_token(token):
    if is_valid_identifier(token):
        return "Identificador válido"
    elif is_valid_integer(token):
        return "Entero válido"
    elif is_valid_float(token):
        return "Real válido"
    else:
        return "Token inválido"

# bucle para repetir el proceso y analizar N tokes
def main():
    while True:
        input_token = input("Ingresa un token ('q' para salir): ")
        if input_token == 'q': # terminar ciclo
            break
        
        result = analyze_token(input_token)
        print(result)

if __name__ == "__main__":
    main()

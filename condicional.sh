#!/bin/bash

# Leer edad
read age
number=1  # Corrección en la asignación

# Verificar si es mayor de edad
if (( age >= 18 )); then
    echo 'Eres mayor de edad'
elif (( age == 17 )); then
    echo 'Casi eres un adulto'
else
    echo 'Eres un niño'
fi

# Verificar si la edad está en el rango válido
if [[ $age -gt 18 && $age -lt 40 ]]; then
    echo 'Edad válida'
else
    echo 'Edad no válida'
fi

# Leer un número para el bucle
read n

# Validar si el valor ingresado es numérico
if ! [[ $n =~ ^[0-9]+$ ]]; then
    echo "Debes ingresar un número válido."
    exit 1
fi

# Bucle while
while [ $number -le $n ]; do
    echo $number
    number=$((number + 1))
done

for (( i=0; i<=n; i++ )); do
    echo $i
done


# Función para generar una matriz caracol
caracol() {
    local n=$1
    local matrix=()
    local top=0
    local bottom=$((n-1))
    local left=0
    local right=$((n-1))
    local num=1

    # Inicializa la matriz con ceros
    for (( i=0; i<n; i++ )); do
        for (( j=0; j<n; j++ )); do
            matrix[$((i*n + j))]=0
        done
    done

    # Llena la matriz en espiral
    while (( top <= bottom && left <= right )); do
        # De izquierda a derecha
        for (( i=left; i<=right; i++ )); do
            matrix[$((top*n + i))]=$num
            ((num++))
        done
        ((top++))

        # De arriba hacia abajo
        for (( i=top; i<=bottom; i++ )); do
            matrix[$((i*n + right))]=$num
            ((num++))
        done
        ((right--))

        # De derecha a izquierda
        for (( i=right; i>=left; i-- )); do
            matrix[$((bottom*n + i))]=$num
            ((num++))
        done
        ((bottom--))

        # De abajo hacia arriba
        for (( i=bottom; i>=top; i-- )); do
            matrix[$((i*n + left))]=$num
            ((num++))
        done
        ((left++))
    done

    # Imprime la matriz caracol
    for (( i=0; i<n; i++ )); do
        for (( j=0; j<n; j++ )); do
            printf "%4d" "${matrix[$((i*n + j))]}"
        done
        echo
    done
}

# Solicita el tamaño de la matriz
read -p "Introduce el tamaño de la matriz (N): " N

# Llama a la función caracol
caracol $N
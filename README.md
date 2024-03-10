# ARRMAX

Утилита, которая принимает массив целых чисел и возвращает максимальное значение

## Usage

```
usage: arrmax [--version] [--help] <%d> [<%d> ...]
    --help       provides this message
    --version    show product version
```

### example:

```sh
> arrmax 1 2 3 4 5 6 7
max: 7
```

## Build

```sh
cmake -S . -B build
cmake --build
```

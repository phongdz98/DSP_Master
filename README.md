# Домашнее задание по КФС 2023

## Условие
Разработать программу, определяющую амплитуду произвольного количества заданных пользователем частот входного сигнала с помощью алгоритма Гёрцеля. Формат входного файла может быть аудио, либо текстовый (на выбор).

## Установка и использование

* Clone , установить и запустить Python код:

    ```sh
  $ git clone git@github.com:phongdz98/DSP_Master.git
  $ cd DSP_Master
  $ cd python_code
  $ python -m venv venv
  $ ./venv/Scripts/activate
  $ python -m pip install --upgrade pip
  $ pip install -r requirements.txt
  $ python main.py
    ```
* Запустить файл exe:
    ```sh
    $ cd final_app
  $ ./main.exe
    ```
* Как создать exe файл из Python?
    ```sh
    $ cd python_code
  $ pyinstaller --onefile --clean --icon=icon.ico  -w main.py
    ```


#!/usr/bin/env bash


# Start here <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<

set -e                      # Exit immediately if a command exits with a non-zero status

_START_DIR_=$PWD            # Save the launch directory


cd ..

sudo git pull

cd $_START_DIR_

cd proc

./install_soft.sh           # Устанавливаем необходимое ПО

./tune_ports.sh             # Настраиваем порты

./create_links.sh           # Создаём символьные ссылки

cd $_START_DIR_

./assembly.sh full all      # Собираем цели

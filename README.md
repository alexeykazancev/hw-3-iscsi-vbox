# hw-3-iscsi-vbox
пробую разворачивать на ноутбуке, на борту федора 37

в дз требуется:развернуть в VirtualBox следующую конфигурацию с помощью terraform

виртуалка с iscsi
3 виртуальные машины с разделяемой файловой системой GFS2 поверх cLVM
должен быть настроен fencing для VirtualBox - https://github.com/ClusterLabs/fence-agents/tree/master/agents/vbox
для сдачи
terraform манифесты
ansible роль
README file

если не установлен виртуалбок , то его нужно установить
для федора 37 создаем файл /etc/yum.repos.d/virtualbox.repo 
и наполняем его:
[virtualbox]
name=Fedora VirtualBox Repo
baseurl=http://download.virtualbox.org/virtualbox/rpm/fedora/37/\$basearch
enabled=1
gpgcheck=1
repo_gpgcheck=1
gpgkey=https://www.virtualbox.org/download/oracle_vbox_2016.asc

далее импортируем ключ:
sudo dnf search virtualbox

ставим доп пакеты:
dnf update
dnf install @development-tools
dnf install kernel-devel kernel-headers dkms qt5-qtx11extras  elfutils-libelf-devel zlib-devel
dnf update kernel-*
reboot

устанавливаем саму утилиту:
sudo dnf install VirtualBox-7.0

настраиваем пользователей:
sudo usermod -a -G vboxusers $USER && newgrp vboxusers

повторяем процесс начальной конфигурации и проверяем, что демон запущен
/sbin/vboxconfig
systemctl status vboxdrv


далее клонируем реп https://github.com/alexeykazancev/hw-3-iscsi-vbox

и выполняем: 
запускаем загрузку модулей terraform init
проверяем манифесты terraform validate
проверяем , что будет создано terraform plan
запускаем создание вм terraform apply
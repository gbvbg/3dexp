Установка 3DEXPERIENCE с помощью ansible.

Понадобится установить:
- VirtualBox
- vagrant
- vagrant plugin install vagrant-winnfsd
- клонировать себе на машину репозиторий
- и запустить в каталоге с локальной копией репозитория команду `vagrant up`

и через 2-6 часов, в зависимости от производительности вашей рабочей станции, у вас будет собственный ландшафт 3DExperience состоящий из:

- 3DPassport
- 3DDashboard
- 3DSearch
- 3DSpace
- 3DSpaceIndex
- 3DSwym
- 3DNotification
- 3DComment

развернутый на двух виртуальных серверах с Windows2016 и MSSQL. Windows будет
триальная, MSSQL - Developer Edition. Из ресурсов понадобится 4 ядра и 20 ГБ свободной памяти.

Если хотите изменить под себя, то надо в первую очередь посмотреть и адаптировать следующие файлы:

- `provisioning/setup-all.yml`, убрав возможно для ваших задач не нужные шаги;
- `provisioning/group_vars/all/vars`, в первую очередь адаптировав значения закомментированных в нем переменных;
- создайте `provisioning/group_vars/all/vault` для хранения паролей и другой непубличной информации (переменные начинающиеся с vault_). Этот файл в .gitignore, и не должен попасть в общий репозиторий.
- `provisioning/dev.ini` - размещение сервисов по серверам.

Что еще можно сделать:
- установка webapp-ов;
- установка обновлений;
- мониторинг, централизованное хранение и анализ логов;
- продуктивный ландшафт (HA и балансировка);
- миграция на новый релиз.

Написано на основе:

DS_WhitePapers_3DEXPERIENCE-R2019x-Windows-MSSQL-On-Premise-Installation_V1.0.pdf

https://media.3ds.com/support/white-papers/adv_ent/external/2018/DS_WhitePapers_3DEXPERIENCE-R2018x-Platform-On-Premise-Online-Monitoring-and-Maintenance_V2.0.pdf

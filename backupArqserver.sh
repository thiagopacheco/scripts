#!/bin/bash
# /opt/backupArqserver.sh
# Este script faz a sincronização dos arquivos do arq-server atual para a pasta /home/suporte/backup/ do servidor de backup (hostname:srv-backup)
# Obs: Em breve tentaremos sincronizar também na nuvem (Google)
# Rotina será chamada via cron durante a madrugada. Vide comando crontab -l
#
# 19/11/2018 - Thiago Pacheco Santos CPD - Prefeitura Municipal de Teófilo Otoni
#
BKORIGEM="/home/samba/shares/*"
BKDESTINO="/mnt/backup/"
LOG="/var/log/arq-server-bck/`date +%Y-%m-%d`_backup.txt"

mount -t nfs 192.168.8.1:/home/suporte/backup /mnt/backup/

INICIO=`date +%d/%m/%Y-%H:%M:%S`
echo "Sincronização iniciada em $INICIO " >> $LOG

# Efetua a cópia dos arquivos de backup 
rsync -uah --delete ${BKORIGEM} ${BKDESTINO} >> $LOG

FIM=`date +%d/%m/%Y-%H:%M:%S`
echo "Sincronização finalizada em $FIM " >> $LOG

umount /mnt/backup/

exit 0

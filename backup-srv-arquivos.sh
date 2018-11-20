#!/bin/bash
# /opt/backupArqserver.sh
# Rotina será chamada via cron durante a madrugada. Vide comando crontab -l.
BKORIGEM="/home/samba/shares/*"
BKDESTINO="/mnt/backup/"
LOG="/var/log/arq-server-bck/`date +%Y-%m-%d`_backup.txt"

mount -t nfs ip:/home/suporte/backup /mnt/backup/

INICIO=`date +%d/%m/%Y-%H:%M:%S`
echo "Sincronização iniciada em $INICIO " >> $LOG

# Efetua a cópia dos arquivos de backup 
rsync -uah --delete ${BKORIGEM} ${BKDESTINO} >> $LOG

FIM=`date +%d/%m/%Y-%H:%M:%S`
echo "Sincronização finalizada em $FIM " >> $LOG

umount /mnt/backup/

exit 0

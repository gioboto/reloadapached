#!/bin/bash
#
#script reloadapache.sh
# Version : 1.0
#Reinicia apache al detectar un número de conexione desde cierta ip
#Autor : Ing. Jorge Navarrete
#mail : jorge_n@web.de
#Fecha : 2020-11-26

#script reloadapache.sh
#Reinicia apache al detectar un número de conexionesdesde cierta ip

#===========================================================================
PATH=/bin:/usr/bin:/usr/sbin/
#===========================================================================

NUMERO=`netstat -tulapno | grep http | awk '/10.1.54.7:443/{print $5}' | wc -l`
FECHA=`date`
ELFILE=`echo $FECHA`" ==> "`echo $NUMERO`
ELFILE2=`echo $FECHA`" ==> "`echo $NUMERO`" reload "
NUMERO=$(($NUMERO+1))
#si mas de 10 conexiones reinicia apache

if [ $NUMERO -ge 10 ]

then
        echo $ELFILE2 >> /var/log/apachelogmio-443.log
        /etc/init.d/httpd reload > /dev/null

fi


if [ $NUMERO -ne 1 ]
then
        echo $ELFILE >> /var/log/apachelogmio-443.log


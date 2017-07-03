#!/bin/bash
#
# trace_process: 
# function to track which process invoked this script
# and print its "process call stack"
# Author: Allen Fang <iamfy000@gmail.com>
#

getParentPID()
{
   pPID=`ps axo pid,ppid,cmd | awk '{ if($1=='"$1"') print $2}'`
   echo $pPID
}

getProcessInfo()
{
   pPID=`ps axo pid,ppid,cmd | awk '{ if($1=='"$PID"') printf("%s %s %s %s", $3, $4, $5, $6)}'`
   echo $pPID
}

getParentInfo()
{
   pPID=`ps axo pid,ppid,cmd | awk '{ if($1=='"$PID"') printf("%s %s %s %s", $3, $4, $5, $6)}'`
   echo $pPID
}

trace_process()
{
   date
   PID=$$
   
   echo -n "$$ " 
   while [ ! $PID -eq "1" ]
   do
        PID=`getParentPID $PID`
        echo -n "<- $PID "
   done
   echo ""
   
   
   PID=$$
   INFO=`getProcessInfo $PID`
   echo -n "[ $INFO ] " 
   while [ ! $PID -eq "1" ]
   do
        PID=`getParentPID $PID`
        INFO=`getParentInfo $PID`
        echo -n "<- [ $INFO ] "
   done
   echo ""
}

trace_process
#output=`trace_process`
#
#echo $output >> /root/syslog.monitor

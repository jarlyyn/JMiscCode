#!/bin/bash
#定期维护系统快照(时间机器)的脚本
#需要安装btrfs-tools
#通过cron.tab调用
#rootpath指btrfs的主卷位置
rootpath=/raid/root
#snappath指快照存放路径
snappath=/raid/root-hourly-snap
#快照根据时间日期来命名
snapfile=$snappath/`date +%Y年%m月%d日%H时%M分%S秒`
#快照保留天数
lifetime=14
#快照的所属用户
user=root:Management
#快照的权限
filemod=750
btrfs subvolume snapshot "$rootpath" "$snapfile"
chown $user "$snapfile"
chmod 750 "$snapfile"
if [ -n "$lifetime" ] 
then
        find $snappath/* -maxdepth 0 -ctime +$lifetime -exec btrfs subvolume delete {} \;
fi
exit 0
 

#!/bin/bash
first_time="false"
downdir=""
if [ ! -e ./lib ]; then
echo '注意 由于下载路径问题, 需要以root运行'
first_time="true"
echo '您是第一次使用迅雷, 请根据提示设置下载如今(不需要输入TDDOWNLOAD, 该文件夹自动建立)'
echo '请确保/mnt/USB没有挂载其他设备'
chmod +x portal
chmod +x EmbedThunderManager
chmod +x ETMDaemon
while [ ! -e "$downdir" ]
do
# set download dir
echo -n '请输入下载路径:'
read downdir
done
echo "文件将下载到$downdir/TDDOWNLOAD"

if [ -e mount.sh ]; then
rm mount.sh
fi

echo "sudo mount --bind $downdir /mnt/USB" > mount.sh
chmod +x mount.sh

fi

# mounting
echo " 设置下载路径中..."
./mount.sh

sudo ./portal

echo $first_time
if [ "$first_time" = "true" ]; then
echo '下载路径在/tmp/thunder/volumes中.'
ls -l /tmp/thunder/volumes
read -n1 -p "按任意键将会在nautilus中打开"
nautilus /tmp/thunder/volumes;
fi


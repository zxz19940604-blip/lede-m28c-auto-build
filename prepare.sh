#!/bin/bash -x
id
df -h
free -h
cat /proc/cpuinfo

if [ -d "lede" ]; then
    echo "repo dir exists"
    cd lede
    git pull || { echo "git pull failed"; exit 1; }
else
    echo "repo dir not exists"
    git clone "https://github.com/coolsnowwolf/lede.git" || { echo "git clone failed"; exit 1; }
    cd lede
fi

#cat ../m28c.config > .config
cat feeds.conf.default > feeds.conf
echo "" >> feeds.conf
echo "src-git qmodem https://github.com/FUjr/QModem.git;main" >> feeds.conf
echo 'src-git istore https://github.com/linkease/istore;main' >> feeds.conf
echo 'src-git nas https://github.com/linkease/nas-packages.git;master' >> feeds.conf
echo 'src-git nas_luci https://github.com/linkease/nas-packages-luci.git;main' >> feeds.conf
#echo "src-git fancontrol https://github.com/LeeHe-gif/luci-app-fancontrol.git" >> "feeds.conf
#rm -rf files
#cp -r ../files .
#if [ -d "package/zz/luci-theme-alpha" ]; then
    #cd package/zz/luci-theme-alpha
    #git pull || { echo "luci-theme-alpha git pull failed"; exit 1; }
    #cd ../../..
#else
    #git clone https://github.com/derisamedia/luci-theme-alpha.git package/zz/luci-theme-alpha || { echo "luci-theme-alpha git clone failed"; exit 1; }
#fi

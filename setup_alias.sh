#!/bin/bash
sed -i "/alias lab*/d" ~/.bashrc
echo "alias lab_update ='cd ~/lab_kormou/; git reset --hard HEAD; git pull'" >> ~/.bashrc
echo "alias lab='conda activate lab; mkdir ~/lab_tmp; cp ~/lab_kormou/* ~/lab_tmp/.; jupyter notebook ~/lab_tmp/'" >> ~/.bashrc
bash

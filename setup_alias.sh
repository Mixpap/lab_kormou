#!/bin/bash
#sed -i "/alias lab*/d" ~/.bashrc
#echo "alias lab_update ='cd ~/lab_kormou/; git reset --hard HEAD; git pull'" >> ~/.bashrc
#echo "alias lab='conda activate lab; mkdir ~/lab_tmp; cp -r ~/lab_kormou/* ~/lab_tmp/.; jupyter notebook ~/lab_tmp/'" >> ~/.bashrc
sed -i.bak -e '/lab(/,/}$/d' -e '/update_lab(/,/}$/d' -e '/clean_lab(/,/}$/d' 
echo '
function lab(){
    conda activate lab
    if [ ! -d "~/lab_kormou_tmp_$1" ]; then
        echo "Creating Directory lab_kormou_tmp_$1"
        mkdir -p ~/lab_kormou_tmp_$1 
        cp -r ~/lab_kormou/* ~/lab_kormou_tmp_$1/. 
    else
        echo "Directory exists"
    fi
    jupyter notebook ~/lab_kormou_tmp_$1/    
}
#export -f lab
function update_lab() {
    cd ~/lab_kormou/
    git reset --hard HEAD
    git pull
}
#export -f update_lab
function clean_lab() {
    read -r -p "This will clean all lab_kormou_tmp_* folders, ARE YOU SURE? [y/N] " response
    if [[ "$response" =~ ^(yes|y)$ ]]
    then
        rm -rf ~/lab_kormou_tmp*
    fi
}
' >> ~/.bashrc
#export -f clean_lab
bash
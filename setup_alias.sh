#!/bin/bash
sed -i "/alias lab*/d" ~/.bashrc
echo "alias lab='conda activate lab; jupyter notebook ~/lab_kormou/'" >> ~/.bashrc
bash

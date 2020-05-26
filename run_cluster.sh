#!/usr/bin/env bash

cd /data/datasets/asanders
python3 train_rotationnet.py --pretrained -a alexnet -b 400 --lr 0.01 --epochs 1500 ModelNet40_20_ori4/

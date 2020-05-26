#!/bin/bash

#SBATCH --mail-user=asanders@andrew.cmu.edu
#SBATCH --mail-type=ALL # (ALL = BEGIN, END, FAIL, REQUEUE)

#SBATCH -n 2
#SBATCH -N 1
#SBATCH -t 2-00:00 	# D-HH:MM
#SBATCH -p gpu   	# cpu/gpu/dgx
#SBATCH --gres=gpu:1
#SBATCH --mem=16192
#SBATCH --job-name=asanders_test
#SBATCH --output=logs/Antioch-%j-%N.out

# Executable
EXE=/bin/bash
. /home/asanders/.bash_profile

nvidia-docker run --shm-size 32G --rm -e CUDA_VISIBLE_DEVICES=`echo $CUDA_VISIBLE_DEVICES` -v /data/datasets/asanders:/data/datasets/asanders asanders/torch:9.2-cudnn7-runtime-ubuntu18.04 $EXE /data/datasets/asanders/run_cluster.sh

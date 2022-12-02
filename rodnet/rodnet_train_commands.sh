#!/bin/bash

conda activate rodnet && [ [ python -c "import rodnet" ] || [ cd /home/RODNet && pip install -e . ] ]
python tools/prepare_dataset/prepare_data.py \
        --config configs/config_rodnet_cdcv2_win16_mnet_dcn.py  \
        --data_root /home/mount/Data \
        --split train,test \
        --out_data_dir /home/mount/pkl3 \
&& python tools/train.py --config configs/config_rodnet_cdcv2_win16_mnet_dcn.py  \
        --data_dir /home/mount/pkl3 \
        --log_dir /home/mount/checkpoints/

python tools/test.py --config configs/config_rodnet_cdc_win16.py \
--data_dir /home/mount/pkl \
--checkpoint /home/mount/Results/ \
--res_dir results/
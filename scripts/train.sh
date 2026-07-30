#!/bin/bash

echo "Starting smolVLA training on Piper robot dataset..."

lerobot-train \
  --dataset.root=/root/piper_record_test \
  --dataset.repo_id=piper_record_test \
  --policy.path=/root/autodl-tmp/pretrained/smolvla_base \
  --policy.device=cuda \
  --policy.empty_cameras=1 \
  --rename_map='{"observation.images.front":"observation.images.camera1","observation.images.wrist":"observation.images.camera2"}' \
  --output_dir=/root/autodl-tmp/checkpoints/smolvla_piper_test \
  --job_name=smolvla_piper \
  --batch_size=16 \
  --num_workers=4 \
  --steps=50000 \
  --save_freq=10000 \
  --log_freq=100 \
  --env_eval_freq=0 \
  --wandb.enable=false \
  --policy.push_to_hub=false

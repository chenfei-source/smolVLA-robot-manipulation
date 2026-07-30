# Model Training


## Overview


This project fine-tunes the pretrained smolVLA policy using real-world robot manipulation demonstrations collected with a Piper robotic arm.


The training pipeline is based on the Hugging Face LeRobot framework.
LeRobot Dataset——Dataset Loading——smolVLA Fine-tuning——smolVLA Fine-tuning——Policy Checkpoint——Real Robot Deployment

---

# Environment


## Software

- LeRobot: 0.6.0
- Training framework: Hugging Face LeRobot
- Policy: smolVLA


## Hardware

Training was performed on a cloud GPU environment.


---

# Training Dataset


Dataset:

- Episodes: 105
- Frames: 27,623
- Recording frequency: 15 FPS


Input modalities:

- RGB images
- Robot states
- Language instructions


Output:

- Robot action trajectories


---

# Pretrained Model


The training starts from the pretrained smolVLA base model:/root/autodl-tmp/pretrained/smolvla_base


The pretrained policy is fine-tuned on the Piper manipulation dataset.


---

# Training Configuration


Training command:


```bash
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

Training Result

Training completed successfully.

The trained checkpoints were saved:/root/autodl-tmp/checkpoints/

Notes

During experiments, task complexity had a significant impact on performance.

The dataset included:

Different object positions
Multiple object categories

For a 500M parameter VLA model, simpler and more consistent demonstrations are more suitable for achieving stable manipulation performance.

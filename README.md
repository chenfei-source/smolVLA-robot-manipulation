# smolVLA-robot-manipulation

A Vision-Language-Action (VLA) robot manipulation project based on smolVLA.
This project builds an end-to-end robot learning pipeline, including robot demonstration collection,  VLA policy training and real-world robot deployment.

## 🎥 Real Robot Demo
<p align="center">
<img src="assets/demo_no_person.gif" width="700">
</p>

## 🤖 Robot Setup
<p align="center">
<img src="assets/robot-setup.png" width="700">
</p>

## 🚀 Training Pipeline
<p align="center">
<img src="assets/pipeline.png" width="700">
</p>

## 📊 Results

### Real Robot Evaluation

The trained smolVLA policy was evaluated on the real Piper robotic arm.

Task:
> put the carrot on the plate.

### Successful Execution

The robot successfully follows the language instruction and completes the manipulation task.



https://github.com/user-attachments/assets/dbfe49ba-1c83-4dd1-bfbc-d77fe7fef101




### Failure Case Analysis

Failure cases were mainly caused by:
- Object position distribution shift
- Limited demonstration diversity
- Grasping uncertainty



https://github.com/user-attachments/assets/36b05228-c338-40b3-9c07-bcfc7b5e05a2



## 🧠 Overview
Vision-Language-Action models enable robots to understand visual observations and language instructions, then generate corresponding robot actions.
This project explores how smolVLA can be applied to real-world robot manipulation tasks.
Pipeline:
Language Instruction
↓
RGB Observation
↓
smolVLA Policy
↓
Action Prediction
↓
Robot Execution

## 🤖 Hardware
Robot Platform:
- Piper robotic arm
Sensors:
- RGB camera

## 📊 Dataset
Dataset collected from real robot demonstrations.
Scale:
- 105 episodes
- 27623 frames
- 15FPS
Modalities:
- RGB images
- Robot states
- Action trajectories
- Language instructions

## 🚀 Training Pipeline
The complete workflow:
Piper Robot Demonstration Collection
↓
LeRobot Dataset Format
↓
smolvla Fine-tuning
↓
Policy Checkpoint
↓
Real Robot Inference

## 🔥 Project Highlights
- Built a complete Vision-Language-Action robot learning pipeline
- Trained VLA policy for manipulation tasks
- Deployed learned policy on physical robot platform

## 🛠️ Technologies
Robot Learning:
- Vision-Language-Action (VLA)
- Imitation Learning
- Robot Manipulation
Framework:
- LeRobot
- PyTorch
Robot:
- Piper Robot Arm

## 📁 Repository Structure
smolVLA-robot-manipulation

├── README.md

├── assets
│ ├── pipeline.png
│ ├── robot_setup.jpg
│ └── demo.gif

├── configs
│ └── smolvla.yaml

├── dataset
│ ├── data
│ ├── meta
│ └── videos

├── scripts
│ ├── train.sh
│ └── inference.sh

├── docs
│ ├── training.md
│ ├── dataset.md
│ └── deployment.md

└── results
│ ├── videos
│ └── evaluation.md

## 📌 Future Work
- Add robot execution videos
- Release training configuration
- Improve policy evaluation
- Add simulation experiments

## 📬 Contact
Chen Fei
Email:HUAWEI260421@outlook.com

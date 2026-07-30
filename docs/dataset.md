# Dataset Description


## Overview

This project uses real-world robot manipulation demonstrations collected through a leader-follower teleoperation system.
The collected demonstrations are converted into the LeRobot dataset format and used for smolVLA policy fine-tuning.
The complete pipeline:

Teleoperation Data Collection
  ↓
LeRobot Dataset Conversion
  ↓
smolVLA Fine-tuning
  ↓
Real Robot Deployment

---

# Teleoperation System

## Robot Setup
The demonstration data was collected using a leader-follower teleoperation system based on the LeRobot recording pipeline.

### Leader Robot
SO-101 robotic arm
- Used as the teleoperation input device
- Controlled by the human operator during demonstrations

### Follower Robot
Piper robotic arm
- 6-DoF robotic arm
- Equipped with a parallel gripper
- Executes manipulation tasks according to the teleoperation commands


# Camera Setup
A dual-camera observation system was used during data collection.

## Camera 1: Fixed Camera
- Mounted on a fixed support
- Captures the global workspace
- Provides scene-level visual observations

## Camera 2: Wrist Camera
- Mounted behind the Piper gripper
- Captures close-range manipulation details
- Provides fine-grained grasping observations



# Real Robot Deployment


## Overview


The trained smolVLA policy was deployed on a real Piper robotic arm using the LeRobot asynchronous inference pipeline.


The deployment system separates policy inference and robot execution.

```text
GPU Machine
(smolVLA Policy Server)

        |
        | TCP Network
        |

Robot Computer
(LeRobot Robot Client)

        |
        | CAN Bus

Piper Robotic Arm
```


---

# Hardware Setup


## Robot

- Piper robotic arm
- 6-DoF manipulator
- Parallel gripper


## Cameras


Two RGB cameras are used during inference:


Camera 1:

- Fixed workspace camera


Camera 2:

- Wrist-mounted camera behind the gripper


---

# Inference Architecture


The deployment follows the LeRobot async inference architecture:
Camera Observation
    ↓
Robot Client
    ↓
Policy Server
    ↓
smolVLA Action Prediction
    ↓
Action Chunk
    ↓
Piper Robot Controller


---

# Policy Checkpoint


The trained policy checkpoint:
```
/root/autodl-tmp/checkpoints/checkpoints/040000/pretrained_model
```

---

# Deployment Command


Run robot client:


```bash
python -m lerobot.async_inference.robot_client \
  --server_address=127.0.0.1:8080 \
  --robot.type=piper \
  --robot.can_interface=can0 \
  --robot.bitrate=1000000 \
  --robot.include_gripper=true \
  --robot.use_degrees=false \
  --robot.cameras='{camera1: {type: opencv, index_or_path: /dev/video6, width:640, height:480, fps:30}, camera2:{type:opencv,index_or_path:/dev/video5,width:640,height:480,fps:30}}' \
  --task="Put the banana on the plate." \
  --policy_type=smolvla \
  --pretrained_name_or_path=/root/autodl-tmp/checkpoints/smolvla_piper_test/checkpoints/040000/pretrained_model \
  --policy_device=cuda \
  --client_device=cpu \
  --fps=15 \
  --actions_per_chunk=50 \
  --chunk_size_threshold=0.5 \
  --aggregate_fn_name=weighted_average
```
# Real Robot Evaluation
Task:

Pick fruit objects and place them into the target plate.

Evaluation:

The trained policy was tested on real Piper hardware.

Results:

The trained smolVLA policy successfully executed autonomous pick-and-place manipulation on the real Piper robot.
The experiment demonstrated:

- Vision-language conditioned manipulation
- Closed-loop policy execution
- Real-world robot deployment using LeRobot inference pipeline

Performance was sensitive to object diversity and demonstration consistency.

# Lessons Learned
For small-scale VLA models, data quality and task design are critical.

Important factors:

- Demonstration consistency
- Object placement distribution
- Dataset complexity
- Action trajectory quality

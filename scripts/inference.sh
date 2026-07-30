#云端执行
python -m lerobot.async_inference.policy_server \ 
--host=127.0.0.1 \ 
--port=8080 \ 
--fps=15

#本地执行
ssh -CNg -L 8080:127.0.0.1:8080 root@region-9.autodl.pro -p 37237
#换终端本地执行
conda activate lerobot
pip install "lerobot[async]"
python -m lerobot.async_inference.robot_client \
  --server_address=127.0.0.1:8080 \
  --robot.type=piper \
  --robot.can_interface=can0 \
  --robot.bitrate=1000000 \
  --robot.include_gripper=true \
  --robot.use_degrees=false \
  --robot.cameras='{camera1: {type: opencv, index_or_path: /dev/video6, width: 640, height: 480, fps: 30}, camera2: {type: opencv, index_or_path: /dev/video5, width: 640, height: 480, fps: 30}}' \
  --task="Put the banana on the plate." \
  --policy_type=smolvla \
  --pretrained_name_or_path=/root/autodl-tmp/checkpoints/smolvla_piper_test/checkpoints/040000/pretrained_model \
  --policy_device=cuda \
  --client_device=cpu \
  --fps=15 \
  --actions_per_chunk=50 \
  --chunk_size_threshold=0.5 \
  --aggregate_fn_name=weighted_average \
  --debug_visualize_queue_size=True


# if you need link dataset with your local file
# edit -v parameter
# ex) -v <local directory>:<docker directory>
# -v /home/martin/Documents/dev/yolov1/datasets:/datasets

# if you don't need link local directory, remove -v option and parameter
# ex) sudo docker run --runtime=nvidia --rm -i -t --name yolov1 you_only_look_once:0.1.0 /bin/bash
# sudo docker run --runtime=nvidia --rm -i -t --name yolov1 -v /home/martin/Documents/dev/yolov1/datasets:/datasets you_only_look_once:0.1.0 /bin/bash

sudo docker run --runtime=nvidia --rm -i -t \
	--user=$(id -u) \
	--env="DISPLAY" \
	--volume="/etc/group:/etc/group:ro" \
	--volume="/etc/passwd:/etc/passwd:ro" \
	--volume="/etc/shadow:/etc/shadow:ro" \
	--volume="/etc/sudoers.d:/etc/sudoers.d:ro" \
	--volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" \
	--name yolov1 you_only_look_once:0.1.0 \
	/bin/bash

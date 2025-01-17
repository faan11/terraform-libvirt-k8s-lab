control-image         = "https://cloud-images.ubuntu.com/jammy/20230302/jammy-server-cloudimg-amd64.img"
#control-image         = "https://cloud-images.ubuntu.com/focal/current/focal-server-cloudimg-amd64.img"
control-number        = 1
control-vcpus         = 2
control-memory        = 2048
control-volume-prefix = "k8s-control-plane"
control-volume-size   = 26843545602 # 25GB

#nodes-image         = "https://cloud-images.ubuntu.com/focal/current/focal-server-cloudimg-amd64.img"
nodes-image         = "https://cloud-images.ubuntu.com/jammy/20230302/jammy-server-cloudimg-amd64.img"
nodes-number        = 2
nodes-vcpus         = 2
nodes-memory        = 2048
nodes-volume-prefix = "k8s-nodes"
nodes-volume-size   = 26843545600 #25GB


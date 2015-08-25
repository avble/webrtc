# 
export GYP_CROSSCOMPILE=1
export GYP_DEFINES="target_arch=arm arm_float_abi=hard clang=0 include_tests=0 sysroot=$(pwd)/rootfs"
export GYP_GENERATOR_OUTPUT='arm'
export CXXFLAGS="-std=gnu++11"
export JAVA_HOME=/usr/lib/jvm/java-7-openjdk-amd64
source /etc/profile

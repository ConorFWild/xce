
cookie=$1

xauth add cookie

sudo singularity shell --writable ./xce_container.img

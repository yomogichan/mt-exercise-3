#! /bin/bash

scripts=`dirname "$0"`
base=$(realpath $scripts/..)

models=$base/models
data=$base/data
tools=$base/tools

mkdir -p $models

num_threads=4
device=""

SECONDS=0

(cd $tools/pytorch-examples/word_language_model &&
    CUDA_VISIBLE_DEVICES=$device OMP_NUM_THREADS=$num_threads python main.py --data $data/emma \
        --epochs 40 \
        --log-interval 100 \
        --emsize 200 --nhid 200 --dropout 0 --tied \
        --save $models/model_en_0.pt
        > $models/evaluation_output_emma_0.txt
)
echo "time taken:"
echo "$SECONDS seconds"

(cd $tools/pytorch-examples/word_language_model &&
    CUDA_VISIBLE_DEVICES=$device OMP_NUM_THREADS=$num_threads python main.py --data $data/emma \
        --epochs 40 \
        --log-interval 100 \
        --emsize 200 --nhid 200 --dropout 0.2 --tied \
        --save $models/model_en_02.pt
        > $models/evaluation_output_emma_02.txt
)
echo "time taken:"
echo "$SECONDS seconds"

(cd $tools/pytorch-examples/word_language_model &&
    CUDA_VISIBLE_DEVICES=$device OMP_NUM_THREADS=$num_threads python main.py --data $data/emma \
        --epochs 40 \
        --log-interval 100 \
        --emsize 200 --nhid 200 --dropout 0.4 --tied \
        --save $models/model_en_04.pt
        > $models/evaluation_output_emma_04.txt
)
echo "time taken:"
echo "$SECONDS seconds"

(cd $tools/pytorch-examples/word_language_model &&
    CUDA_VISIBLE_DEVICES=$device OMP_NUM_THREADS=$num_threads python main.py --data $data/emma \
        --epochs 40 \
        --log-interval 100 \
        --emsize 200 --nhid 200 --dropout 0.6 --tied \
        --save $models/model_en_06.pt
        > $models/evaluation_output_emma_06.txt
)
echo "time taken:"
echo "$SECONDS seconds"

(cd $tools/pytorch-examples/word_language_model &&
    CUDA_VISIBLE_DEVICES=$device OMP_NUM_THREADS=$num_threads python main.py --data $data/emma \
        --epochs 40 \
        --log-interval 100 \
        --emsize 200 --nhid 200 --dropout 0.8 --tied \
        --save $models/model_en_08.pt
        > $models/evaluation_output_emma_08.txt
)

echo "time taken:"
echo "$SECONDS seconds"

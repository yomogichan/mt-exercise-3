#! /bin/bash

scripts=`dirname "$0"`
base=$scripts/..

data=$base/data

mkdir -p $data

tools=$base/tools

# link default training data for easier access

mkdir -p $data/wikitext-2

for corpus in train valid test; do
    absolute_path=$(realpath $tools/pytorch-examples/word_language_model/data/wikitext-2/$corpus.txt)
    ln -snf $absolute_path $data/wikitext-2/$corpus.txt
done

# download a different interesting data set!

mkdir -p $data/emma

mkdir -p $data/emma/raw

# wget https://www.gutenberg.org/files/52521/52521-0.txt
# get our own dataset
wget https://www.gutenberg.org/cache/epub/158/pg158.txt
# mv 52521-0.txt $data/grimm/raw/tales.txt
mv pg158.txt $data/emma/raw/tales.txt


# preprocess slightly

cat $data/emma/raw/tales.txt | python $base/scripts/preprocess_raw.py > $data/emma/raw/tales.cleaned.txt

# tokenize, fix vocabulary upper bound

cat $data/emma/raw/tales.cleaned.txt | python $base/scripts/preprocess.py --vocab-size 5000 --tokenize --lang "en" --sent-tokenize > \
    $data/emma/raw/tales.preprocessed.txt

# split into train, valid and test

head -n 440 $data/emma/raw/tales.preprocessed.txt | tail -n 400 > $data/emma/valid.txt
head -n 840 $data/emma/raw/tales.preprocessed.txt | tail -n 400 > $data/emma/test.txt
tail -n 3075 $data/emma/raw/tales.preprocessed.txt | head -n 2955 > $data/emma/train.txt

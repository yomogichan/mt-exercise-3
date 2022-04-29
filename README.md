# MT Exercise 3: Pytorch RNN Language Models

This repo shows how to train neural language models using [Pytorch example code](https://github.com/pytorch/examples/tree/master/word_language_model).

# Requirements

- This only works on a Unix-like system, with bash.
- Python 3 must be installed on your system, i.e. the command `python3` must be available
- Make sure virtualenv is installed on your system. To install, e.g.

    `pip install virtualenv`

# Steps

Clone this repository in the desired place: (changed)
	git clone https://github.com/yomogichan/mt-exercise-3
	cd mt-exercise-3

Create a new virtualenv that uses Python 3. Please make sure to run this command outside of any virtual Python environment:

    ./scripts/make_virtualenv.sh

**Important**: Then activate the env by executing the `source` command that is output by the shell script above (changed):

	source venvs/torch3/bin/activate

Download and install required software:

    ./scripts/install_packages.sh

Download and preprocess data. Here [Emma by Jane Austen](https://www.gutenberg.org/ebooks/158) from [Project Gutenberg](https://www.gutenberg.org) is used (changed):

    ./scripts/download_data.sh

Train 5 models with Dropout 0, 0.2, 0.4, 0.6 and 0.8 and out put the models and the data of training (.txt) in ./models: (changed)

    ./scripts/train.sh

The training process can be interrupted at any time, and the best checkpoint will always be saved.

Generate (sample) some text from a trained model with the best result (Dropout 0.4) and output result in ./samples: (changed)

    ./scripts/generate.sh

# Analysis(Added)

Output a line plot of training result from a .txt file in  ./models:

	python3 ./scripts/epochplot.py ./models/<the result.txt file>
	
Output 2 CSV files of training result in ./models:

	python3 ./scripts/epochtable.py ./models/<the result.txt file>

# FREQUENT_WORDS

Program to find the most common words in text files within a given
folder, and the most common words in the folder overall.

## TO RUN:
- download all files from this repository
- run: "frequent_words" in MATLAB console to run using default inputs
- otherwise follow instructions in "help frequent_words"
    
## NOTES:
- Written and tested in MATLAB 2017b in Linux Mint 17

## INPUT: 
- top 'n' most common words
- name of input folder as string
- name of output folder as string
- allowed extensions as string array in format ".ext" (e.g. [".txt",".dat"])

## OUTPUT: 
- file in the output folder containing the top 'n' words in each
- file as well as the top 'n' in the folder as a whole. The name
- of the file is "frequent_files_[TIMESTAMP].out", where [TIMESTAMP] is a timestamp from when the program was started.

## INCLUDED FILES:
- frequent_words.m - main file
- import_files_char.m - import file as character array
- remove_punctuation_English.m - removes punctuation, english character set
- word_frequency_add.m - combine arrays of words and their frequencies
- word_frequency.m - find frequency of words

## INPUT_FILES: - test files
- 01 - QBF.txt - First paragraph of text from Wikipedia article on [The quick brown fox jumps over the lazy dog](https://en.wikipedia.org/wiki/The_quick_brown_fox_jumps_over_the_lazy_dog).
- 55789-0.txt - [Catalogue of Publications in Belles Lettres](http://www.gutenberg.org/ebooks/55789) from the Gutenberg Project 
- 55790-0.txt - [Captain Billy's Whiz Bang, Vol. 2. No. 13, October, 1920](http://www.gutenberg.org/ebooks/55790) from the Gutenberg Project
- 55800-0.txt - [Mosaic of New Mexico's Scenery, Rocks, and History](http://www.gutenberg.org/ebooks/55800) from the Gutenberg Project
- cat.jpg - Picture of a cat from the Wikipedia page on [cats](https://en.wikipedia.org/wiki/Cat). 
    
## OUTPUT_FILES: - test output file
- frequent_words_2017103020758.out - Output file from running frequent_words.m on test input files
    

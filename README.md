# XLing_Subword
This method jointly learns cross-lingual word embeddings for two languages. It is an extension over the Doung. 2016 (https://github.com/longdt219/XlingualEmb)
. The method proposed by Doung is working at the word level, thus, it does not have any clue about sub-words and therefore is not suitable for low-resource or morphologically rich languages which do not have enough training corpora and we will face many OOVs at the test time.
By incorporating the sub-word information during training, not only we increase the performance of this method, but it is also capable of handling OOVs.

To form the sub-words, we use the same method as fastText, breaking a word into its character n-grams. For our experiments, we consider n-grams between 3-6, and these numbers are hard-coded in the code. If you would like to consider are lengths, you can simply change them in the code. 

# Getting started

To build the model, you just need to clone the files and do make. 

How to run

We included the full extracted dictionaries from [Panlex] (http://panlex.org/) for several languages including (Afrikan, Azerbaijani, German, Dutch, Spanish, Italian, Greek, Finish, Japanse, Serbian, Russian, Chinese, Hungarian, Hebrew, Hindi, Bengali, Bosnian, Croatian, French, Estonian, Turkish) in folder /data/dicts. We also included a tiny mixed English-Italian monolingual data /data/mono/en_it.shuf.10k (borrowed from Doung et al. 2016) for demo purposes. 

please keep in mind, that if you are doing BLI test, you have to remove the test pairs from the training dictionaries. 

Note that both dictionary and monolingual data are pre-processed with

lowercase
add language prefix

Since this is an extension of Doung et al. 2016, for more details please refer to their repository (https://github.com/longdt219/XlingualEmb).

The following command will build the cross-lingual word embeddings for English and Italian.

./main -train data/mono/en_it.shuf.10k -output en.it.word.emb -size 300 -window 20 -iter 15 
-negative 25 -sample 0.0001 -alpha 0.025 -cbow 1 -threads 5 -dict data/dicts/en.it.panlex.all.processed 
-outputn en.it.context.emb -reg 0.01 -join 1 -selall 1 -nosel 0 -reg 0.01 -combine 0

Some options :

train : the training file which is the combination of English and Italian monolingual data.
output: the usual context word embedding output file which is for reference purpose only.
size, window, iter, negative, sample, alpha, cbow, threads : the same as Word2Vec
outputn : the word embedding file which is the final output. (This is the vector for negative samples).
dict : the bilingual dictionary
reg : the regulariser sensitivity for combining word and context embeddings.
run ./main without parameters for the full list of params.

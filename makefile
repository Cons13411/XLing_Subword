CC = gcc
#Using -Ofast instead of -O3 might result in faster code, but is supported only by newer GCC versions
CFLAGS = -lm -pthread -Ofast -march=native -Wall -funroll-loops -Wno-unused-result

all: main 

main: main.c
	$(CC) -g main.c -o main $(CFLAGS)

clean:
	rm -rf word2vec word2phrase distance word-analogy compute-accuracy

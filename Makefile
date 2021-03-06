bin=bin
inc=inc
src=src
cflags=-O3 -Wall
lflags=-lssl -lcrypto -lsqlite3
CC=gcc

medusa: main.o cache.o transformer.o exec.o
	$(CC) -o $(bin)/medusa main.o cache.o transformer.o exec.o $(cflags) $(lflags)

cache.o: $(src)/cache.c
	$(CC) -c $(src)/cache.c -I$(inc) $(cflags)

transformer.o: $(src)/transformer.c
	$(CC) -c $(src)/transformer.c -I$(inc) $(cflags)

exec.o: $(src)/exec.c
    $(CC) -c $(src)/exec.c -I$(inc) $(cflags)

main.o: $(src)/main.c
	$(CC) -c $(src)/main.c -I$(inc) $(cflags)

.PHONY: clean

clean:
	rm -f *.o
CC=gcc
FC=gfortran

all: test.exe

test.o: test.c
	${CC} -c test.c

test.exe: test.F90 \
          test.o
	${FC} test.F90 test.o -o test.exe

clean:
	rm test.o test.exe


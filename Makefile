CC=mpicc
FC=mpifort

all: test.exe

test.o: test.c
	${CC} -c test.c

xxx.mod: xxx.F90
	${FC} -c xxx.F90

test.exe: test.F90 \
          test.o \
          xxx.mod
	${FC} test.F90 test.o -o test.exe

clean:
	rm test.o test.exe xxx.mod


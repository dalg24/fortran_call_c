all: test.exe

test.o: test.c
	gcc -c test.c

test.exe: test.F90 \
          test.o
	gfortran test.F90 test.o -o test.exe

clean:
	rm test.o test.exe


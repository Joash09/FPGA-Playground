CXX=gcc
FLAGS=-lm

DEPS=
OBJ=ieee.o

%.o: %.c
	$(CXX) -c -o $@ $< $(FLAGS)

main: $(OBJ)
	$(CXX) -o $@ $^ $(FLAGS)

clean:
	@rm *.o

CXX=gcc
FLAGS=-lm

DEPS=
OBJ=main.o

%.o: %.c
	$(CXX) -c -o $@ $< $(FLAGS)

main: $(OBJ)
	$(CXX) -o $@ $^ $(FLAGS)

clean:
	@rm *.o

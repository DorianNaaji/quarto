EXEC = bin/quarto

GGDB = -Wall -ggdb
paramC = -std=c++11 -Wall -c
libFlags = -lsfml-graphics -lsfml-window -lsfml-system
OBJ = 	obj/Pion.o \
		obj/Case.o \
		obj/Grille.o \
		obj/IA.o \
		obj/Jeu.o

HEADER= src/Pion.h src/Case.h src/Grille.h src/IA.h

all: $(EXEC)

bin/quarto: main.cpp $(OBJ)
	g++ $(GGBD) main.cpp $(OBJ) -o bin/quarto $(libFlags)

obj/%.o: src/%.cpp $(HEADER)
	g++ $(paramC) $< -o $@

ifeq ($(OS),Windows_NT)
clean:
	del /f obj\*.o

veryclean: clean
	del /f bin\*.exe
else
clean:
	rm obj/*.o

veryclean:
	rm bin/*
	make clean
endif
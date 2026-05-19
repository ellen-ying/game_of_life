# Variables
CXX = g++
CXXFLAGS = -Wall -std=c++17 -I/opt/homebrew/include
LDFLAGS = -L/opt/homebrew/lib -lraylib -framework CoreVideo -framework IOKit -framework Cocoa -framework OpenGL
OBJ = main.o grid.o simulation.o

# The final executable
game_of_life: $(OBJ)
	$(CXX) $(OBJ) -o game_of_life $(LDFLAGS)

# Rules for individual object files
main.o: main.cpp includes/grid.hpp
	$(CXX) $(CXXFLAGS) -c main.cpp

grid.o: grid.cpp includes/grid.hpp
	$(CXX) $(CXXFLAGS) -c grid.cpp

simulation.o: simulation.cpp includes/simulation.hpp
	$(CXX) $(CXXFLAGS) -c simulation.cpp

# Clean up files
clean:
	rm -f *.o game_of_life
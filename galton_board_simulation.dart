import 'dart:io';
import 'dart:math';

void main() {

  print('Enter the number of rows:');
  int rows = int.parse(stdin.readLineSync()!);

  if (rows <= 0) {
    print('Number of rows must be a positive integer.');
    return;
  }

  print('Enter the number of balls:');
  int numBalls = int.parse(stdin.readLineSync()!);

  if (numBalls <= 0) {
    print('Number of balls must be a positive integer.');
    return;
  }

  // Initialize the distribution list with all bins having 0 balls initially
  List<int> distribution = List.filled(rows + 1, 0); 

  // Simulate each ball's path and update the distribution
  for (int ball = 0; ball < numBalls; ball++) {
    int finalPosition = simulateBall(rows); 
    distribution[finalPosition]++; 
  }

  // Print the Galton board visualization
  printGaltonBoard(distribution);
}

// Simulates a single ball falling through the Galton board, 
// introducing a slight bias for a more stochastic behavior.
int simulateBall(int rows) {
  int position = 0;
  Random random = Random(); // Using the seeded Random instance
  
  for (int i = 0; i < rows; i++) {
    // Introduce a slight bias (e.g., 55% chance to go right)
    // This makes the simulation less deterministic
    if (random.nextDouble() < 0.55) { 
      position++;
    }
  }
  return position;
}

// Prints the Galton board visualization with ball distribution.
void printGaltonBoard(List<int> distribution) {
  for (var row = 0; row < distribution.length; row++) {
    _printRowDistribution(row, distribution[row]);
  }
}

// Prints the distribution for a single row using '~'.
void _printRowDistribution(int rowNumber, int ballCount) {
  final ballRepresentation = '~' * ballCount;
  print('$rowNumber: $ballRepresentation');
}

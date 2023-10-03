class SeatNumber {
  int colI;
  int rowI;

  SeatNumber({required this.colI, required this.rowI});
  int get getColI => colI;

  set setColI(int colI) => this.colI = colI;

  get getRowI => rowI;

  set setRowI(rowI) => this.rowI = rowI;
}

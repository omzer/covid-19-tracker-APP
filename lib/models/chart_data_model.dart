class ChartDataModel {
  String date;
  double infected, healed, lost, active;

  ChartDataModel.fromString(String line) {
    List<String> data = line.split(";");
    date = data[0];
    infected = double.parse(data[1]);
    healed = double.parse(data[2]);
    lost = double.parse(data[3]);
    active = double.parse(data[4]);
  }

  @override
  String toString() {
    return 'ChartDataModel{date: $date, infected: $infected, healed: $healed, lost: $lost, active: $active}';
  }
}

class ChartDataModel {
  String date, infected, healed, lost, active;

  ChartDataModel.fromString(String line) {
    List<String> data = line.split(";");
    date = data[0];
    infected = data[1];
    healed = data[2];
    lost = data[3];
    active = data[4];
  }

  @override
  String toString() {
    return 'ChartDataModel{date: $date, infected: $infected, healed: $healed, lost: $lost, active: $active}';
  }
}

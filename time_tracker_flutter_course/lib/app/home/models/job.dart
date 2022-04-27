class Job {
  Job({required this.name, required this.ratePerHour});
  final String name;
  final int ratePerHour;

  static Job? fromMap(Map<String, dynamic>? data) {
    if (data == null) {
      return null;
    }
    final String name = data['name'];
    final int ratePerHour = data['ratePerHour'];
    return Job(name: name, ratePerHour: ratePerHour);
  }

  // Crear método para convertir objetos en valores Map
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'ratePerHour': ratePerHour,
    };
  }
}

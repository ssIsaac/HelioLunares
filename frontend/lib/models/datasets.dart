//enumerations

enum Databases {
  users,
  event,
  usersadd,
}

// userrsadd is temp unrtil auth working
enum Tag {
  E,
}

enum OrderType {
  CHRONOLOGICAL,
}

abstract class dataSets {
  final int id;

  dataSets({required this.id});

  Databases getDatabase() {
    return Databases.users;
  }
}

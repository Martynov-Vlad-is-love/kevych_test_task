abstract class Repository<T> {
  Future<T?> getByName(String city);
}
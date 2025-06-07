abstract class UserEvent {}

class FetchUsers extends UserEvent {
  final int offset;
  FetchUsers({this.offset = 0});
}
class SearchUsers extends UserEvent {
  final String query;
  SearchUsers(this.query);
}
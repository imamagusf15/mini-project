class User {
  final String userId, userName;
  int? userBalance;

  User({
    required this.userId,
    required this.userName,
    this.userBalance,
  });
}

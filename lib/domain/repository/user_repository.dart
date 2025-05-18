abstract class UserRepository {
  Future<dynamic> loginWithEmailAndPassword({
    required String email,
    required String password,
  });

  Future<dynamic> registerWithEmailAndPassword({
    required String email,
    required String password,
  });

  Stream<dynamic> authStateChanges();
}

class APIPath {
  // Aquí se agregan las rutas
  static String job(String uid, String jobId) => 'users/$uid/jobs/$jobId';
  static String jobs(String uid) => '/users/$uid/jobs';
}

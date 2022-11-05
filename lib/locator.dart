import 'package:auth/auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';

import 'Repositories/cloud_repository.dart';

final GetIt locator = GetIt.instance;

void setUpLocator() {
  // Repository

  locator.registerSingleton(
    CloudRepository(
      firebaseFirestore: FirebaseFirestore.instance,
      firebaseAuth: FirebaseAuth.instance,
    ),
  );
}

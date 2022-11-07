import 'package:auth/auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';
import 'package:nyumba/Repositories/mpesa_repository.dart';

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

  locator.registerSingleton(MpesaRepository());
}

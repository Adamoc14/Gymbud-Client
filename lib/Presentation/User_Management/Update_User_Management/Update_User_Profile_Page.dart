// Imports

// Library Imports

import 'package:Client/Helpers/GeneralHelperMethodManager.dart';
import 'package:Client/Helpers/Libs_Required.dart';
import 'package:Client/Managers/Providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

// Template to make the UpdateProfile View Page
class UpdateProfilePage extends HookWidget {
  @override
  Widget build(BuildContext context) {
    // Obtaining the current logged in user
    final logged_in_user = useProvider(user_notifier_provider.state);

    // Make new GeneralMethodsManager Instance
    final generalHelperMethodManager = GeneralHelperMethodManager(
        logged_in_user: logged_in_user, context: context);

    // Basic details up form key to be used for validation and on this page
    final _basicDetailsUpdateKey = GlobalKey<FormBuilderState>();

    return Scaffold(
      body: generalHelperMethodManager.getUpdateProfilePageBody(
          context, _basicDetailsUpdateKey),
    );
  }
}

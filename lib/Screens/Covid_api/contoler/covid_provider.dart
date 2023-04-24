
import 'package:flutter/material.dart';

import '../../../utils/api_helper.dart';
import '../model/covid_model.dart';

class HomeProvider extends ChangeNotifier
{
  Future<Datamodel> getData()
  async {
    ApiHelper apiHelper = ApiHelper();
    Datamodel d1 = await  apiHelper.Apicall();
    return d1;
    }
}
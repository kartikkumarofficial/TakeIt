import 'package:get/get.dart';

class Languages extends Translations{

  @override
  Map<String , Map<String,String>> get keys =>{
    'en_US':{
      'TakeIt':'TakeIt',
      'message':'What is your name ',
      'name': 'Kartik',
      'localisation':'English',
      'language':'Changing Tile Language',
      'GET STARTED':'GET STARTED',
      'Quality,affordability, and convenience':'Quality,affordability, and convenience',
      'in every click.':'in every click.',


    },
    'hi_IN':{
      'message':'आपका क्या नाम है ',
      'name': 'कार्तिक',
      'localisation':'हिन्दी',
      // 'language':'टाइल भाषा बदलना'
      'TakeIt': 'TakeIt',
      'GET STARTED':'GET STARTED',
      'Quality,affordability, and convenience':'Quality,affordability, and convenience',
      'in every click.':'in every click.'

    },
  };

}
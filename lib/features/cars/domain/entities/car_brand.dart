import 'package:event_creator/utils/exception/app_exception.dart';

enum CarBrand {
  volvo('Volvo'),
  mercedes('Mercedes'),
  audi('Audi'),
  bmw('BMW'),
  toyota('toyota'),
  miniCooper('Mini coper'),
  volkswagen('Volkswagen'),
  nissan('Nissan'),
  jeep('jeep'),
  tesla('Tesla'),
  kia('KIA'),
  honda('Honda'),
  peugeot('Peugeot'),
  skoda('Skoda'),
  byd('BYD');

  final String text;

  const CarBrand(this.text);

  factory CarBrand.fromText(String text) {
    final textBrands = {
      volvo.text: volvo,
      mercedes.text: mercedes,
      audi.text: audi,
      bmw.text: bmw,
      toyota.text: toyota,
      miniCooper.text: miniCooper,
      volkswagen.text: volkswagen,
      nissan.text: nissan,
      jeep.text: jeep,
      tesla.text: tesla,
      kia.text: kia,
      honda.text: honda,
      peugeot.text: peugeot,
      skoda.text: skoda,
      byd.text: byd,
    };

    if (textBrands.containsKey(text)) {
      return textBrands[text]!;
    } else {
      throw InvalidCarBrandException();
    }
  }
}

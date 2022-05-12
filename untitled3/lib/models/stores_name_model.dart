class Hotel {
  String imageUrl;
  String name;
  String address;
 // int price;

  Hotel({
    required this.imageUrl,
    required this.name,
    required this.address,
  //  this.price,
  });
}

final List<Hotel> hotels = [
  Hotel(
    imageUrl: 'assets/images/hotel0.jpg',
    name: 'babylone',
    address: 'Sufyan St.',
   // price: 175,
  ),
  Hotel(
    imageUrl: 'assets/images/hotel1.jpg',
    name: 'Areena',
    address: 'Al-adel St',
   // price: 300,
  ),
  Hotel(
    imageUrl: 'assets/images/hotel2.jpg',
    name: 'Dabiee Toys',
    address: 'Palestine St.',
   // price: 240,
  ),
];

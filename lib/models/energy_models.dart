class Energys {
  int id;
  String name;

  Energys(this.id, this.name);

  static List<Energys> getCompanies() {
    return <Energys>[
      Energys(1, 'Hydroelectricity'),
      Energys(2, 'Wind power '),
      Energys(3, 'Solar energy '),
      Energys(4, 'Geothermal power'),
    ];
  }
}

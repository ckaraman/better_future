class Energys {
  int id;
  String name;

  Energys(this.id, this.name);

  static List<Energys> getCompanies() {
    return <Energys>[
      Energys(1, 'Hidroelektrik Enerjisi'),
      Energys(2, 'Rüzgar Enerjisi '),
      Energys(3, 'Güneş Enerjisi'),
      Energys(4, 'Jeotermal Enerji'),
    ];
  }
}

class UserModel {
  String? uid;
  String? email;
  String? id_major;
  String? jkel;
  String? nama;
  String? phone;
  String? tglLahir;
  int? saldo;

  UserModel(
      {this.uid,
      this.email,
      this.id_major,
      this.jkel,
      this.nama,
      this.phone,
      this.tglLahir,
      this.saldo});

  // reciving data from server
  factory UserModel.fromMap(map) {
    return UserModel(
      uid: map['uid'],
      email: map['email'],
      id_major: map['id_major'],
      jkel: map['jkel'],
      nama: map['nama'],
      phone: map['phone'],
      tglLahir: map['tglLahir'],
      saldo: map['saldo'],
    );
  }
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'id_major': id_major,
      'jkel': jkel,
      'nama': nama,
      'phone': phone,
      'tglLahir': tglLahir,
      'saldo' : saldo
    };
  }
}

class UserModel {
  String? uid;
  String? email;
  String? id_major;
  String? jkel;
  String? nama;
  String? phone;
  String? tglLahir;

  UserModel(
      {this.uid,
      this.email,
      this.id_major,
      this.jkel,
      this.nama,
      this.phone,
      this.tglLahir});

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
    };
  }
}

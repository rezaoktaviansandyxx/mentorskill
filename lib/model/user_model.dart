class UserModel {
  String? uid;
  String? email;
  String? id_major;
  String? id_mentor;
  String? jkel;
  String? nama;
  String? phone;
  String? tglLahir;
  int saldo = 0;
  String? url;

  UserModel(
      {this.uid,
      this.email,
      this.id_major,
      this.id_mentor,
      this.jkel,
      this.nama,
      this.phone,
      this.tglLahir,
      required this.saldo,
      this.url});

  // reciving data from server
  factory UserModel.fromMap(map) {
    return UserModel(
      uid: map['uid'],
      email: map['email'],
      id_major: map['id_major'],
      id_mentor: map['id_mentor'],
      jkel: map['jkel'],
      nama: map['nama'],
      phone: map['phone'],
      tglLahir: map['tglLahir'],
      saldo: map['saldo'],
      url: map['url'],
    );
  }
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'id_major': id_major,
      'id_mentor': id_mentor,
      'jkel': jkel,
      'nama': nama,
      'phone': phone,
      'tglLahir': tglLahir,
      'saldo': saldo,
      'url': url,
    };
  }
}

import 'package:flutter/material.dart';

void main() => runApp(const DoaRosarioApp());

const kBrown = Color(0xFF7B4F3A);
const kBrownDark = Color(0xFF6D4230);
const kBrownLight = Color(0xFFF5EDE8);

class DoaRosarioApp extends StatelessWidget {
  const DoaRosarioApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Doa Rosario',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: kBrown),
        appBarTheme: const AppBarTheme(
          backgroundColor: kBrown,
          foregroundColor: Colors.white,
          centerTitle: false,
          elevation: 0,
        ),
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const HomePage(),
    );
  }
}

// ─── SHARED WIDGETS ─────────────────────────────────────────────────────────

class BrownButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  const BrownButton({super.key, required this.label, required this.onTap});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: onTap,
          style: ElevatedButton.styleFrom(
            backgroundColor: kBrown,
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(vertical: 16),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
            elevation: 1,
          ),
          child: Text(label, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500)),
        ),
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String text;
  const SectionTitle(this.text, {super.key});
  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.only(top: 24, bottom: 8),
    child: Text(text, textAlign: TextAlign.center,
      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black87)),
  );
}

class PrayerText extends StatelessWidget {
  final String text;
  final bool italic;
  const PrayerText(this.text, {super.key, this.italic = false});
  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.symmetric(vertical: 6),
    child: Text(text, textAlign: TextAlign.center,
      style: TextStyle(fontSize: 15, height: 1.7,
        fontStyle: italic ? FontStyle.italic : FontStyle.normal,
        color: Colors.black87)),
  );
}

class MysteryImage extends StatelessWidget {
  final String path;
  const MysteryImage(this.path, {super.key});
  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.symmetric(vertical: 10),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Image.asset(path, height: 220, width: double.infinity, fit: BoxFit.cover,
        errorBuilder: (_, __, ___) => Container(
          height: 220, color: kBrownLight,
          child: const Center(child: Icon(Icons.image, color: kBrown, size: 48)))),
    ),
  );
}

class IntentionLabel extends StatelessWidget {
  const IntentionLabel({super.key});
  @override
  Widget build(BuildContext context) => const Padding(
    padding: EdgeInsets.symmetric(vertical: 12),
    child: Text('[Permohonan / Intensi]', textAlign: TextAlign.center,
      style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black87)),
  );
}

AppBar rosarioAppBar(BuildContext context, String title) => AppBar(
  leading: IconButton(
    icon: const Icon(Icons.arrow_back),
    onPressed: () => Navigator.pop(context),
  ),
  title: Row(children: [
    const Icon(Icons.circle_outlined, size: 18),
    const SizedBox(width: 6),
    Text(title),
  ]),
  actions: [IconButton(icon: const Icon(Icons.more_vert), onPressed: () {})],
);

// ─── HOME PAGE ───────────────────────────────────────────────────────────────

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(children: [
          Icon(Icons.circle_outlined, size: 18),
          SizedBox(width: 6),
          Text('Doa Rosario'),
        ]),
        actions: [IconButton(icon: const Icon(Icons.more_vert), onPressed: () {})],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header image
            Image.asset('assets/images/rosario.png',
              height: 220, width: double.infinity, fit: BoxFit.contain,
              errorBuilder: (_, __, ___) => Container(
                height: 220, color: kBrownLight,
                child: const Center(child: Icon(Icons.circle_outlined, color: kBrown, size: 80)))),
            const SizedBox(height: 8),
            // Rosario buttons
            BrownButton(label: 'Senin & Sabtu: Peristiwa Gembira',
              onTap: () => _go(context, const RosarioPage(type: RosarioType.gembira))),
            BrownButton(label: 'Selasa & Jumat: Peristiwa Sedih',
              onTap: () => _go(context, const RosarioPage(type: RosarioType.sedih))),
            BrownButton(label: 'Rabu & Minggu: Peristiwa Mulia',
              onTap: () => _go(context, const RosarioPage(type: RosarioType.mulia))),
            BrownButton(label: 'Kamis: Peristiwa Terang',
              onTap: () => _go(context, const RosarioPage(type: RosarioType.terang))),
            BrownButton(label: 'Kumpulan Peristiwa',
              onTap: () => _go(context, const KumpulanPeristiwaPage())),
            BrownButton(label: '15 Janji Rosario',
              onTap: () => _go(context, const JanjiRosarioPage())),
            BrownButton(label: 'Rahasia Rosario',
              onTap: () => _go(context, const RahasiaRosarioPage())),
            const SizedBox(height: 16),
            const Text('Doa Lainnya',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black87)),
            const SizedBox(height: 8),
            BrownButton(label: 'Doa Kerahiman Ilahi',
              onTap: () => _go(context, const KoronkaPage())),
            BrownButton(label: 'Meditasi Doa Yesus',
              onTap: () => _go(context, const SimpleTextPage(
                title: 'Meditasi Doa Yesus',
                content: meditasiDoaYesus))),
            BrownButton(label: 'Doa Rosario Pembebasan',
              onTap: () => _go(context, const SimpleTextPage(
                title: 'Doa Rosario Pembebasan',
                content: rosarioPembebasan))),
            BrownButton(label: 'Devosi 7 Dukacita Maria',
              onTap: () => _go(context, const SevenSorrowsPage())),
            BrownButton(label: 'Devosi Maria Bunda Penolong Abadi',
              onTap: () => _go(context, const SimpleTextPage(
                title: 'Devosi Maria Bunda Penolong Abadi',
                content: bundaPenolongAbadi))),
            BrownButton(label: 'Doa Novena',
              onTap: () => _go(context, const SimpleTextPage(
                title: 'Doa Novena',
                content: doaNovena))),
            BrownButton(label: 'Doa Regina Caeli & Angelus',
              onTap: () => _go(context, const SimpleTextPage(
                title: 'Doa Regina Caeli & Angelus',
                content: reginaCaeli))),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
  void _go(BuildContext ctx, Widget page) =>
    Navigator.push(ctx, MaterialPageRoute(builder: (_) => page));
}

// ─── ROSARIO TYPE ────────────────────────────────────────────────────────────

enum RosarioType { gembira, sedih, mulia, terang }

// ─── ROSARIO PAGE ────────────────────────────────────────────────────────────

class RosarioPage extends StatelessWidget {
  final RosarioType type;
  const RosarioPage({super.key, required this.type});

  String get title {
    switch (type) {
      case RosarioType.gembira: return 'Peristiwa Gembira';
      case RosarioType.sedih: return 'Peristiwa Sedih';
      case RosarioType.mulia: return 'Peristiwa Mulia';
      case RosarioType.terang: return 'Peristiwa Terang';
    }
  }

  List<MysteryData> get mysteries {
    switch (type) {
      case RosarioType.gembira: return gembiraMysteries;
      case RosarioType.sedih: return sedihMysteries;
      case RosarioType.mulia: return muliaMysteries;
      case RosarioType.terang: return terangMysteries;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: rosarioAppBar(context, title),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        children: [
          Text('Doa Rosario: $title', textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SectionTitle('0.0. Tanda Salib'),
          const PrayerText('Dalam Nama Bapa, dan Putra dan Roh Kudus. Amin'),
          const SectionTitle('0.1. Syahadat Para Rasul'),
          const PrayerText(prayerCredo),
          const SectionTitle('0.2. Kemuliaan'),
          const PrayerText(prayerKemuliaan),
          const SectionTitle('0.3. Terpujilah'),
          const PrayerText(prayerTerpujilah),
          const SectionTitle('0.4. Bapa Kami'),
          const PrayerText(prayerBapaKami),
          const SectionTitle('0.5. Salam, Putri Allah Bapa'),
          const PrayerText('Salam, Putri Allah Bapa'),
          const PrayerText(prayerSalamMaria),
          const SectionTitle('0.6. Salam, Bunda Allah Putra'),
          const PrayerText('Salam, Bunda Allah Putra'),
          const PrayerText(prayerSalamMaria),
          const SectionTitle('0.7. Salam, Mempelai Allah Roh Kudus'),
          const PrayerText('Salam, Mempelai Allah Roh Kudus'),
          const PrayerText(prayerSalamMaria),
          const SectionTitle('0.8. Kemuliaan'),
          const PrayerText(prayerKemuliaan),
          const SectionTitle('0.9. Terpujilah'),
          const PrayerText(prayerTerpujilah),
          // 5 mysteries
          for (int i = 0; i < mysteries.length; i++) ...[
            const Divider(height: 32, color: kBrownLight),
            _buildMystery(i + 1, mysteries[i]),
          ],
          const Divider(height: 32, color: kBrownLight),
          const SectionTitle('6.0. Salam Ya Ratu'),
          const PrayerText(prayerSalamYaRatu),
          const PrayerText('Doakanlah kami, ya Santa Bunda Allah\nSupaya kami dapat menikmati janji Kristus'),
          const PrayerText('[marilah berdoa / oremus]'),
          const PrayerText(prayerOremus),
          const SectionTitle('6.1. Penutup'),
          const PrayerText('Doa Penutup'),
          const SectionTitle('6.2. Tanda Salib'),
          const PrayerText('Dalam Nama Bapa, dan Putra dan Roh Kudus. Amin'),
          const SizedBox(height: 32),
        ],
      ),
    );
  }

  Widget _buildMystery(int num, MysteryData m) {
    return Column(
      children: [
        SectionTitle('$num.0 Peristiwa ${_ordinal(num)}'),
        Text(m.title, textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        MysteryImage(m.imagePath),
        PrayerText(m.verse, italic: true),
        PrayerText(m.meditation),
        const IntentionLabel(),
        SectionTitle('$num.1. Bapa Kami'),
        const PrayerText(prayerBapaKami),
        SectionTitle('$num.2. Salam Maria x 10'),
        const PrayerText(prayerSalamMaria),
        SectionTitle('$num.3. Kemuliaan'),
        const PrayerText(prayerKemuliaan),
        SectionTitle('$num.4. Terpujilah'),
        const PrayerText(prayerTerpujilah),
        SectionTitle('$num.5. Ya Yesus'),
        const PrayerText(prayerYaYesus),
      ],
    );
  }

  String _ordinal(int n) {
    const o = ['', 'Pertama', 'Kedua', 'Ketiga', 'Keempat', 'Kelima'];
    return o[n];
  }
}

// ─── MYSTERY DATA ────────────────────────────────────────────────────────────

class MysteryData {
  final String title;
  final String imagePath;
  final String verse;
  final String meditation;
  const MysteryData(this.title, this.imagePath, this.verse, this.meditation);
}

final gembiraMysteries = [
  const MysteryData(
    'Maria Menerima Kabar dari Malaikat Gabriel',
    'assets/images/g/g1.jpeg',
    'Salam hai engkau yang dikaruniai, Tuhan menyertai engkau; jangan takut, hai Maria, sebab engkau beroleh kasih karunia di hadapan Allah. Sesungguhnya engkau akan mengandung dan melahirkan seorang anak laki-laki dan hendaklah engkau menamai dia Yesus (Luk1:28b,30b-31).',
    'Bapa, jika Engkau bersabda maka semuanya terjadi. Bersabdalah, ya Bapa, aku ini hambaMu, terjadilah padaku menurut kehendakMu.',
  ),
  const MysteryData(
    'Maria Mengunjungi Elisabeth',
    'assets/images/g/g2.jpeg',
    'Diberkatilah engkau diantara semua perempuan dan diberkatilah buah rahimu. Siapakah aku ini sampai Ibu Tuhanku datang mengunjungi aku? (Luk1:42-43).',
    'Bapa, hatiku memuliakan Dikau dan jiwaku bersorak sorai karena Engkau Allah penuh kasih. Engkau menciptakan dan memelihara kami, anak-anakMu.',
  ),
  const MysteryData(
    'Yesus Dilahirkan di Betlehem',
    'assets/images/g/g3.jpeg',
    'Maria melahirkan seorang anak laki-laki, lalu dibungkusnya dengan kain lampin dan dibaringkannya di dalam palungan, karena tidak ada tempat bagi mereka di rumah penginapan (Luk 2:7).',
    'Bapa, kami bersyukur karena Engkau telah merelakan PutraMu menjadi manusia demi menebus dan mengampuni dosa-dosa kami jadikan kami layak menjadi anak-anakMu.',
  ),
  const MysteryData(
    'Yesus Dipersembahkan dalam Bait Allah',
    'assets/images/g/g4.jpeg',
    'Simeon berkata pada Maria, Sesungguhnya Anak ini ditentukan untuk menjatuhkan atau membangkitkan banyak orang di Israel dan untuk menjadi suatu tanda yang menimbulkan perbantahan. Kelak suatu pedang akan menembus jiwamu sendiri (Luk 2:34-35).',
    'Bapa, kami mempersembahkan segenap diri kami kepadaMu. Terimalah kami sebagai persembahan yang layak, demi jasa PutraMu, Juruselamat kami.',
  ),
  const MysteryData(
    'Yesus Ditemukan dalam Bait Allah',
    'assets/images/g/g5.jpeg',
    'Mengapa kamu mencari Aku? Tidaklah kamu tahu, bahwa Aku harus berada di dalam Rumah Bapa-Ku? Tetapi mereka tidak mengerti apa yang dikatakan-Nya kepada mereka (Luk 2:49-50).',
    'Bapa, Putra-Mu sepenuhnya hidup demi kemuliaan-Mu dan keselamatan kami. Bentuklah kami menjadi serupa dengan PutraMu.',
  ),
];

final sedihMysteries = [
  const MysteryData(
    'Yesus Berdoa Kepada Bapa-Nya di Surga dalam Sakratul Maut',
    'assets/images/s/s1.jpeg',
    'Ya Bapa-Ku, jikalau Engkau berkenan, ambilah cawan ini dari hadapan-Ku, tetapi janganlah menurut kehendak-Ku, melainkan kehendak-Mu yang terjadi (Mat 26:39).',
    'Bapa, ajarilah kami selalu mengikuti kehendak-Mu. Pada saat kami dicobai, Engkau pasti menyertai kami sebagai Bapa, karena Engkau sangat menyayangi kami.',
  ),
  const MysteryData(
    'Yesus Didera',
    'assets/images/s/s2.jpeg',
    'Mereka memukul kepalanya-Nya dengan buluh, dan meludahi-Nya dan berlutut menyembah-Nya. Sesudah mengolok-olok Dia, mereka menanggalkan jubah ungu yang dipakai-Nya dan mengenakan lagi pakaian-Nya kepada-Nya (Mrk 15:19-20a).',
    'Bapa, berilah kami rahmat untuk selalu mengingat sengsara-Mu, agar kami dapat berdiri teguh dan memikul salib dengan kasih.',
  ),
  const MysteryData(
    'Yesus Dimahkotai Duri',
    'assets/images/s/s3.jpeg',
    'Mereka menganyam sebuah mahkota duri dan menaruh di atas kepala-Nya. Kemudian mereka mulai memberi hormat kepada-Nya, katanya, Salam, hai raja orang Yahudi (Mrk 15:17-18).',
    'Bapa, Putra-Mu dimahkotai duri, tetapi Ia tidak pernah membenci algojonya. Ajarilah kami mengampuni dan memberkati sesama kami.',
  ),
  const MysteryData(
    'Yesus Memanggul Salib-Nya ke Gunung Kalvari',
    'assets/images/s/s4.jpeg',
    'Sambil memikul salib-Nya, Ia pergi keluar ketempat yang bernama Tempat Tengkorak, yang dalam bahasa Ibrani disebut Golgota (Yoh 19:16b).',
    'Bapa, ajarilah kami memikul salib kehidupan ini tanpa mengeluh dengan penuh iman, supaya kami sungguh serupa dengan Yesus, Putra-Mu sendiri.',
  ),
  const MysteryData(
    'Yesus Wafat di Salib',
    'assets/images/s/s5.jpeg',
    'Yesus berseru dengan suara nyaring "Ya Bapa ke dalam tangan-Mu Ku serahkan nyawa-Ku". Sesudah berkata demikian Ia menyerahkan nyawa-Nya (Luk 23:46).',
    'Bapa, hadirlah dekat kami bersama Putra dan Roh-Mu pada saat kami menghadapi kematian, dan terimalah kami dalam kerajaan kasih-Mu yang kekal.',
  ),
];

final muliaMysteries = [
  const MysteryData(
    'Yesus Bangkit dari Antara Orang Mati',
    'assets/images/m/m1.jpg',
    'Malaikat itu berkata, janganlah kamu takut; sebab aku tahu kamu mencari Yesus yang disalibkan itu. Ia tidak ada di sini, sebab Ia telah bangkit, sama seperti yang telah dikatakan-Nya (Mat 28:5-6).',
    'Bapa, mampukanlah kami melanjutkan misi Putra-Mu yaitu memberitakan injil kepada semua orang agar kerajaan-Mu menjadi nyata di bumi ini.',
  ),
  const MysteryData(
    'Yesus Naik ke Surga',
    'assets/images/m/m2.jpg',
    'Sesudah Ia mengatakan demikian, Ia diangkat ke surga disaksikan oleh mereka, dan awan menutup-Nya dari pandangan mereka. Hai orang Galilea, mengapa kamu berdiri melihat ke langit? Yesus ini, yang diangkat ke surga meninggalkan kamu, akan kembali dengan cara yang sama seperti kamu lihat Dia naik ke surga (Kis1:9-11).',
    'Bapa, Engkau tumpuan hidup dan harapan kami. Tanamkanlah dalam diri kami keyakinan bahwa Engkau menyertai kami selalu hingga akhir zaman.',
  ),
  const MysteryData(
    'Roh Kudus Turun atas Para Rasul',
    'assets/images/m/m3.jpg',
    'Tiba-tiba terdengarlah bunyi dari langit seperti tiupan angin keras yang memenuhi seluruh rumah, dimana mereka duduk, lalu mereka semua dipenuhi Roh Kudus, dan mulai berbicara dalam bahasa lain, seperti yang diberikan oleh Roh itu kepada mereka untuk dikatakan (Kis 2:2,4).',
    'Bapa, semoga Roh Kudus-Mu membimbing hidup kami dalam kasih dan kebenaran-Mu, serta menjadikan kami layak dihadapan-Mu.',
  ),
  const MysteryData(
    'Maria Diangkat ke Surga',
    'assets/images/m/m4.jpg',
    'Jikalau kita percaya, bahwa Yesus telah mati dan telah bangkit, maka kita percaya juga bahwa dengan perantaraan Yesus, Allah akan mengumpulkan bersama-sama dengan Dia, mereka yang telah meninggal. Sesudah itu kita yang hidup, yang masih tinggal, akan diangkat bersama-sama dengan mereka dalam awan menyongsong Tuhan di angkasa. Demikianlah kita akan selama-lamanya bersama-sama Tuhan (1Tes4:14,17).',
    'Bapa, berilah kami iman yang hidup, dan jadikanlah kami saksi-Mu di hadapan sesama kami.',
  ),
  const MysteryData(
    'Maria Dimahkotai di Surga',
    'assets/images/m/m5.jpg',
    'Tampaklah suatu tanda besar di langit; seorang perempuan berselubungkan matahari, dengan bulan di bawah kakinya dan sebuah mahkota dari dua belas bintang di atas kepalaNya (Why 12:1).',
    'Bapa, satu-satunya sumber kasih sejati, kobarkanlah dalam diri kami semangat kasih-Mu kepada Bunda Putra-Mu sebab kami memandangnya sebagai teladan pengikut Yesus.',
  ),
];

final terangMysteries = [
  const MysteryData(
    'Yesus Dibaptis di Sungai Jordan',
    'assets/images/t/t1.jpeg',
    'Sesudah dibabtis, Yesus segera keluar dari air dan pada waktu itu juga langit terbuka dan Ia melihat Roh Allah seperti burung merpati turun ke atas-Nya, lalu terdengarlah suara dari surga mengatakan, "Inilah Anak-Ku yang terkasih, kepada-Nyalah Aku berkenan." (Mat 3:16-17).',
    'Bapa, kamipun Engkau beri misi sebagai anak-Mu dan pengikut Yesus. Buatlah kami menerima tugas itu dengan hati terbuka dan penuh suka cita.',
  ),
  const MysteryData(
    'Yesus Menyatakan Diri-Nya dalam Pesta Pernikahan di Kana',
    'assets/images/t/t2.jpeg',
    'Atas permintaan Maria, bunda-Nya, Yesus mengatasi kekurangan anggur. Hal itu dilakukan Yesus sebagai yang pertama dari tanda-tanda-Nya dan dengan itu Ia telah menyatakan kemuliaan-Nya, dan murid-murid-Nya percaya kepada-Nya (Yoh 2:11).',
    'Bapa, tolonglah kami mampu menghadapi setiap masalah hidup ini dengan tenang sambil mengandalkan kasih-Mu kepada kami.',
  ),
  const MysteryData(
    'Yesus Memberitakan Kerajaan Allah dan Menyerukan Pertobatan',
    'assets/images/t/t3.jpeg',
    'Bertobatlah, sebab kerajaan surga sudah dekat. Yesus pun berkeliling di seluruh Galilea, Ia mengajar dalam rumah-rumah ibadat dan memberitakan Injil Kerajaan Surga serta menyembuhkan orang-orang di antara bangsa itu (Mat 4:17,23).',
    'Bapa, pertobatkanlah kami. Ampunilah dosa kami. Jadikanlah kami mampu mengampuni orang yang telah menyakiti kami.',
  ),
  const MysteryData(
    'Yesus Menampakkan Kemuliaan-Nya',
    'assets/images/t/t4.jpeg',
    'Yesus berubah rupa di sebuah gunung yang tinggi. Wajah-Nya bercahaya seperti matahari. Allah bersabda kepada tiga rasul Yesus, "Inilah Anak-Ku yang terkasih, kepada-Nyalah Aku berkenan, dengarkanlah Dia" (Mat 17:2,5).',
    'Bapa, ajarlah kami mendengarkan Yesus dan sepenuhnya menerima ajaran-Nya. Izinkanlah kami semakin mengenal Dia, terutama dalam sengsara-Nya.',
  ),
  const MysteryData(
    'Yesus Menetapkan Ekaristi',
    'assets/images/t/t5.jpeg',
    'Yesus mengambil roti, mengucap syukur, memecahkan-mecahkannya lalu memberikannya kepada mereka dan berkata, "Ambilah, inilah tubuh-Ku". Sesudah itu Ia mengambil cawan, mengucap syukur lalu memberikannya kepada mereka. Ia berkata, "Inilah darah-Ku yang ditumpahkan bagi banyak orang" (Mar 14:22-24).',
    'Bapa, Sucikan dan kuduskanlah kami pada saat kami menerima Tubuh dan Darah Putra-Mu yang terkasih; pakailah kami sekehendak-Mu.',
  ),
];

// ─── KUMPULAN PERISTIWA ──────────────────────────────────────────────────────

class KumpulanPeristiwaPage extends StatelessWidget {
  const KumpulanPeristiwaPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: rosarioAppBar(context, 'Kumpulan Peristiwa'),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset('assets/images/jesus_mary.png',
              height: 200, width: double.infinity, fit: BoxFit.contain,
              errorBuilder: (_, __, ___) => Container(
                height: 200, color: kBrownLight,
                child: const Center(child: Icon(Icons.circle_outlined, color: kBrown, size: 64)))),
            const SizedBox(height: 8),
            BrownButton(label: 'Senin & Sabtu: Peristiwa Gembira',
              onTap: () => Navigator.push(context,
                MaterialPageRoute(builder: (_) => const RosarioPage(type: RosarioType.gembira)))),
            BrownButton(label: 'Selasa & Jumat: Peristiwa Sedih',
              onTap: () => Navigator.push(context,
                MaterialPageRoute(builder: (_) => const RosarioPage(type: RosarioType.sedih)))),
            BrownButton(label: 'Rabu & Minggu: Peristiwa Mulia',
              onTap: () => Navigator.push(context,
                MaterialPageRoute(builder: (_) => const RosarioPage(type: RosarioType.mulia)))),
            BrownButton(label: 'Kamis: Peristiwa Terang',
              onTap: () => Navigator.push(context,
                MaterialPageRoute(builder: (_) => const RosarioPage(type: RosarioType.terang)))),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}

// ─── 15 JANJI ROSARIO ───────────────────────────────────────────────────────

class JanjiRosarioPage extends StatelessWidget {
  const JanjiRosarioPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: rosarioAppBar(context, '15 Janji Rosario'),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text('15 Janji Bunda Maria Bagi Orang Yang Setia Berdoa Rosario',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 12),
          const PrayerText(janjiIntro),
          const SizedBox(height: 16),
          for (int i = 0; i < janjiList.length; i++)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Text('${i + 1}. ${janjiList[i]}',
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 15, height: 1.6)),
            ),
          const SizedBox(height: 32),
        ],
      ),
    );
  }
}

// ─── RAHASIA ROSARIO ─────────────────────────────────────────────────────────

class RahasiaRosarioPage extends StatelessWidget {
  const RahasiaRosarioPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: rosarioAppBar(context, 'Rahasia Rosario'),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset('assets/images/rahasia-rosario.png',
              height: 280, width: double.infinity, fit: BoxFit.contain,
              errorBuilder: (_, __, ___) => Container(
                height: 280, color: kBrownLight,
                child: const Center(child: Icon(Icons.book, color: kBrown, size: 80)))),
            const SizedBox(height: 8),
            BrownButton(label: 'Sinopsis Buku',
              onTap: () => Navigator.push(context,
                MaterialPageRoute(builder: (_) => const SimpleTextPage(
                  title: 'Ringkasan Buku', content: sinopsisBuku)))),
            BrownButton(label: 'Pendahuluan',
              onTap: () => Navigator.push(context,
                MaterialPageRoute(builder: (_) => const SimpleTextPage(
                  title: 'Pendahuluan', content: pendahuluan)))),
            BrownButton(label: 'Untuk Para Imam',
              onTap: () => Navigator.push(context,
                MaterialPageRoute(builder: (_) => const SimpleTextPage(
                  title: 'Untuk Para Imam', content: untukParaImam)))),
            BrownButton(label: 'Untuk Orang Berdosa',
              onTap: () => Navigator.push(context,
                MaterialPageRoute(builder: (_) => const SimpleTextPage(
                  title: 'Untuk Orang Berdosa', content: untukOrangBerdosa)))),
            BrownButton(label: 'Untuk Orang Saleh',
              onTap: () => Navigator.push(context,
                MaterialPageRoute(builder: (_) => const SimpleTextPage(
                  title: 'Untuk Orang Saleh', content: untukOrangSaleh)))),
            BrownButton(label: 'Untuk Anak-Anak',
              onTap: () => Navigator.push(context,
                MaterialPageRoute(builder: (_) => const SimpleTextPage(
                  title: 'Untuk Anak-Anak', content: untukAnakAnak)))),
            BrownButton(label: 'Selengkapnya',
              onTap: () => Navigator.push(context,
                MaterialPageRoute(builder: (_) => const SimpleTextPage(
                  title: 'Selengkapnya', content: selengkapnya)))),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}

// ─── KORONKA PAGE ────────────────────────────────────────────────────────────

class KoronkaPage extends StatelessWidget {
  const KoronkaPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: rosarioAppBar(context, 'Doa Kerahiman Ilahi'),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Image.asset('assets/images/koronka_full.jpg',
            height: 200, width: double.infinity, fit: BoxFit.cover,
            errorBuilder: (_, __, ___) => Container(height: 200, color: kBrownLight)),
          const SizedBox(height: 16),
          const SectionTitle('Pembuka'),
          const PrayerText('Ya Yesus, Engkau telah wafat, tetapi sumber kehidupan telah memancar bagi jiwa-jiwa dan lautan kerahiman terbuka bagi seluruh dunia.'),
          const SectionTitle('Pada manik Bapa Kami'),
          const PrayerText('Bapa yang kekal, kupersembahkan kepada-Mu Tubuh dan Darah, Jiwa dan Ke-Allahan Putra-Mu yang terkasih, Tuhan kami Yesus Kristus, sebagai pendamaian untuk dosa kami dan dosa seluruh dunia.'),
          const SectionTitle('Pada manik Salam Maria'),
          const PrayerText('Demi sengsara Yesus yang pedih, tunjukkanlah belas kasih-Mu kepada kami dan seluruh dunia.'),
          const SectionTitle('Penutup (3x)'),
          const PrayerText('Allah yang kudus, kudus dan berkuasa, kudus dan kekal, kasihanilah kami dan seluruh dunia. Amin.'),
          const SizedBox(height: 32),
        ],
      ),
    );
  }
}

// ─── SEVEN SORROWS PAGE ──────────────────────────────────────────────────────

class SevenSorrowsPage extends StatelessWidget {
  const SevenSorrowsPage({super.key});

  static const titles = [
    'Nubuat Simeon',
    'Pelarian ke Mesir',
    'Yesus Hilang di Bait Allah',
    'Maria Berjumpa Yesus Memanggul Salib',
    'Maria Berdiri di Kaki Salib',
    'Yesus Diturunkan dari Salib',
    'Yesus Dimakamkan',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: rosarioAppBar(context, 'Devosi 7 Dukacita Maria'),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Image.asset('assets/images/sevenS/7sorrows2.jpg',
            height: 200, width: double.infinity, fit: BoxFit.cover,
            errorBuilder: (_, __, ___) => Container(height: 200, color: kBrownLight)),
          const SizedBox(height: 12),
          const PrayerText('Untuk setiap dukacita: renungkan peristiwa, lalu doakan 1 Bapa Kami dan 7 Salam Maria.'),
          for (int i = 0; i < titles.length; i++) ...[
            SectionTitle('${i + 1}. ${titles[i]}'),
            MysteryImage('assets/images/sevenS/${i + 1}.jpg'),
            const PrayerText('Renungkan dukacita Maria dan mohon rahmat kesetiaan.'),
            const SizedBox(height: 8),
          ],
          const SizedBox(height: 32),
        ],
      ),
    );
  }
}

// ─── SIMPLE TEXT PAGE ────────────────────────────────────────────────────────

class SimpleTextPage extends StatelessWidget {
  final String title;
  final String content;
  const SimpleTextPage({super.key, required this.title, required this.content});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: rosarioAppBar(context, title),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text(title, textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 16),
          Text(content, textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 15, height: 1.7)),
          const SizedBox(height: 32),
        ],
      ),
    );
  }
}

// ─── PRAYER TEXTS ────────────────────────────────────────────────────────────

const prayerCredo =
  'Aku percaya akan Allah, Bapa yang Mahakuasa, pencipta langit dan bumi. Dan akan Yesus Kristus, Putra-Nya yang tunggal, Tuhan kita; yang dikandung dari Roh Kudus, dilahirkan oleh Perawan Maria; yang menderita sengsara dalam pemerintahan Pontius Pilatus, disalibkan, wafat dan dimakamkan; yang turun ke tempat penantian, pada hari ketiga bangkit pula dari antara orang mati; yang naik ke surga, duduk di sebelah kanan Allah Bapa yang Mahakuasa; dari situ Ia akan datang mengadili orang hidup dan mati. Aku percaya akan Roh Kudus, Gereja Katolik yang kudus, persekutuan para kudus, pengampunan dosa, kebangkitan badan, kehidupan kekal. Amin.';

const prayerBapaKami =
  'Bapa kami yang ada di surga, dimuliakanlah nama-Mu, datanglah kerajaan-Mu, jadilah kehendak-Mu di atas bumi seperti di dalam surga. Berilah kami rezeki pada hari ini, dan ampunilah kesalahan kami, seperti kami pun mengampuni yang bersalah kepada kami; dan janganlah masukkan kami ke dalam pencobaan, tetapi bebaskanlah kami dari yang jahat. Amin.';

const prayerSalamMaria =
  'Salam Maria, penuh rahmat, Tuhan sertamu. Terpujilah engkau di antara wanita, dan terpujilah buah tubuhmu, Yesus. Santa Maria, Bunda Allah, doakanlah kami yang berdosa ini, sekarang dan waktu kami mati. Amin.';

const prayerKemuliaan =
  'Kemuliaan kepada Bapa dan Putra dan Roh Kudus, seperti pada permulaan, sekarang, selalu, dan sepanjang segala abad. Amin.';

const prayerTerpujilah =
  'Terpujilah nama Yesus, Maria dan Yosef, sekarang dan selama-lamanya (Amin.)';

const prayerYaYesus =
  'Ya Yesus yang baik, ampunilah dosa-dosa kami. Selamatkanlah kami dari api neraka, dan hantarlah jiwa-jiwa ke surga, terutama jiwa-jiwa yang sangat membutuhkan kerahiman-Mu. Amin.';

const prayerSalamYaRatu =
  'Salam Ya Ratu, Bunda yang berbelas kasih, hidup, hiburan dan harapan kami. Kami semua memanjatkan permohonan, kami amat susah, mengeluh, mengesah dalam lembah duka ini. Ya Ibunda, ya pelindung kami, limpahkanlah kasih sayangmu kepada kami, dan Yesus, Putramu yang terpuji itu, semoga kau tunjukkan kepada kami. O Ratu, o Ibu, o Maria, Bunda Kristus. Amin.';

const prayerOremus =
  'Ya Allah, Putra-Mu telah memperoleh bagi kami ganjaran kehidupan kekal melalui hidup, wafat dan kebangkitan-Nya. Kami mohon, agar dengan merenungkan misteri Rosario Suci Santa Perawan Maria, kami dapat menghayati maknanya dan memperoleh apa yang dijanjikan. Demi Kristus, Tuhan kami. Amin.';

// ─── 15 JANJI CONTENT ───────────────────────────────────────────────────────

const janjiIntro =
  'Doa rosario, siapa orang Katolik yang tak kenal dengan doa ini? Doa powerful yang sudah beratus-ratus tahun menemani doa, silih, dan tapa orang Katolik tidak diragukan lagi kekuatan dan mujizatnya. Sudah banyak saksi yang merasakan manfaat berdoa rosario. Berikut manfaat yang kita terima dari doa rosario.';

const janjiList = [
  'Barangsiapa dengan setia menghormati-ku dengan berdoa rosario, akan menerima rahmat yang istimewa',
  'Aku berjanji akan melindungi secara khusus dan memberi rahmat yang berlimpah kepada yang berdoa rosario',
  'Rosario akan menjadi perisai yang ampuh melawan kejahatan, menghancurkan sifat-sifat yang tidak baik, mengurangi dosa, dan memberantas kesesatan iman',
  'Rosario akan memperkembangkan kebajikan dan karya-karya yang baik, akan memberikan pengampunan dari Allah kepada jiwa-jiwa, akan menghapus kecintaan manusia akan harta benda duniawi dan segala kehampaannya, dan akan mengembangkan hasrat untuk memiliki kehidupan dan hal-hal yang abadi dalam diri manusia',
  'Jiwa yang bersandar padaku dalam doa rosario tidak akan binasa',
  'Barangsiapa berdoa rosario dengan penuh kesungguhan dan kekhusukan, dengan merenungkan peristiwa-peristiwa yang suci, tidak akan ditimpa kemalangan',
  'Barangsiapa yang hidup dengan penuh kesetiaan terhadap rosario, tidak akan mati tanpa menerima sakramen-sakramen Gereja Kudus',
  'Barangsiapa yang setia dalam doa rosario, akan mendapat rahmat Allah selama hidupnya dan lebih-lebih pada saat ajalnya. Pada waktu ajal mereka akan ikut menikmati pahala para suci di surga',
  'Aku akan membebaskan mereka yang penuh kesetiaan terhadap rosario dari siksa api penyucian',
  'Mereka yang setia pada rosario, akan mendapatkan kemuliaan yang luhur di surga',
  'Kamu akan mendapatkan apa yang kamu minta dariku dengan berdoa rosario',
  'Mereka yang menganjurkan berdoa rosario, akan kubantu dalam kesulitan hidupnya',
  'Aku mendapat janji dari Puteraku bahwa para penganjur doa rosario akan mendapatkan perhatian surgawi secara khusus selama hidup dan pada saat kematiannya',
  'Semua yang berdoa rosario adalah Puteraku dan saudara-saudara Puteraku yang tunggal Yesus Kristus',
  'Devosi terhadap rosarioku adalah pertanda yang luhur bahwa yang bersangkutan akan berbahagia bersama Kristus.',
];

// ─── RAHASIA ROSARIO CONTENT ─────────────────────────────────────────────────

const sinopsisBuku =
  'Buku Rahasia Rosario ingin menjawab rasa ingin tahu umat Katolik (dan non Katolik) tentang misteri doa ini. Buku ini di tulis oleh St. Louis de Monfort, yang oleh Gereja dijuluki sebagai Pengkotbah Ulung Rosario Suci.\n\n'
  'St. Louis de Monfort kerapkali menyatakan keberhasilannya mempertobatkan orang-orang yang berdosa dikaitkan dengan Rosario. "Biarkanlah aku mengalungkan Rosarioku pada leher orang yang berdoa," katanya. "Tak pernah seorang pun yang berdoa Rosario setiap hari dibiarkan tersesat. Aku akan dengan senang hati menandatangani pernyataanku ini dengan darahku."\n\n'
  'Buku ini menjelaskan Apa itu Rosario? dan asal-usulnya. Bagaimana doa ini dikenal dalam susunan dan bentuknya yang sekarang ini kita kenal?\n\n'
  'Sesungguhnya doa rosario adalah doa kepada Tuhan Yesus, dengan meneladani intersesi (bantuan doa) Bunda Maria. Melalui Maria menuju Yesus (Per Mariam Et Jesum).\n\n'
  'Santo Louis-Marie Grignion de Montfort adalah seorang imam dan santo Katolik dari Perancis. Ia lahir pada tanggal 31 Januari 1673. Ia ditahbiskan menjadi imam pada bulan Juni 1700 dan meninggal dunia pada tanggal 28 April 1716.';

const pendahuluan =
  'BANYAK PENULIS BIOGRAFI telah menceritakan banyak hal tentang Santo Luois-Marie Grignion de Montfort dan Rosario Suci. Sekarang melalui buku "Rahasia Rosario" ini, kita dapat membaca sendiri kata Santo Montfort tentang dirinya.\n\n'
  'Berdasarkan pengalaman pribadinya, juga pengalaman-pengalaman orang lain, beliau berusaha sekuat tenaga untuk membentangkan kepada kita dengan cara yang sederhana – namun jitu – warta otentik tentang Rosario, yaitu pelajaran perihal kehidupan Kristen yang sesungguhnya.\n\n'
  'Bagi Santo Montfort, Rosario tidak hanya sebuah metode doa melainkan juga sarana yang paling berhasil guna serta senjata teramat ampuh dalam karya kerasulannya. Kiranya tepat sekali bila Gereja menjuluki beliau Pengkhotbah Ulung Rosario Suci.\n\n'
  'Kekuatan Rosario itu tak ada batasnya. Kerap kali ia menyatakan keberhasilannya dalam mempertobatkan orang-orang berdosa dikaitkan dengan Rosario.\n\n'
  'Buku Rahasia Rosario ini ditulis hampir dua setengah abad silam, namun tidak pernah luntur kesegarannya serta tidak termakan gejolak zaman. Kami yakin, buku ini akan membuat banyak orang lebih memahami Rosario, bukan saja sebagai rangkaian doa, melainkan terutama sebagai sarana peningkatan kehidupan rohani.';

const untukParaImam =
  'Wahai para imam dan pewarta injil, andaikan kalian tidak memiliki bakat untuk berkhotbah, ambillah Rosario setelah meditasi tentang misteri-misterinya dan wartakanlah. Rosario adalah kotbah yang tidak pernah basi.\n\n'
  'Santo Dominikus tidak pernah berkhotbah tanpa terlebih dahulu berdoa Rosario. Ia juga mengajarkan Rosario kepada umat sebelum menyampaikan khotbahnya, dan dengan cara demikian ia berhasil mempertobatkan banyak jiwa.\n\n'
  'Janganlah kalian merasa cukup dengan mengajarkan orang-orang berdoa Rosario hanya sekali saja. Jadikanlah Rosario sebagai devosi yang tetap dan terus-menerus bagi mereka.';

const untukOrangBerdosa =
  'Wahai orang-orang berdosa, ambillah Rosario-mu dan bertobatlah. Bunda Maria menjanjikan pertolongannya kepada semua orang yang setia berdoa Rosario.\n\n'
  'Sungguh banyak orang berdosa yang telah bertobat melalui perantaraan doa Rosario. Rosario adalah tali yang mengikat orang berdosa kepada Allah.\n\n'
  '"Biarkanlah aku mengalungkan Rosarioku pada leher seorang berdosa," kata Santo Montfort, "dan ia tidak akan pernah melepaskan dirinya lagi dari padanya." Ini bukan hanya kiasan, melainkan kenyataan yang telah terbukti berkali-kali.';

const untukOrangSaleh =
  'Wahai jiwa-jiwa yang saleh, kalian yang sudah bertobat dan sedang berusaha maju dalam jalan kesempurnaan, ambillah Rosario sebagai senjatamu yang paling ampuh.\n\n'
  'Rosario adalah doa yang luar biasa. Rosario merangkum seluruh Injil. Rosario mengandung rahasia-rahasia terdalam dari hidup, sengsara, wafat dan kebangkitan Yesus.\n\n'
  'Dengan merenungkan misteri-misteri Rosario setiap hari, kalian akan semakin mengenal dan mencintai Yesus dan Maria. Kalian akan bertumbuh dalam kebajikan dan kekudusan.';

const untukAnakAnak =
  'Wahai anak-anak yang terkasih, belajarlah berdoa Rosario sejak kecil. Rosario adalah doa yang indah dan mudah.\n\n'
  'Bunda Maria sangat mencintai anak-anak yang berdoa Rosario. Ia akan selalu melindungi dan menjaga kalian.\n\n'
  'Bawalah selalu Rosario-mu. Ketika kalian takut atau sedih, peganglah Rosario-mu dan berdoalah. Bunda Maria akan segera datang membantumu.';

const selengkapnya =
  'Untuk membaca selengkapnya Buku Rahasia Rosario karya Santo Louis de Montfort, silakan kunjungi perpustakaan Katolik terdekat atau cari di toko buku rohani.\n\n'
  'Buku ini tersedia dalam versi Bahasa Indonesia dan dapat diperoleh di toko buku Obor atau toko buku Katolik lainnya.\n\n'
  'Santo Louis-Marie Grignion de Montfort (1673-1716) adalah salah satu orang kudus yang paling gigih mempromosikan devosi Rosario. Ia dijuluki "Pengkhotbah Ulung Rosario Suci" oleh Gereja Katolik.';

// ─── DOA LAINNYA CONTENT ─────────────────────────────────────────────────────

const meditasiDoaYesus =
  'Doa Yesus atau Doa Nama Yesus adalah doa singkat yang diulang-ulang:\n\n'
  '"Tuhan Yesus Kristus, Putra Allah, kasihanilah aku, orang yang berdosa ini."\n\n'
  'Doa ini berasal dari tradisi Kristen Timur (Hesychasme) dan telah dipraktikkan oleh para biarawan dan mistikus selama berabad-abad.\n\n'
  'Cara bermeditasi:\n'
  '1. Temukan tempat yang tenang\n'
  '2. Duduk dengan nyaman\n'
  '3. Tutup mata dan bernafas dengan teratur\n'
  '4. Ucapkan dalam hati: "Tuhan Yesus Kristus, Putra Allah, kasihanilah aku"\n'
  '5. Ulangi selama 10-20 menit\n\n'
  'Dengan doa ini, nama Yesus meresap ke dalam seluruh keberadaan kita dan menjadi nafas rohani kita.';

const rosarioPembebasan =
  'Doa Rosario Pembebasan didoakan untuk memohon pembebasan dari kuasa kejahatan dan penyembuhan rohani.\n\n'
  'Dimulai dengan:\n'
  '"Ya Bapa yang Mahakuasa, dalam nama Yesus Kristus dan oleh kuasa darah-Nya yang kudus, kami memohon pembebasan dari segala kuasa kegelapan."\n\n'
  'Dilanjutkan dengan doa Rosario biasa sambil memohon:\n'
  '- Pembebasan dari dosa dan kuasa iblis\n'
  '- Penyembuhan luka batin\n'
  '- Pemulihan hubungan yang rusak\n'
  '- Perlindungan bagi keluarga\n\n'
  'Ditutup dengan:\n'
  '"Ya Maria, Ratu alam semesta, tutupilah kami dengan jubah pelindungmu dan jauhkan kami dari segala kejahatan. Amin."';

const bundaPenolongAbadi =
  'Devosi kepada Bunda Maria Penolong Abadi\n\n'
  'Doa kepada Bunda Maria Penolong Abadi:\n\n'
  'Ya Bunda Maria Penolong Abadi yang ajaib, lihatlah aku yang berlutut di hadapanmu, datang memohon pertolonganmu. Aku mempercayakan diriku ke dalam perlindunganmu.\n\n'
  'Ya Bunda yang penuh kasih, tuntunlah langkahku menuju putramu Yesus. Semoga dalam setiap kesulitan yang kuhadapi, engkau selalu menjadi penolong dan pelindungku.\n\n'
  'Doakanlah aku kepada Yesus, putramu, agar aku selalu hidup dalam kasih dan rahmat-Nya. Amin.\n\n'
  'Novena 9 hari kepada Bunda Penolong Abadi:\n'
  'Ulangi doa di atas selama 9 hari berturut-turut dengan penuh kepercayaan.';

const doaNovena =
  'Novena adalah doa yang dipanjatkan selama 9 hari berturut-turut.\n\n'
  'Doa Novena kepada Roh Kudus:\n\n'
  'Ya Roh Kudus, datanglah dan penuhilah hatiku dengan kasih-Mu. Terangilah pikiranku, perkuatlah kehendakku, dan sucikanlah seluruh hidupku.\n\n'
  'Hari 1-3: Mohon terang Roh Kudus\n'
  '"Ya Roh Kudus, berilah aku kebijaksanaan untuk mengenal kehendak Allah."\n\n'
  'Hari 4-6: Mohon kekuatan Roh Kudus\n'
  '"Ya Roh Kudus, perkuatkanlah aku untuk melaksanakan kehendak Allah."\n\n'
  'Hari 7-9: Mohon api kasih Roh Kudus\n'
  '"Ya Roh Kudus, nyalakanlah dalam hatiku api kasih yang membara kepada Allah dan sesama."\n\n'
  'Ditutup setiap hari dengan:\n'
  '"Datanglah ya Roh Kudus, penuhilah hati umat-Mu dan nyalakanlah dalam diri mereka api kasih-Mu. Utuslah Roh-Mu dan mereka akan dicipta kembali, dan Engkau akan memperbarui muka bumi. Amin."';

const reginaCaeli =
  'DOA REGINA CAELI\n(Didoakan pada masa Paska, menggantikan Angelus)\n\n'
  'Bersukacitalah, ya Ratu Surga, alleluia;\n'
  'Sebab Ia yang patut kau kandung, alleluia;\n'
  'Telah bangkit seperti yang dijanjikan-Nya, alleluia;\n'
  'Doakanlah kami kepada Allah, alleluia.\n\n'
  'Bersukacitalah dan bergembiralah, ya Perawan Maria, alleluia.\n'
  'Karena Tuhan sungguh-sungguh telah bangkit, alleluia.\n\n'
  'Ya Allah, yang berkenan menggembirakan dunia melalui kebangkitan Putra-Mu, Tuhan kami Yesus Kristus; semoga kami, melalui perantaraan Perawan Maria, ibunda-Nya, memperoleh kegembiraan hidup yang kekal. Demi Kristus Tuhan kami. Amin.\n\n'
  '─────────────────\n\n'
  'DOA ANGELUS\n(Didoakan di luar masa Paska)\n\n'
  'P: Malaikat Tuhan menyampaikan kabar kepada Maria.\n'
  'U: Dan ia mengandung dari Roh Kudus.\n'
  'Salam Maria...\n\n'
  'P: Sesungguhnya akulah hamba Tuhan.\n'
  'U: Jadilah padaku menurut perkataanmu.\n'
  'Salam Maria...\n\n'
  'P: Dan Sabda telah menjadi daging.\n'
  'U: Dan tinggal di antara kita.\n'
  'Salam Maria...\n\n'
  'P: Doakanlah kami, ya Santa Bunda Allah.\n'
  'U: Supaya kami layak menerima janji Kristus.\n\n'
  'Marilah berdoa: Ya Allah, setelah Engkau menyatakan penjelmaan Putra-Mu kepada kami melalui kabar malaikat, kami mohon, curahkanlah rahmat-Mu ke dalam hati kami, supaya melalui sengsara dan salib-Nya, kami dibawa kepada kebangkitan yang mulia. Demi Kristus Tuhan kami. Amin.';

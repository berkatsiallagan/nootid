# **DAFTAR ISI** 

|**DAFTAR ISI.............................................................................................................................. i**|
|---|
|**DAFTAR TABEL...................................................................................................................ii**|
|**BAB 1 PENDAHULUAN.........................................................................................................1**|
|1.1 Identifikasi Masalah dan Sumber Inspirasi.................................................................... 1|
|1.2 Keterbaruan dan Solusi yang Ditawarkan......................................................................1|
|1.3 Fase Final dan Target Fungsional...................................................................................2|
|1.4 Luaran yang Ditargetkan dan Prediksi Manfaat.............................................................2|
|**BAB 2 TINJAUAN PUSTAKA............................................................................................... 3**|
|2.1 Perilaku Digital Hoarding dan Retensi Informasi Media Sosial....................................3|
|2.2 Integrasi Ekstraksi Konten dan Large Language Model (LLM)....................................3|
|2.3 Konsep Gamifikasi Melalui Maskot Virtual (Tamagotchi Effect)................................. 4|
|2.4 Perbandingan Produk Sejenis (State of the Art).............................................................5|
|**BAB 3 TAHAP PELAKSANAAN...........................................................................................6**|
|3.1 Pengumpulan Data Sekunder dan Analisis Kebutuhan..................................................6|
|3.2 Perancangan Desain Teknis dan Antarmuka..................................................................6|
|3.3 Tahap Pembuatan dan Pengembangan Platform............................................................ 6|
|3.4 Pengujian Keandalan Sistem..........................................................................................7|
|3.5 Evaluasi dan Prediksi Penerimaan Pengguna.................................................................7|
|**BAB 4 BIAYA DAN JADWAL KEGIATAN..........................................................................8**|
|4.1 Anggaran Biaya..............................................................................................................8|
|4.2 Jadwal Kegiatan............................................................................................................. 9|
|**DAFTAR PUSTAKA..............................................................................................................10**|
|**LAMPIRAN............................................................................................................................ 11**|
|Lampiran 1. Biodata Ketua dan Anggota, serta Dosen Pendamping................................. 11|
|Biodata Ketua...............................................................................................................11|
|Biodata Anggota 1........................................................................................................12|
|Biodata Anggota 2........................................................................................................13|
|Biodata Anggota 3........................................................................................................14|
|Biodata Anggota 4........................................................................................................15|
|Biodata Dosen Pendamping......................................................................................... 16|
|Lampiran 2. Justifikasi Anggaran Kegiatan.......................................................................17|
|Lampiran 3. Susunan Tim Pengusul dan Pembagian Tugas.............................................. 19|
|Lampiran 4. Surat Pernyataan Ketua Tim Pengusul.......................................................... 21|
|Lampiran 5. Gambaran Teknologi yang akan Dikembangkan...........................................22|
|Lampiran 6. Hasil Uji Periksa Similaritas Proposal...........................................................23|



i 

# **DAFTAR TABEL** 

|Tabel 2.1 Perbandingan Produk Sejenis.....................................................................................5|
|---|
|Tabel 4.1 Rekapitulasi Rencana Anggaran Biaya...................................................................... 8|
|Tabel 4.2 Jadwal Kegiatan Pelaksanaan Program......................................................................9|



ii 

1 

# **BAB 1** 

# **PENDAHULUAN** 

# **1.1 Identifikasi Masalah dan Sumber Inspirasi** 

Perkembangan media sosial menggeser konsumsi informasi masyarakat, khususnya generasi muda dan mahasiswa. Program ini mendukung Tema ke-6 Kemdiktisaintek tahun 2026, yaitu Penguatan Pendidikan, Sains, dan Teknologi. Platform seperti Instagram, TikTok, YouTube Shorts, dan X melimpah dengan konten mikroedukatif ringkas. Namun, maraknya konten ini memunculkan fenomena _digital hoarding_ , yaitu kebiasaan menimbun video atau unggahan melalui fitur penanda bawaan ( _bookmark/saved_ ) atau aplikasi catatan tanpa pernah membukanya kembali. 

Kondisi ini menimbulkan tiga masalah utama: fragmentasi informasi ( _fragmentation silo_ ) akibat sistem penyimpanan platform yang terisolasi, akumulasi tautan tanpa struktur yang menjadi "pemakaman tautan" ( _link cemetery_ ), serta keterbatasan pencarian internal media sosial yang mempersulit penelusuran kembali materi spesifik. Hal ini menghambat konversi konten edukatif menjadi pengetahuan produktif harian. 

# **1.2 Keterbaruan dan Solusi yang Ditawarkan** 

Solusi yang diusulkan adalah platform edutech **nootid** ( _"Found It, Noted It"_ ) sebagai hub pengetahuan terintegrasi dan sistem ingatan sekunder ( _Second Brain_ ). Platform ini memadukan pengumpul penyimpanan lintas platform ( _unified storage aggregator_ ), pemrosesan konten cerdas berbasis kecerdasan buatan (AI), serta psikologi gamifikasi. 

Keterbaruan platform ini terletak pada penyerapan informasi tanpa hambatan ( _zero-friction ingestion_ ) via _Native Share Sheet_ ponsel. Pengguna dapat langsung mengirimkan tautan dari media sosial tanpa salin-tempel manual. Selanjutnya, arsitektur AI menggabungkan OpenAI Whisper Large-v3 (Speech-to-Text) dan Google Gemini 1.5 Flash (NLP) untuk mengekstraksi transkrip audio serta merangkum 3-5 poin intisari ( _AI takeaway summary_ ) beserta kategorisasinya secara otomatis. 

Guna menjaga motivasi belajar harian, pencatatan dikemas melalui mekanisme hewan peliharaan virtual ( _Virtual Pet_ ) kapibara bernama **Nootti** . Setiap tautan edukatif yang disimpan berfungsi sebagai "asupan nutrisi" maskot, dengan ekspresi emosional yang bereaksi terhadap konsistensi belajar pengguna (Ryan dan Deci, 2000). Selain itu, fitur rekapitulasi waktu belajar bulanan ( _Knowledge Screen Time_ ) berformat visual ala _Spotify Wrapped_ dapat dibagikan ke jejaring sosial untuk mendorong budaya pemanfaatan media sosial yang terstruktur. 

2 

# **1.3 Fase Final dan Target Fungsional** 

Fase final program ini adalah terwujudnya prototipe aplikasi seluler fungsional berbasis Flutter ( _Android-First, iOS Ready_ ) yang mengintegrasikan seluruh komponen teknis utama dan siap diuji coba. 

Adapun target fungsionalitas utama yang harus dipenuhi oleh platform ini mencakup: 

- a) Integrasi sistem penyimpan tautan universal dari media sosial utama (Instagram, TikTok, YouTube, X) menggunakan mekanisme _native share sheet_ ; 

- b) Modul pemrosesan AI otomatis untuk pembuatan transkripsi audio, ringkasan poin kunci ( _takeaway summary_ ), dan pelabelan kategori secara akurat; 

- c) Sistem antarmuka berbasis animasi maskot virtual ( _Nootti the Capybara_ ) yang responsif terhadap input data dan status aktivitas pengguna; 

- d) Fitur pencarian pintar berbasis kata kunci dan rangkuman, serta generator kartu rekapitulasi data belajar bulanan ( _Monthly Recap / Knowledge Screen Time_ ) yang siap dibagikan. 

# **1.4 Luaran yang Ditargetkan dan Prediksi Manfaat** 

Luaran wajib dan tambahan yang ditargetkan dari pelaksanaan program ini meliputi: 

- a) Laporan Kemajuan dan Laporan Akhir pelaksanaan program sesuai pedoman PKM-KC; 

- b) Prototipe aplikasi seluler **nootid** teruji yang fungsional dan siap dioperasikan; 

- c) Akun media sosial resmi proyek yang aktif mempublikasikan edukasi produk, perkembangan pengembangan, dan konten promosi; serta 

- d) Draft artikel ilmiah yang siap dipublikasikan pada jurnal atau prosiding seminar nasional. 

Pengembangan platform ini membantu pelajar dan mahasiswa mengubah kebiasaan konsumsi media sosial pasif menjadi pembelajaran mandiri terstruktur, sekaligus mengurangi dampak buruk _doomscrolling_ melalui retensi pengetahuan yang bermakna. 

3 

# **BAB 2** 

# **TINJAUAN PUSTAKA** 

# **2.1 Perilaku Digital Hoarding dan Retensi Informasi Media Sosial** 

Tingginya kecepatan arus informasi di media sosial memicu fenomena _digital hoarding_ , yaitu kebiasaan mengumpulkan data digital seperti tautan dan video tanpa pengelolaan terstruktur untuk digunakan kembali (Sweeten et al., 2018). 

Perilaku ini didorong oleh kecemasan kehilangan informasi (FOMO) dan ketergantungan pada fitur _bookmark_ sebagai kepuasan semu. Hambatan akumulasi pengetahuan muncul akibat tiga faktor utama: 

- a) **Fragmentasi Informasi (** **_Fragmentation Silo_ ):** Setiap platform media sosial mengisolasi data penandaan dalam ekosistem tertutupnya masing-masing, sehingga pengguna kesulitan mengonsolidasikan referensi lintas platform secara terpadu. 

- b) **Pemakaman Tautan (** **_Link Cemetery_ ):** Pengumpulan daftar tautan mentah tanpa adanya konteks atau rangkuman membuat kumpulan data tersebut kehilangan nilai guna dan terlupakan seiring berjalannya waktu. 

- c) **Rendahnya Keterlacakan (** **_Low Discoverability_ ):** Keterbatasan mesin pencari internal media sosial dalam menelusuri isi transkrip video spesifik menyulitkan proses penemuan kembali materi yang pernah disimpan. 

Sesuai teori pemrosesan informasi, pemahaman jangka panjang membutuhkan sintesis aktif. Oleh karena itu, diperlukan sistem ingatan sekunder ( _Second Brain_ ) yang memangkas gesekan penyimpanan ( _zero-friction ingestion_ ) dan mentransformasi tautan mentah menjadi intisari terstruktur. 

# **2.2 Integrasi Ekstraksi Konten dan Large Language Model (LLM)** 

Kemajuan Natural Language Processing (NLP) dan Automatic Speech Recognition (ASR) memungkinkan otomatisasi ekstraksi pengetahuan dari video edukasi melalui trek audio percakapan. 

Arsitektur model **OpenAI Whisper Large-v3** dimanfaatkan untuk mengonversi gelombang suara dari video media sosial menjadi transkripsi teks secara tepat. Whisper dirancang dengan pelatihan data audio berskala besar berstruktur multi-bahasa, sehingga memiliki ketahanan yang tinggi terhadap variasi aksen, istilah teknis, maupun gangguan latar belakang suara. 

4 

Transkrip audio dari OpenAI Whisper v3 selanjutnya diproses oleh **Google Gemini 1.5 Flash** yang efisien dan berlatensi rendah untuk dua tugas inti: 

- a) **Sintesis Intisari (** **_AI Takeaway Summary_ ):** Menganalisis transkrip panjang dan mengekstraksi 3–5 poin aksi atau konsep inti agar pengguna dapat menyerap esensi informasi dalam hitungan detik tanpa harus menonton ulang keseluruhan video. 

- b) **Klasifikasi dan Pelabelan Otomatis (** **_Smart Tagging_ ):** Mengategorikan materi ke dalam topik-topik spesifik seperti pemrograman, pemasaran digital, pengembangan diri, atau keuangan secara otomatis. Hal ini menata indeks pengetahuan agar mendukung fitur pencarian cerdas berbasis konsep. 

Integrasi fitur berbagi bawaan ( _Native Share Sheet_ ) dengan alur AI memungkinkan pengiriman tautan secara instan tanpa salin-tempel manual. 

# **2.3 Konsep Gamifikasi Melalui Maskot Virtual (Tamagotchi Effect)** 

Gamifikasi menerapkan elemen permainan untuk meningkatkan keterlibatan pengguna dan mengatasi rendahnya retensi penggunaan jangka panjang pada aplikasi edukasi. 

Pendekatan yang digunakan adalah keterikatan emosional karakter virtual ( _Tamagotchi Effect_ ), tempat pengguna mengembangkan empati dan tanggung jawab terhadap entitas digital yang dirawat (Deterding et al., 2011; Ryan dan Deci, 2000). 

Aplikasi **nootid** menerapkan mekanisme _"Feed the Mascot"_ dengan maskot kapibara bernama **Nootti** sebagai simbol pembelajaran tenang ( _mindful learning_ ). Setiap tautan edukatif yang disimpan dianggap sebagai asupan nutrisi maskot. 

Status dan ekspresi emosional maskot berfungsi langsung sebagai antarmuka indikator aktivitas belajar pengguna: 

- a) **Kondisi Lapar/Lemas:** Muncul ketika pengguna tidak menyimpan atau meninjau materi ilmu baru dalam jangka waktu tertentu (misalnya satu minggu). 

- b) **Kondisi Senang/Ceria:** Terpemicu saat pengguna aktif memasukkan dan mempelajari tautan konten baru. 

- c) **Peningkatan Tingkat (** **_Level Up / Glow Up_ ):** Dicapai ketika pengguna konsisten menjaga kesinambungan belajar ( _streak_ ) serta mengoleksi variasi kategori pengetahuan. 

Kartu rekapitulasi belajar bulanan ( _Knowledge Screen Time_ ) berformat 9:16 ala _Spotify Wrapped_ turut memperkuat dorongan pengakuan sosial ( _social proof_ ) serta memicu pertumbuhan pengguna secara organik. 

5 

# **2.4 Perbandingan Produk Sejenis (State of the Art)** 

Evaluasi komparatif dilakukan terhadap alat pencatatan umum (Apple Notes, Google Keep), Notion, bookmark bawaan media sosial, dan Pocket berdasar lima kriteria fungsional utama yang disajikan pada Tabel 2.1. 

Tabel 2.1 Perbandingan Produk Sejenis 

|**Fitur**|**Bookmark**<br>**Media**<br>**Sosial**|**Catatan**<br>**Bawaan**|**Notion**|**Pocket**|**Nootid**|
|---|---|---|---|---|---|
|**Hub Lintas**<br>**Platform**|Tidak<br>(Terisolasi/<br>Silo)|Manual<br>(Salin link)|Ya (Perlu<br>susun<br>database)|Terbatas (Fokus<br>berbasis artikel<br>teks)|Ya<br>(Universal<br>Unified<br>Inbox)|
|**Otomatisasi**<br>**AI**<br>**(Rangkuman**<br>**& ASR)**|Tidak Ada|Tidak Ada /<br>Terbatas|Parsial (Perlu<br>prompt<br>Notion AI)|Terbatas<br>(Text-to-speech<br>/ AI summary<br>artikel)|Otomatis<br>(Whisper<br>v3 +<br>Gemini<br>Flash)|
|**Mitigasi**<br>**Digital**<br>**Hoarding**|Sangat<br>Rendah<br>(Menjadi<br>penimbun<br>link)|Rendah<br>("Kuburan<br>Link")|Sedang<br>(Bergantung<br>kedisiplinan<br>user)|Rendah (Daftar<br>bacaan<br>terbengkalai)|Tinggi<br>(Sintesis<br>langsung &<br>aksi)|
|**Gamifikasi**<br>**& Maskot**|Tidak Ada|Tidak Ada|Tidak Ada|Tidak Ada|Ya (Nootti<br>the<br>Capybara<br>& Rekap<br>Wrapped)|
|**Mekanisme**<br>**Input**|Klik tombol<br>simpan<br>internal|Copy-paste<br>manual|Share<br>extension /<br>Web clipper|Share extension|Native<br>Share Sheet<br>(Zero-Fricti<br>on)|



Keunggulan utama nootid terletak pada integrasi efisiensi AI dan interaksi gamifikasi maskot, yang mengubah konsumsi informasi pasif menjadi kebiasaan belajar terstruktur dan berkelanjutan. 

6 

# **BAB 3** 

# **TAHAP PELAKSANAAN** 

# **3.1 Pengumpulan Data Sekunder dan Analisis Kebutuhan** 

a) Tahap awal dimulai dengan studi literatur terkait fenomena digital hoarding, gamifikasi hewan peliharaan virtual (Tamagotchi Effect), performa OpenAI Whisper Large-v3, latensi Google Gemini 1.5 Flash, serta kerangka kerja Flutter. 

Sintesis data menghasilkan analisis kebutuhan sistem sebagai berikut: 

- b) **Kebutuhan Fungsional:** Penangkapan tautan via Native Share Sheet, pipeline AI otomatis (Whisper v3 dan Gemini 1.5 Flash) untuk transkripsi dan 3-5 poin ringkasan, antarmuka maskot Nootti yang bereaksi terhadap input data, serta pencarian cerdas dan generator rekap bulanan. 

- c) **Kebutuhan Non-Fungsional:** Pemrosesan AI di bawah 15 detik pada kondisi stabil, dukungan Android 8.0+ (iOS Ready), serta penyimpanan catatan harian terenkripsi secara lokal. 

# **3.2 Perancangan Desain Teknis dan Antarmuka** 

Arsitektur perangkat lunak disusun menggunakan Clean Architecture berbasis modul (Data, Domain, Presentation). Pemrosesan AI berlangsung secara asinkron bertahap meliputi penerimaan tautan via _receive_sharing_intent_ , ekstraksi audio dan transkripsi ASR Whisper v3, serta sintesis NLP Gemini 1.5 Flash. 

Antarmuka mengusung prinsip Zen & Mindful Design yang dirancang di Figma. Animasi maskot Nootti dikembangkan dengan Rive untuk menampilkan transisi status emosi secara halus. 

# **3.3 Tahap Pembuatan dan Pengembangan Platform** 

Pengembangan aplikasi seluler dilakukan dengan Flutter/Dart dan flutter_riverpod untuk manajemen status. Fitur Native Share Sheet diintegrasikan menggunakan modul receive_sharing_intent pada level kode Android (Kotlin) dan iOS (Swift) agar dapat mendeteksi lalu lintas tautan masukan dari aplikasi pihak ketiga secara konsisten. Untuk penyimpanan data lokal dan mekanisme tembolok cepat, digunakan kombinasi Hive dan shared_preferences, sehingga data rangkuman yang telah diproses tetap dapat diakses oleh pengguna dalam mode luring (offline access). 

Modul gamifikasi menghubungkan mesin Rive dengan status aktivitas pengguna untuk memicu sekuens "Feeding Nootti" beserta efek suara dan getaran haptic. Modul generator rekap bulanan menggunakan Canvas rendering untuk menghasilkan gambar visual 9:16. 

7 

# **3.4 Pengujian Keandalan Sistem** 

- a) Pengujian keandalan sistem meliputi Pengujian Unit (logika internal), Pengujian Integrasi (aluran data Native Share Sheet ke API AI dan basis data lokal), Pengujian Black-Box & Performa (kecepatan AI, konsumsi RAM, dan baterai), serta Pengujian Akurasi ASR dan LLM (Word Error Rate dan relevansi ringkasan). 

# **3.5 Evaluasi dan Prediksi Penerimaan Pengguna** 

- a) Evaluasi penerimaan pengguna dilakukan melalui uji coba terbatas (alpha/beta testing) pada mahasiswa menggunakan metode System Usability Scale (SUS) dengan target skor minimal 80 (Brooke, 1996) dan Technology Acceptance Model (TAM) untuk memprediksi tingkat adopsi harian. 

Hasil evaluasi digunakan sebagai rujukan penyempurnaan prototipe sebelum publikasi di Google Play Store dan penyusunan Laporan Akhir PKM-KC 2026. 

8 

# **BAB 4** 

# **BIAYA DAN JADWAL KEGIATAN** 

# **4.1 Anggaran Biaya** 

Anggaran biaya disusun efisien dan akuntabel sesuai pedoman PKM-KC 2026, yang merangkum pendanaan Belmawa serta dana pendamping Perguruan Tinggi pada Tabel 4.1. 

Tabel 4.1 Rekapitulasi Rencana Anggaran Biaya 

|**No**|**Jenis Pengeluaran**|**Sumber Dana**|**Besaran Dana (Rp)**|
|---|---|---|---|
|1|Bahan habis pakai (ATK, kertas,<br>lisensi API pemrosesan AI, aset<br>digital)|Belmawa<br>Perguruan Tinggi<br>Instansi Lain|4.700.000<br>1.000.000<br>0|
|2|Sewa dan jasa (Lisensi Google<br>Play Console, Domain & Hosting<br>6 bulan)|Belmawa<br>Perguruan Tinggi<br>Instansi Lain|1.020.000<br>400.000<br>0|
|3|Transportasi lokal (Koordinasi tim,<br>pengujian lapangan, dan<br>konsultasi)|Belmawa<br>Perguruan Tinggi<br>Instansi Lain|1.200.000<br>300.000<br>0|
|4|Lain-lain (Ads media sosial,<br>komunikasi, pendaftaran HKI)|Belmawa<br>Perguruan Tinggi<br>Instansi Lain|580.000<br>300.000<br>0|
||**Jumlah**||**9.500.000**|
||**Rekap Sumber Dana**|Belmawa<br>Perguruan Tinggi<br>Instansi Lain|7.500.000<br>2.000.000<br>0|
||**Jumlah Total**||**9.500.000**|



9 

# **4.2 Jadwal Kegiatan** 

Pelaksanaan program direncanakan berlangsung selama 4 bulan. Rincian jadwal dan penanggung jawab disajikan pada Tabel 4.2. 

Tabel 4.2 Jadwal Kegiatan Pelaksanaan Program 

|**No**|**Jenis Kegiatan**|**1**|**2**|**3**|**4**|**Penanggung Jawab**|
|---|---|---|---|---|---|---|
|1|Pengumpulan data sekunder dan<br>analisis kebutuhan sistem|||||Ketua Tim|
|2|Perancangan arsitektur sistem,<br>UI/UX, dan alur pipeline AI|||||Anggota 1|
|3|Pengembangan aplikasi Flutter dan<br>integrasi Native Share Sheet|||||Anggota 2|
|4|Integrasi API AI (Whisper v3 dan<br>Gemini Flash) serta gamifikasi|||||Anggota 3|
|5|Pengujian sistem, uji akurasi<br>ASR/LLM, dan perbaikan bug|||||Anggota 4|
|6|Evaluasi penerimaan pengguna<br>(SUS & TAM) dan publikasi<br>medsos|||||Ketua Tim|
|7|Penyusunan Laporan Kemajuan,<br>Laporan Akhir, dan Artikel Ilmiah|||||Seluruh Tim|



10 

# **DAFTAR PUSTAKA** 

- Brooke, J. (1996) 'SUS: A quick and dirty usability scale', _Usability Evaluation in Industry_ , 189(194), hlm. 4-7. 

- Deterding, S., Dixon, D., Khaled, R. and Nacke, L. (2011) 'From game design elements to gamefulness: defining gamification', _Proceedings of the 15th International Academic MindTrek Conference_ . Tampere, Finland, 28-30 September. New York: ACM, hlm. 9-15. 

- Google DeepMind (2024) _Gemini 1.5: Unlocking multimodal understanding across millions of tokens of context_ . Tersedia di: https://deepmind.google/technologies/gemini/ (Diakses 10 Februari 2026). 

- Radford, A., Kim, J.W., Xu, T., Brockman, G., McLeavey, C. and Sutskever, I. (2023) 'Robust speech recognition via large-scale weak supervision', _Proceedings of the 40th ICML_ . Honolulu, Hawaii, 23-29 Juli. PMLR, hlm. 28492-28518. 

- Ryan, R.M. and Deci, E.L. (2000) 'Self-determination theory and the facilitation of intrinsic motivation, social development, and well-being', _American Psychologist_ , 55(1), hlm. 68–78. 

- Sweeten, G., Sillence, E. and Neave, N. (2018) 'Digital hoarding behaviours: underlying motivations and everyday consequences', _Computers in Human Behavior_ , 85, hlm. 54–60. 

11 

# **LAMPIRAN** 

# **Lampiran 1. Biodata Ketua dan Anggota, serta Dosen Pendamping** 

# **Biodata Ketua** 

12 

**Biodata Anggota 1** 

13 

**Biodata Anggota 2** 

14 

**Biodata Anggota 3** 

15 

**Biodata Anggota 4** 

16 

**Biodata Dosen Pendamping** 

17 

# **Lampiran 2. Justifikasi Anggaran Kegiatan** 

|**No**|**Jenis Pengeluaran**|**Volume**|**Harga**<br>**Satuan (Rp)**|**Total (Rp)**|
|---|---|---|---|---|
|**1**|**Belanja Bahan (maks. 60%)**||||
||Lisensi API OpenAI Whisper v3<br>(STT)|4 bulan|562.500|2.250.000|
||Lisensi API Google Gemini 1.5<br>Flash (LLM)|4 bulan|562.500|2.250.000|
||Aset Digital UI/UX dan Lisensi<br>Maskot Rive|1 paket|700.000|700.000|
||ATK dan Kertas A4 (2 rim)|1 paket|500.000|500.000|
||**SUB TOTAL**|||**5.700.000**|
|**2**|**Belanja Sewa (maks. 15%)**||||
||Pendaftaran Akun Google Play<br>Console Developer|1 akun|420.000|420.000|
||Sewa Domain nootid.app dan<br>Hosting Server Uji|1 paket<br>(durasi 6<br>bulan)|1.000.000|1.000.000|
||**SUB TOTAL**|||**1.420.000**|
|**3**|**Perjalanan (maks. 30%)**||||
||Transportasi lokal koordinasi tim<br>dan pengujian lapangan|5 orang x<br>1<br>kegiatan|300.000|1.500.000|
||**SUB TOTAL**|||**1.500.000**|
|**4**|**Lain-lain (maks. 15%)**||||



18 

|**No**|**Jenis Pengeluaran**|**Volume**|**Harga**<br>**Satuan (Rp)**|**Total (Rp)**|
|---|---|---|---|---|
||Iklan berbayar (Ads) media sosial<br>(IG/TikTok)|1 paket|500.000|500.000|
||Biaya pendaftaran Hak Cipta<br>(HKI) DJKI|1 karya|350.000|350.000|
||Biaya komunikasi/materai|1 paket|30.000|30.000|
||**SUB TOTAL**|||**880.000**|
||**GRAND TOTAL**|||**9.500.000**|
||**GRAND TOTAL (Terbilang)**|**Sembilan j**|**uta lima ratus rib**|**u rupiah**|



19 

# **Lampiran 3. Susunan Tim Pengusul dan Pembagian Tugas** 

|**No**|**Nama / NIM**|**Program**<br>**Studi**|**Bidang**<br>**Ilmu**|**Alokasi**<br>**Waktu**<br>**(jam/minggu)**|**Uraian Tugas**|
|---|---|---|---|---|---|
|1|Berkat Tua<br>Siallagan /<br>4312201001|Teknologi<br>Rekayasa<br>Perangkat<br>Lunak|Teknologi<br>Rekayasa<br>Perangkat<br>Lunak|14|Koordinasi<br>keseluruhan proyek,<br>pengumpulan data<br>sekunder, analisis<br>kebutuhan sistem,<br>evaluasi penerimaan<br>pengguna (SUS dan<br>TAM), serta<br>penyusunan laporan.|
|2|Anggota Tim 1 /<br>4312201002|Teknologi<br>Rekayasa<br>Perangkat<br>Lunak|Teknologi<br>Rekayasa<br>Perangkat<br>Lunak|12|Perancangan<br>arsitektur sistem<br>Clean Architecture,<br>desain UI/UX di<br>Figma, serta<br>perancangan alur<br>pipeline AI.|
|3|Anggota Tim 2 /<br>4312201003|Teknologi<br>Rekayasa<br>Perangkat<br>Lunak|Teknologi<br>Rekayasa<br>Perangkat<br>Lunak|12|Pengembangan<br>aplikasi seluler<br>menggunakan Flutter,<br>integrasi modul<br>Native Share Sheet<br>(receive_sharing_inte<br>nt), serta manajemen<br>basis data lokal<br>(Hive).|
|4|Anggota Tim 3 /<br>4312201004|Teknologi<br>Rekayasa<br>Perangkat<br>Lunak|Teknologi<br>Rekayasa<br>Perangkat<br>Lunak|12|Integrasi API<br>OpenAI Whisper v3<br>(STT) dan Google<br>Gemini 1.5 Flash<br>(LLM),<br>pengembangan<br>sistem gamifikasi<br>maskot Nootti, serta<br>rendering kartu<br>rekapitulasi bulanan.|



20 

|**No**|**Nama / NIM**|**Program**<br>**Studi**|**Bidang**<br>**Ilmu**|**Alokasi**<br>**Waktu**<br>**(jam/minggu)**|**Uraian Tugas**|
|---|---|---|---|---|---|
|5|Anggota Tim 4 /<br>4312201005|Teknik<br>Komputer|Pengujian<br>& Kualitas<br>Sistem|12|Pengujian unit,<br>integrasi, black box,<br>performa latensi,<br>serta evaluasi akurasi<br>transkripsi dan<br>ringkasan AI.|



21 

# **Lampiran 4. Surat Pernyataan Ketua Tim Pengusul** 

22 

# **Lampiran 5. Gambaran Teknologi yang akan Dikembangkan** 

Pengembangan platform edutech **nootid** dirancang sebagai sistem ingatan sekunder ( _Second Brain_ ) terintegrasi berbasis aplikasi seluler (Flutter) yang mentransformasi konten edukasi mikro dari media sosial menjadi pengetahuan produktif terstruktur. Arsitektur teknologi aplikasi ini berfokus pada tiga pilar utama, yaitu mekanisme penyerapan data tanpa hambatan ( _zero-friction ingestion_ ), pipa pemrosesan kecerdasan buatan (AI Pipeline) otomatis, serta sistem gamifikasi interaktif melalui maskot virtual. 

# **1. Mekanisme Ingesti Konten Universal (Native Share Sheet)** 

Guna mengatasi masalah hambatan alur kerja pencatatan manual, nootid memanfaatkan integrasi tingkat native pada sistem operasi Android dan iOS melalui pustaka _receive_sharing_intent_ . Pengguna dapat mengirimkan tautan dari aplikasi media sosial seperti Instagram, TikTok, YouTube, dan X secara langsung melalui lembar berbagi bawaan ( _Native Share Sheet_ ). Sistem latar belakang aplikasi secara otomatis mengekstraksi metadata awal, seperti judul, gambar mini ( _thumbnail_ ), nama pembuat konten, dan identitas platform asal tanpa memerlukan proses salin-tempel tautan secara manual. 

# **2. Pipa Pemrosesan Kecerdasan Buatan (Multistage AI Pipeline)** 

Setiap tautan yang diterima diproses secara asinkron melalui dua tahapan utama AI: 

- a) **Speech-to-Text (OpenAI Whisper Large-v3):** Trek audio terkompresi dari video diekstraksi dan dikirimkan ke model Whisper v3 untuk dikonversi menjadi transkrip teks mentah berskala waktu secara akurat, tahan terhadap variasi aksen maupun gangguan suara latar belakang. 

- b) **NLP & Summarization (Google Gemini 1.5 Flash):** Hasil transkrip dianalisis oleh model Gemini 1.5 Flash dengan latensi rendah untuk mengekstraksi 3 hingga 5 poin intisari tindakan ( _takeaway summary_ ) serta melakukan pengelompokan kategori topik dan pelabelan tagar otomatis. 

# **3. Antarmuka Gamifikasi dan Integrasi Mesin Animasi Rive** 

Untuk meningkatkan retensi dan konsistensi belajar, diterapkan mekanisme gamifikasi berbasis hewan peliharaan virtual ( _Tamagotchi Effect_ ) dengan maskot Kapibara bernama **Nootti** . Setiap tautan edukatif yang disimpan dipersonifikasikan sebagai asupan nutrisi bagi maskot. Integrasi mesin animasi Rive pada Flutter memungkinkan transisi status emosional maskot (keadaan lapar, makan, senang, hingga peningkatan level) ditampilkan secara halus dan responsif terhadap tingkat aktivitas belajar harian pengguna. 

23 

# **Lampiran 6. Hasil Uji Periksa Similaritas Proposal** 

Pemeriksaan tingkat kemiripan (similaritas) proposal telah dilakukan menggunakan perangkat lunak Turnitin pada bagian inti naskah, mencakup Bab 1 Pendahuluan hingga Daftar Pustaka. Berdasarkan hasil pengujian tersebut, proposal ini memperoleh indeks similaritas total sebesar 12%, yang berada jauh di bawah batas maksimal 25% sesuai dengan ketentuan dan pedoman PKM-KC 2026. Persentase kemiripan tersebut mayoritas bersumber dari penggunaan frasa templat standar pedoman serta rujukan ilmiah/kutipan pustaka umum, sehingga naskah ini dipastikan bebas dari unsur plagiarisme dan memenuhi kriteria keaslian karya. 


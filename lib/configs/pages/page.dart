import 'package:get/get.dart';
import 'package:venturo_core/configs/routes/route.dart';
import 'package:venturo_core/features/admin_beranda/view/ui/admin_beranda_screen.dart';
import 'package:venturo_core/features/admin_beranda/view/ui/preview_saldo_kas_screen.dart';
import 'package:venturo_core/features/admin_dashboard/view/ui/admin_dashboard_screen.dart';
import 'package:venturo_core/features/admin_pengumuman/view/components/edit_announcement.dart';
import 'package:venturo_core/features/beranda/models/pengumuman_model.dart';
import 'package:venturo_core/features/dashboard/bindings/dashboard_binding.dart';
import 'package:venturo_core/features/dashboard/view/ui/dashboard_screen.dart';
import 'package:venturo_core/features/forgot_pass/view/ui/forgot_pass_screen.dart';
import 'package:venturo_core/features/general/view/ui/general_screen.dart';
import 'package:venturo_core/features/laporan_keuangan%20copy/view/ui/laporan_keuangan_screen.dart';
import 'package:venturo_core/features/laporan_keuangan/view/ui/laporan_keuangan_screen.dart';
import 'package:venturo_core/features/laporan_pembayaran/view/ui/laporan_pembayaran_screen.dart';
import 'package:venturo_core/features/new_pass/view/ui/new_pass_screen.dart';
import 'package:venturo_core/features/pengumuman_banner/view/components/detail_pengumuman_card.dart';
import 'package:venturo_core/features/verif_code/view/ui/insert_code.dart';
import 'package:venturo_core/features/invitation/view/ui/invitation_screen.dart';
import 'package:venturo_core/features/sign_in/view/ui/sign_in_screen.dart';
import 'package:venturo_core/features/splash/bindings/splash_binding.dart';
import 'package:venturo_core/features/splash/view/ui/splash_screen.dart';

import '../../features/beranda/bindings/beranda_binding.dart';
import '../../features/beranda/view/ui/beranda_screen.dart';
import '../../features/beranda/view/ui/preview_saldo_kas_screen.dart';
import '../../features/data_warga/bindings/data_warga_binding.dart';
import '../../features/data_warga/view/ui/data_warga_empty_screen.dart';
import '../../features/data_warga/view/ui/data_warga_screen.dart';

import '../../features/iuran_warga/view/ui/riwayat_pembayaran_screen.dart';
import '../../features/pengumuman_banner/bindings/detail_banner_binding.dart';
import '../../features/pengumuman_banner/view/ui/detail_banner_screen.dart';
import '../../features/pengumuman_banner/view/ui/detail_pengumuman_screen.dart';
import '../../features/profile/bindings/profile_binding.dart';
import '../../features/profile/view/ui/edit_profile_screen.dart';
import '../../features/profile/view/ui/profile_screen.dart';
import '../../features/profile/view/ui/ubah_password_screen.dart';
import '../../features/rekap_tahunan/view/ui/rekap_tahunan_screen.dart';
import '../../features/tata_tertib/view/ui/tata_tertib_screen.dart';

abstract class Pages {
  static final pages = [
    GetPage(
        name: Routes.splashRoute,
        page: () => SplashScreen(),
        binding: SplashBinding()),
    GetPage(name: Routes.signInRoute, page: () => SignInScreen()),
    GetPage(name: Routes.forgotPassRoute, page: () => ForgotView()),
    GetPage(name: Routes.invitationRoute, page: () => InviteView()),
    GetPage(name: Routes.verifCodeRoute, page: () => VerifView()),
    GetPage(name: Routes.newPassRoute, page: () => NewPassView()),
    GetPage(
        name: Routes.dashboardRoute,
        page: () => DashboardScreen(),
        binding: DashboardBinding()),
    GetPage(
        name: Routes.berandaRoute,
        page: () => BerandaScreen(),
        binding: BerandaBinding()),
    GetPage(
        name: Routes.previewSaldoKas,
        page: () => const PreviewSaldoKasScreen(),
        binding: BerandaBinding()),

    // Profile
    GetPage(
        name: Routes.profileRoute,
        page: () => ProfileScreen(),
        binding: ProfileBinding()),

    // Profile Edit
    GetPage(
        name: Routes.editProfileRoute,
        page: () => const EditProfileScreen(),
        binding: ProfileBinding()),

    // Ubah Password
    GetPage(
        name: Routes.ubahPasswordRoute,
        page: () => const UbahPasswordScreen(),
        binding: ProfileBinding()),

    GetPage(
        name: Routes.dataWargaRoute,
        page: () => DataWargaScreen(),
        binding: DataWargaBinding()),

    GetPage(
        name: Routes.dataWargaEmptyRoute,
        page: () => const DataWargaEmptyScreen(),
        binding: DataWargaBinding()),

    // Banner Detail
    GetPage(
      name: Routes.detailBannerRoute,
      page: () => const DetailBannerScreen(),
      binding: DetailBannerBinding(),
    ),

    // Pengumuman Detail
    // Pengumuman Detail
    GetPage(
      name: Routes.detailPengumumanRoute,
      page: () =>
          DetailPengumumanScreen(), // Ganti myPengumuman dengan pengumuman yang ingin ditampilkan
    ),
    GetPage(
      name: Routes.riwayatPembayaranRoute,
      page: () => const RiwayatPembayaranScreen(),
    ),
    GetPage(
      name: Routes.laporanPembayaranRoute,
      page: () => LaporanPembayaranScreen(),
    ),
    GetPage(
      name: Routes.rekapTahunanRoute,
      page: () => RekapTahunanScreen(),
    ),
    GetPage(
      name: Routes.laporanKeuanganRoute,
      page: () => LaporanKeuanganScreen(),
    ),
    GetPage(
      name: Routes.adminBerandaRoute,
      page: () => AdminBerandaScreen(),
    ),
    GetPage(
      name: Routes.adminDashboardRoute,
      page: () => AdminDashboardScreen(),
    ),
    GetPage(
      name: Routes.previewSaldoKasAdminRoute,
      page: () => PreviewSaldoKasAdminScreen(),
    ),
    GetPage(
      name: Routes.laporanKeuanganAdminRoute,
      page: () => LaporanKeuanganAdminScreen(),
    ),
    GetPage(
      name: Routes.generalRoute,
      page: () => GeneralScreen(),
    ),
  ];
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_font_icons/flutter_font_icons.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:satria/app/data/locals/db.dart';
import 'package:satria/app/data/models/local_db/auth/auth_model.dart';
import 'package:satria/app/data/models/local_db/credentials/credential_model.dart';
import 'package:satria/app/data/shared/widget/custom_bottom_sheet.dart';
import 'package:satria/app/data/shared/widget/custom_text_field.dart';
import 'package:satria/app/data/shared/widget/sheet_label_field.dart';
import 'package:satria/app/data/utils/toast_function.dart';
import 'package:satria/app/modules/home/components/add_credential_form.dart';
import 'package:satria/app/modules/home/cubit/home_cubit.dart';
import 'package:satria/app/modules/initial/cubit/initial_cubit.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late ScrollController scrollController;

  @override
  void initState() {
    scrollController = ScrollController();
    super.initState();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(),
      child: Scaffold(
          backgroundColor: Colors.grey.shade100,
          floatingActionButton: FloatingActionButton(
            child: Icon(Feather.plus),
            onPressed: () async {
              var res = await showModalBottomSheet(
                backgroundColor: Colors.transparent,
                isScrollControlled: true,
                context: context,
                builder: (context) => BlocProvider.value(
                  value: HomeCubit(),
                  child: BlocBuilder<HomeCubit, HomeState>(
                    builder: (context, state) {
                      return Padding(
                        padding: EdgeInsets.only(
                            bottom: MediaQuery.of(context).viewInsets.bottom),
                        child: AddCredentialForm(
                          onTambah: (layanan, email, password) {
                            context
                                .read<HomeCubit>()
                                .tambahKredensial(layanan, email, password);
                            Navigator.pop(context);
                          },
                        ),
                      );
                    },
                  ),
                ),
              );
            },
          ),
          body: SafeArea(
            child: NotificationListener<ScrollEndNotification>(
              onNotification: (notification) {
                const scrollDistance = 150 - kToolbarHeight;

                if (scrollController.offset > 0 &&
                    scrollController.offset < scrollDistance) {
                  final double snapOffset =
                      scrollController.offset / scrollDistance > 0.3
                          ? scrollDistance
                          : 0;

                  Future.microtask(() => scrollController.animateTo(snapOffset,
                      duration: kThemeAnimationDuration, curve: Curves.easeIn));
                }

                return false;
              },
              child: CustomScrollView(
                controller: scrollController,
                slivers: [
                  SliverAppBar(
                    foregroundColor: Color(0xFF333333),
                    pinned: true,
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                            onPressed: () {
                              ScaffoldMessenger.of(context).showMaterialBanner(
                                MaterialBanner(
                                  backgroundColor: Colors.red,
                                  padding: EdgeInsets.only(
                                      top: MediaQuery.of(context).padding.top),
                                  actions: [
                                    TextButton(
                                        style: TextButton.styleFrom(
                                            primary: Colors.white),
                                        child: Text('Oke'),
                                        onPressed: () {
                                          ScaffoldMessenger.of(context)
                                              .clearMaterialBanners();
                                        }),
                                    TextButton(
                                        style: TextButton.styleFrom(
                                            primary: Colors.white),
                                        child: Text('LIAT SC'),
                                        onPressed: () {
                                          ScaffoldMessenger.of(context)
                                              .clearMaterialBanners();
                                          launch(
                                              'https://github.com/dragongesa/satria-clone');
                                        }),
                                  ],
                                  contentTextStyle:
                                      TextStyle(color: Colors.white),
                                  content: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 32, top: 16),
                                    child: Text('Males implementasi gwej'),
                                  ),
                                ),
                              );
                            },
                            icon: Icon(Icons.short_text)),
                        IconButton(
                            onPressed: () {
                              ScaffoldMessenger.of(context).showMaterialBanner(
                                MaterialBanner(
                                  backgroundColor: Colors.red,
                                  padding: EdgeInsets.only(
                                      top: MediaQuery.of(context).padding.top),
                                  actions: [
                                    TextButton(
                                        style: TextButton.styleFrom(
                                            primary: Colors.white),
                                        child: Text('Oke'),
                                        onPressed: () {
                                          ScaffoldMessenger.of(context)
                                              .clearMaterialBanners();
                                        }),
                                  ],
                                  contentTextStyle:
                                      TextStyle(color: Colors.white),
                                  content: Padding(
                                    padding: const EdgeInsets.only(left: 32),
                                    child: Text(
                                        'Mau ngesearch apaan, ini mah buat ui doang :))))'),
                                  ),
                                ),
                              );
                            },
                            icon: Icon(Feather.search)),
                      ],
                    ),
                    backgroundColor: Colors.grey.shade100,
                    collapsedHeight: kToolbarHeight,
                    expandedHeight: 150,
                    flexibleSpace: LayoutBuilder(
                      builder: (context, constraints) {
                        return FlexibleSpaceBar(
                          collapseMode: CollapseMode.parallax,
                          background: Container(
                            margin: EdgeInsets.all(32),
                            width: double.infinity,
                            alignment: Alignment.bottomLeft,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: RichText(
                                    text: TextSpan(
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText2
                                          ?.copyWith(fontSize: 18),
                                      children: [
                                        TextSpan(
                                            text: 'Halo, ', style: TextStyle()),
                                        TextSpan(
                                            text: DB.instance.auth
                                                    .getAt(0)
                                                    ?.userData
                                                    ?.name ??
                                                'Gak ada namanya',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold)),
                                      ],
                                    ),
                                  ),
                                ),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      primary: Colors.red,
                                      onPrimary: Colors.white,
                                      elevation: 0),
                                  child: Text('Keluar'),
                                  onPressed: () {
                                    DB.instance.auth.putAt(
                                        0,
                                        DB.instance.auth
                                            .getAt(0)!
                                            .copyWith(isLoggedIn: false));
                                    context
                                        .read<InitialCubit>()
                                        .checkCredentials();
                                  },
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  ValueListenableBuilder<Box<Credential>>(
                    valueListenable:
                        Hive.box<Credential>('credential').listenable(),
                    builder: (context, value, child) {
                      var items = List<Credential>.from(value.values)
                        ..retainWhere((element) =>
                            element.userId == DB.instance.currentUserId);

                      if (items.length == 0) {
                        return SliverFillRemaining(
                          hasScrollBody: false,
                          child: Center(
                            child: Text('Kamu belom punya apapun disini 👉👈'),
                          ),
                        );
                      }
                      return SliverList(
                        delegate: SliverChildBuilderDelegate((context, index) {
                          var item = items[index];
                          return Padding(
                            padding: const EdgeInsets.fromLTRB(32, 0, 32, 16),
                            child: ListTile(
                              onTap: () {
                                Clipboard.setData(
                                    ClipboardData(text: item.password));
                                TToast.success(
                                    'Password tersalin di clipboard (alias tinggal paste)');
                              },
                              trailing: IconButton(
                                icon: Icon(Feather.more_horizontal),
                                onPressed: () async {
                                  await showModalBottomSheet(
                                    context: context,
                                    backgroundColor: Colors.transparent,
                                    isScrollControlled: true,
                                    builder: (context) => CustomBottomSheet(
                                        popupTitle: 'Konfirmasi',
                                        body: SingleChildScrollView(
                                          child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(vertical: 8),
                                                  child: Text(
                                                      'Yakin gx sih mau ngehapus inih?'),
                                                ),
                                                Container(
                                                  width: double.infinity,
                                                  alignment:
                                                      Alignment.centerRight,
                                                  child: ElevatedButton(
                                                      style: ElevatedButton
                                                          .styleFrom(
                                                              primary:
                                                                  Colors.red,
                                                              elevation: 0,
                                                              onPrimary:
                                                                  Colors.white),
                                                      child: Text('Hapus'),
                                                      onPressed: () {
                                                        DB.instance.credential
                                                            .deleteAt(index);
                                                        Navigator.pop(context);
                                                      }),
                                                )
                                              ]),
                                        )),
                                  );
                                },
                              ),
                              title: Text(item.layanan),
                              subtitle: Text(item.email),
                              contentPadding: EdgeInsets.fromLTRB(16, 8, 8, 8),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8)),
                              tileColor: Colors.white,
                            ),
                          );
                        }, childCount: value.length),
                      );
                    },
                  ),
                ],
              ),
            ),
          )),
    );
  }
}

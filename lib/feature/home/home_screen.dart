import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nginvesyuk/feature/auth_repository.dart';
import 'package:nginvesyuk/feature/home/home_controller.dart';
import 'package:nginvesyuk/feature/home/home_repository.dart';
import 'package:nginvesyuk/feature/login/login_controller.dart';
import 'package:nginvesyuk/feature/profile/profile_screen.dart';
import 'package:nginvesyuk/main.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static String id = 'HomeScreen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final HomeController _homeController = HomeController(HomeRepository());
  final LoginController _loginController =
      LoginController(AuthRepository(), HomeRepository());
  bool popup = false;
  final ValueNotifier<bool> _hideBalance = ValueNotifier<bool>(false);
  final NumberFormat _numberFormat = NumberFormat.decimalPattern('id_ID');


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: MediaQuery.sizeOf(context).width,
            height: MediaQuery.sizeOf(context).height * 27 / 100,
            decoration: const BoxDecoration(color: Colors.deepPurpleAccent),
          ),
          SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8.0,
                        vertical: 16.0,
                      ),
                      child: SizedBox(
                        width: MediaQuery.sizeOf(context).width,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              'Selamat Pagi,',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(fontSize: 18, color: Colors.white),
                            ),
                            const SizedBox(height: 8),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    FutureBuilder(
                                      future: _homeController.getUserData(),
                                      builder: (context, snapshot) => snapshot
                                                  .connectionState ==
                                              ConnectionState.done
                                          ? Text(
                                              _homeController.userData?.name ??
                                                  'username',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleMedium
                                                  ?.copyWith(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.white),
                                            )
                                          : const Text("username"),
                                    ),
                                    FutureBuilder(
                                      future: _homeController.getUserData(),
                                      builder: (context, snapshot) =>
                                          snapshot.connectionState ==
                                                  ConnectionState.done
                                              ? Text(
                                                  _homeController.userData
                                                          ?.investorId ??
                                                      'investor_id',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodySmall
                                                      ?.copyWith(
                                                          color: Colors.white),
                                                )
                                              : const Text('investor_id'),
                                    ),
                                  ],
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const ProfileScreen(),
                                      ),
                                    );
                                  },
                                  child: const CircleAvatar(
                                    radius: 24,
                                    backgroundColor: Colors.white24,
                                    child: Icon(Icons.person,
                                        color: Colors.white, size: 32),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Card.outlined(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: SizedBox(
                          width: MediaQuery.sizeOf(context).width,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Text(
                                'Total Investasi',
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                              const SizedBox(height: 4),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    ValueListenableBuilder(
                                      valueListenable: _hideBalance,
                                      builder: (context, value, _) {
                                        return _hideBalance.value
                                            ? Row(
                                                children: [
                                                  Text(
                                                    'Rp ',
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .bodyLarge
                                                        ?.copyWith(
                                                            fontSize: 24,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                  ),
                                                  Text(
                                                    '------',
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .bodyLarge
                                                        ?.copyWith(
                                                            color: Colors.grey,
                                                            fontSize: 24,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                  ),
                                                ],
                                              )
                                            : FutureBuilder(
                                                future: _homeController
                                                    .getUserData(),
                                                builder: (context, snapshot) {
                                                  return snapshot
                                                              .connectionState ==
                                                          ConnectionState.done
                                                      ? Text(
                                                          'Rp ${_numberFormat.format(_homeController.userData?.totalInvestment).toString()}',
                                                          style: Theme.of(
                                                                  context)
                                                              .textTheme
                                                              .bodyLarge
                                                              ?.copyWith(
                                                                  fontSize: 24,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                        )
                                                      : const Text(
                                                          'Rp balance');
                                                },
                                              );
                                      },
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        _hideBalance.value =
                                            !_hideBalance.value;
                                      },
                                      icon: ValueListenableBuilder(
                                        valueListenable: _hideBalance,
                                        builder: (context, value, _) =>
                                            _hideBalance.value
                                                ? const Icon(
                                                    Icons.visibility_off)
                                                : const Icon(Icons.visibility),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Card.outlined(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: SizedBox(
                          width: MediaQuery.sizeOf(context).width,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Text(
                                'Distribusi Investasi',
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                              AspectRatio(
                                aspectRatio: 1.5,
                                child: PieChart(
                                  PieChartData(
                                    startDegreeOffset: -90,
                                    borderData: FlBorderData(show: false),
                                    sectionsSpace: 0,
                                    centerSpaceRadius: 55,
                                    sections: showingSections(),
                                  ),
                                ),
                              ),
                              const Divider(
                                  color: Colors.black12, thickness: 1),
                              const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Column(
                                  children: <Widget>[
                                    LabelIndicator(
                                        label: 'Saham',
                                        color: Colors.deepOrange,
                                        percentage: '39%'),
                                    LabelIndicator(
                                        label: 'Obligasi',
                                        color: Colors.green,
                                        percentage: '28%'),
                                    LabelIndicator(
                                        label: 'Reksadana',
                                        color: Colors.lightGreen,
                                        percentage: '18%'),
                                    LabelIndicator(
                                        label: 'Lainnya',
                                        color: Colors.lightBlueAccent,
                                        percentage: '15%'),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Card.outlined(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: SizedBox(
                          width: MediaQuery.sizeOf(context).width,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Text(
                                'Perkembangan Harian',
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                              const SizedBox(height: 8),
                              FutureBuilder(
                                future: _homeController.getStockData(),
                                builder: (context, snapshot) {
                                  return snapshot.connectionState ==
                                          ConnectionState.done
                                      ? ListView.builder(
                                          physics:
                                              const NeverScrollableScrollPhysics(),
                                          primary: false,
                                          clipBehavior: Clip.none,
                                          shrinkWrap: true,
                                          itemCount: _homeController
                                                  .stocksData?.length ??
                                              0,
                                          itemBuilder: (context, index) =>
                                              Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(4),
                                                  child: CircleAvatar(
                                                    radius: 15,
                                                    child: Image.asset(
                                                        'images/stock1.png'),
                                                  ),
                                                ),
                                                const SizedBox(width: 10),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      _homeController
                                                              .stocksData?[
                                                                  index]
                                                              .stockCode ??
                                                          'stockcode',
                                                      style: const TextStyle(
                                                          fontSize: 10),
                                                    ),
                                                    Text(
                                                        _homeController
                                                                .stocksData?[
                                                                    index]
                                                                .stockName ??
                                                            'stockname',
                                                        style: const TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 16)),
                                                  ],
                                                ),
                                                const Spacer(),
                                                Text(
                                                    _homeController
                                                            .stocksData?[index]
                                                            .stockPercent ??
                                                        '0%',
                                                    style: TextStyle(
                                                        color: _homeController
                                                                    .stocksData?[
                                                                        index]
                                                                    .trends ==
                                                                'up'
                                                            ? Colors.green
                                                            : Colors.red,
                                                        fontSize: 16)),
                                                const SizedBox(width: 10),
                                                Icon(
                                                  _homeController
                                                              .stocksData?[
                                                                  index]
                                                              .trends ==
                                                          'up'
                                                      ? Icons.trending_up
                                                      : Icons.trending_down,
                                                  color: _homeController
                                                              .stocksData?[
                                                                  index]
                                                              .trends ==
                                                          'up'
                                                      ? Colors.green
                                                      : Colors.red,
                                                )
                                              ],
                                            ),
                                          ),
                                        )
                                      : const Center(child: Text('No items'));
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Card.outlined(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: SizedBox(
                          width: MediaQuery.sizeOf(context).width,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Berita Terkini',
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                              FutureBuilder(
                                future: _homeController.getNewsData(),
                                builder: (context, snapshot) {
                                  return snapshot.connectionState ==
                                          ConnectionState.done
                                      ? ListView.builder(
                                          shrinkWrap: true,
                                          primary: false,
                                          physics:
                                              const NeverScrollableScrollPhysics(),
                                          itemCount: _homeController
                                                  .newsData?.length ??
                                              0,
                                          itemBuilder: (context, index) =>
                                              ListTile(
                                            title: Text(_homeController
                                                    .newsData?[index].title ??
                                                'title'),
                                            leading: Image.asset(
                                              _homeController
                                                      .newsData?[index].image ??
                                                  'images/news1.png',
                                              fit: BoxFit.cover,
                                              width: 60,
                                              height: 60,
                                            ),
                                            isThreeLine: false,
                                            subtitle: Text(_homeController
                                                    .newsData?[index].time ??
                                                'datetime'),
                                          ),
                                        )
                                      : const Center(child: Text('No items'));
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Center(
                      child: TextButton(
                        onPressed: () {
                          _loginController.logout();
                          Future.delayed(
                            Durations.extralong2,
                            () {
                              Navigator.of(context).pushAndRemoveUntil(
                                MaterialPageRoute(
                                  builder: (context) => const Splash(),
                                ),
                                (route) => false,
                              );
                            },
                          );
                        },
                        child: Text('Keluar',
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(color: Colors.red)),
                      ),
                    ),
                    const SizedBox(height: 14),
                    Center(
                      child: Text('v1.0',
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall
                              ?.copyWith(color: Colors.black45)),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<PieChartSectionData> showingSections() {
    return List.generate(4, (i) {
      const shadows = [Shadow(color: Colors.black, blurRadius: 2)];
      switch (i) {
        case 0:
          return PieChartSectionData(
            color: Colors.deepOrange,
            value: 39,
            title: '39%',
            titleStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              shadows: shadows,
            ),
          );
        case 1:
          return PieChartSectionData(
            color: Colors.green,
            value: 28,
            title: '28%',
            titleStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              shadows: shadows,
            ),
          );
        case 2:
          return PieChartSectionData(
            color: Colors.lightGreen,
            value: 18,
            title: '18%',
            titleStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              shadows: shadows,
            ),
          );
        case 3:
          return PieChartSectionData(
            color: Colors.lightBlueAccent,
            value: 15,
            title: '15%',
            titleStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              shadows: shadows,
            ),
          );
        default:
          throw Error();
      }
    });
  }
}

class LabelIndicator extends StatelessWidget {
  const LabelIndicator({
    super.key,
    required this.label,
    required this.color,
    this.size = 12,
    required this.percentage,
  });

  final String label;
  final String percentage;
  final Color color;
  final double size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width / 2,
      child: Row(
        children: [
          Container(
            height: size,
            width: size,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: color,
            ),
          ),
          const SizedBox(width: 8),
          Text(
            label,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
          const Spacer(),
          Text(
            percentage,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}

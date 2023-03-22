import 'package:aipay/blocs/auth/auth_bloc.dart';
import 'package:aipay/blocs/tips/tips_bloc.dart';
import 'package:aipay/blocs/transaction/transaction_bloc.dart';
import 'package:aipay/blocs/user/user_bloc.dart';
import 'package:aipay/models/transfer_form_model.dart';
import 'package:aipay/shared/shared_method.dart';
import 'package:aipay/shared/themes.dart';
import 'package:aipay/ui/screens/transfer_amount_screens.dart';
import 'package:aipay/ui/widgets/home_card_information_widget.dart';
import 'package:aipay/ui/widgets/home_card_service_item.dart';
import 'package:aipay/ui/widgets/home_featured_service_item_widget.dart';
import 'package:aipay/ui/widgets/home_last_transaction_widget.dart';
import 'package:aipay/ui/widgets/home_more_dialog.dart';
import 'package:aipay/ui/widgets/home_tips_item_widget.dart';
import 'package:aipay/ui/widgets/home_user_transaction_item_widget.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class HomeScreens extends StatefulWidget {
  const HomeScreens({super.key});

  @override
  State<HomeScreens> createState() => _HomeScreensState();
}

class _HomeScreensState extends State<HomeScreens> {
  // NOTE : Indicator
  int currentIndex = 0;
  bool obsecureSaldo = true;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            // Sliver App Bar
            SliverAppBar(
              backgroundColor: kBlackSoftColor,
              // leading: Icon(Icons.menu),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BlocBuilder<AuthBloc, AuthState>(
                    builder: (context, state) {
                      if (state is AuthSuccess) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 10.0),
                                  child: Image.asset(
                                    'assets/images/logo.png',
                                    width: 30,
                                  ),
                                ),
                                const SizedBox(width: 5.0),
                                Text(
                                  'E PAY',
                                  style: whiteTextStyle.copyWith(
                                    fontSize: 18,
                                    fontWeight: bold,
                                    letterSpacing: 3,
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              margin: const EdgeInsets.only(
                                left: 25,
                              ),
                              child: Row(
                                children: [
                                  Text(
                                    'Welcome, ',
                                    style: grayTextStyle.copyWith(
                                      fontSize: 12,
                                      fontWeight: regular,
                                    ),
                                  ),
                                  Text(
                                    // state.user.name!.toString().toUpperCase(),
                                    state.user.name!.toString().toUpperCase(),
                                    style: whiteTextStyle.copyWith(
                                      fontSize: 18,
                                      fontWeight: bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        );
                      }
                      return Container();
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 15),
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: kBlackSoftColor.withOpacity(0.5),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(5),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Image.asset(
                                    'assets/icons/ic_discount.png',
                                    width: 20,
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    'Promo',
                                    style: yellowTextStyle.copyWith(
                                      fontSize: 15,
                                      fontWeight: semiBold,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              // expandedHeight: 200,
              elevation: 0,
              floating: true,
              pinned: false,
              flexibleSpace: FlexibleSpaceBar(
                background: Container(
                  color: kDarkBackgraundColor,
                ),
              ),
            ),

            // Sliper Item
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Container(
                  margin: const EdgeInsets.only(top: 30),
                  padding: const EdgeInsets.all(15),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: const DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('assets/images/img_card.png'),
                    ),
                  ),
                  child: BlocBuilder<AuthBloc, AuthState>(
                    builder: (context, state) {
                      if (state is AuthSuccess) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'E PAY',
                              style: whiteTextStyle.copyWith(
                                fontSize: 12,
                                fontWeight: semiBold,
                              ),
                            ),
                            Text(
                              'Saldo',
                              style: whiteTextStyle.copyWith(
                                fontWeight: semiBold,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    obsecureSaldo == false
                                        ? Text(
                                            'Rp. xxx xxx',
                                            // formatCurrency(state.user.balance ?? 0),
                                            style: whiteTextStyle.copyWith(
                                              fontSize: 16,
                                              fontWeight: semiBold,
                                              letterSpacing: 2,
                                            ),
                                          )
                                        : Text(
                                            formatCurrency(
                                                state.user.balance ?? 0),
                                            // formatCurrency(state.user.balance ?? 0),
                                            style: whiteTextStyle.copyWith(
                                              fontSize: 16,
                                              fontWeight: semiBold,
                                              letterSpacing: 2,
                                            ),
                                          ),
                                    const SizedBox(
                                      width: 15,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        obsecureSaldo = !obsecureSaldo;
                                      },
                                      child: Icon(
                                        obsecureSaldo
                                            ? Icons.remove_red_eye_rounded
                                            : Icons.visibility_off_rounded,
                                        size: 20,
                                        color: kWhiteColor,
                                      ),
                                    ),
                                  ],
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    color: kWhiteColor.withOpacity(0.8),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 10,
                                      vertical: 5,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Container(
                                          width: 20,
                                          height: 20,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: kPurpleColor,
                                          ),
                                          child: Center(
                                            child: Text(
                                              'P',
                                              style: whiteTextStyle.copyWith(
                                                fontSize: 20,
                                                fontWeight: extraBold,
                                              ),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          '120 Point',
                                          style: purpleTextStyle.copyWith(
                                            fontSize: 16,
                                            fontWeight: semiBold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              margin: const EdgeInsets.only(
                                top: 10,
                                bottom: 10,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.transparent,
                              ),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        'Level 1',
                                        style: whiteTextStyle.copyWith(
                                          fontWeight: medium,
                                        ),
                                      ),
                                      const Spacer(),
                                      Text(
                                        '55 % ',
                                        style: blueTextStyle.copyWith(
                                          fontWeight: medium,
                                        ),
                                      ),
                                      Text(
                                        'of ${formatCurrency(20000)}',
                                        // 'of ${formatCurrency(10000)}',
                                        style: whiteTextStyle.copyWith(
                                          fontWeight: semiBold,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(55),
                                    child: LinearProgressIndicator(
                                      value: 0.55,
                                      minHeight: 7,
                                      valueColor:
                                          AlwaysStoppedAnimation(kPurpleColor),
                                      backgroundColor: kLightBackgraundColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 20),
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    HomeCardServicesItem(
                                      imageUrl: 'assets/icons/ic_topup.png',
                                      title: 'Top Up',
                                      color: kGraySoftColor,
                                      onTap: () {
                                        Navigator.pushNamed(context, '/top-up');
                                      },
                                    ),
                                    HomeCardServicesItem(
                                      imageUrl: 'assets/icons/ic_send.png',
                                      title: 'Transfer',
                                      color: kGraySoftColor,
                                      onTap: () {
                                        Navigator.pushNamed(
                                            context, '/transfer');
                                      },
                                    ),
                                    HomeCardServicesItem(
                                      imageUrl: 'assets/icons/ic_withdraw.png',
                                      title: 'Tarik Tunai',
                                      color: kGraySoftColor,
                                      onTap: () {},
                                    ),
                                    HomeCardServicesItem(
                                      imageUrl: 'assets/icons/ic_history.png',
                                      title: 'More',
                                      color: kGraySoftColor,
                                      onTap: () {},
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        );
                      }
                      return Container();
                    },
                  ),
                ),
              ),
            ),
            // Sliper Item
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  margin: const EdgeInsets.only(
                    top: 20,
                  ),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: kBlackSoftColor,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // FEATURED
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 5,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: kBlackSoftColor,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 14,
                                top: 10,
                              ),
                              child: Text(
                                'Featured',
                                style: whiteTextStyle.copyWith(
                                  fontSize: 18,
                                  fontWeight: semiBold,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            // NOTE : Featured Item
                            Column(
                              children: [
                                SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        HomeFeaturedItem(
                                          imageUrl:
                                              'assets/illustration/il_hp.svg',
                                          title: 'Pulsa/Data',
                                          color: kBlackSoftColor,
                                          onTap: () {
                                            Navigator.pushNamed(
                                              context,
                                              '/provider-item',
                                            );
                                          },
                                        ),
                                        const SizedBox(
                                          width: 15,
                                        ),
                                        HomeFeaturedItem(
                                          imageUrl:
                                              'assets/illustration/il_internet.svg',
                                          title: 'Internet',
                                          color: kBlackSoftColor,
                                          onTap: () {},
                                        ),
                                        const SizedBox(
                                          width: 15,
                                        ),
                                        HomeFeaturedItem(
                                          imageUrl:
                                              'assets/illustration/il_pln.svg',
                                          title: 'Pln',
                                          color: kBlackSoftColor,
                                          onTap: () {},
                                        ),
                                        const SizedBox(
                                          width: 15,
                                        ),
                                        HomeFeaturedItem(
                                          imageUrl:
                                              'assets/illustration/il_pdam.svg',
                                          title: 'PDAM',
                                          color: kBlackSoftColor,
                                          onTap: () {},
                                        ),
                                        const SizedBox(
                                          width: 15,
                                        ),
                                        HomeFeaturedItem(
                                          imageUrl:
                                              'assets/illustration/il_transportation.svg',
                                          title: 'Invest',
                                          color: kBlackSoftColor,
                                          onTap: () {},
                                        ),
                                        const SizedBox(
                                          width: 15,
                                        ),
                                        HomeFeaturedItem(
                                          imageUrl:
                                              'assets/illustration/il_internet.svg',
                                          title: 'Invest',
                                          color: kBlackSoftColor,
                                          onTap: () {},
                                        ),
                                        const SizedBox(
                                          width: 15,
                                        ),
                                        HomeFeaturedItem(
                                          imageUrl:
                                              'assets/illustration/il_bpjs.svg',
                                          title: 'BPJS',
                                          color: kBlackSoftColor,
                                          onTap: () {},
                                        ),
                                        const SizedBox(
                                          width: 15,
                                        ),
                                        HomeFeaturedItem(
                                          imageUrl:
                                              'assets/illustration/il_more.svg',
                                          title: 'More',
                                          color: kYellowColor,
                                          onTap: () {
                                            showDialog(
                                              context: context,
                                              builder: (context) =>
                                                  const MoreDialog(),
                                            );
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            // Sliper Item LINNER SPACING
            SliverToBoxAdapter(
              child: Container(
                margin: const EdgeInsets.only(top: 10),
                height: 5,
                color: kBlackSoftColor,
              ),
            ),
            SliverToBoxAdapter(
              child: // NOTE: CAROUSEL SLIDER
                  Container(
                margin: const EdgeInsets.only(
                  top: 20,
                ),
                child: CarouselSlider(
                  items: const [
                    HomeCardInformation(
                      imageUrl: 'assets/images/img_item.png',
                    ),
                    HomeCardInformation(
                      imageUrl: 'assets/images/img_item2.png',
                    ),
                    HomeCardInformation(
                      imageUrl: 'assets/images/img_item3.png',
                    ),
                    HomeCardInformation(
                      imageUrl: 'assets/images/img_item4.png',
                    ),
                  ],
                  options: CarouselOptions(
                    viewportFraction: 0.85,
                    enableInfiniteScroll: true,
                    autoPlay: true,
                    autoPlayInterval: const Duration(seconds: 3),
                    height: 130,
                    aspectRatio: 16 / 9,
                    initialPage: currentIndex,
                    onPageChanged: (index, reason) {
                      setState(
                        () {
                          currentIndex = index;
                        },
                      );
                    },
                  ),
                ),
              ),
            ),
            // Indicator Item Slider
            SliverToBoxAdapter(
              child: Container(
                margin: const EdgeInsets.only(
                  right: 20,
                  top: 20,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(
                        right: 5,
                      ),
                      height: 10,
                      width: currentIndex == 0 ? 30 : 10,
                      decoration: BoxDecoration(
                        shape: currentIndex == 0
                            ? BoxShape.circle
                            : BoxShape.circle,
                        color:
                            currentIndex == 0 ? kYellowColor : kBlackSoftColor,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(
                        right: 5,
                      ),
                      height: 10,
                      width: currentIndex == 1 ? 30 : 10,
                      decoration: BoxDecoration(
                        shape: currentIndex == 1
                            ? BoxShape.circle
                            : BoxShape.circle,
                        color:
                            currentIndex == 1 ? kYellowColor : kBlackSoftColor,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(
                        right: 5,
                      ),
                      height: 10,
                      width: currentIndex == 2 ? 30 : 10,
                      decoration: BoxDecoration(
                        shape: currentIndex == 2
                            ? BoxShape.circle
                            : BoxShape.circle,
                        color:
                            currentIndex == 2 ? kYellowColor : kBlackSoftColor,
                      ),
                    ),
                    Container(
                      height: 10,
                      width: currentIndex == 3 ? 30 : 10,
                      decoration: BoxDecoration(
                        shape: currentIndex == 3
                            ? BoxShape.circle
                            : BoxShape.circle,
                        color:
                            currentIndex == 3 ? kYellowColor : kBlackSoftColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Sliper Item LINNER SPACING
            SliverToBoxAdapter(
              child: Container(
                margin: const EdgeInsets.only(top: 10),
                height: 5,
                color: kBlackSoftColor,
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  margin: const EdgeInsets.only(
                    top: 20,
                  ),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: kBlackSoftColor,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // FEATURED
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 20,
                              left: 14,
                              right: 14,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Last Transaction',
                                  style: whiteTextStyle.copyWith(
                                    fontSize: 18,
                                    fontWeight: semiBold,
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    Navigator.pushNamed(
                                        context, '/last-transaction');
                                  },
                                  child: Row(
                                    children: [
                                      Text(
                                        'See All',
                                        style: greenTextStyle.copyWith(
                                          fontSize: 14,
                                          fontWeight: semiBold,
                                        ),
                                      ),
                                      const SizedBox(width: 5),
                                      Icon(
                                        Icons
                                            .keyboard_double_arrow_right_rounded,
                                        color: kGreenColor,
                                        size: 18,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Container(
                              margin: const EdgeInsets.only(top: 20),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: kDarkBackgraundColor.withOpacity(0.5),
                              ),
                              child: BlocProvider(
                                create: (context) =>
                                    TransactionBloc()..add(TransactionGet()),
                                child: BlocBuilder<TransactionBloc,
                                    TransactionState>(
                                  builder: (context, state) {
                                    if (state is TransactionSuccess) {
                                      return Column(
                                        children: state.transactions
                                            .map((transaction) {
                                          return HomeLastTransaction(
                                            transaction: transaction,
                                            color: kBlackSoftColor,
                                          );
                                        }).toList(),
                                      );
                                    }
                                    return const Center(
                                      child: CircularProgressIndicator(),
                                    );
                                  },
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            // Sliper Item LINNER SPACING
            SliverToBoxAdapter(
              child: Container(
                margin: const EdgeInsets.only(top: 10),
                height: 5,
                color: kBlackSoftColor,
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  margin: const EdgeInsets.only(
                    top: 20,
                  ),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: kBlackSoftColor,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // FEATURED
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 20,
                              left: 14,
                            ),
                            child: Text(
                              'Send Again',
                              style: whiteTextStyle.copyWith(
                                fontSize: 18,
                                fontWeight: semiBold,
                              ),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(
                              top: 20,
                              left: 10,
                            ),
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: BlocProvider(
                                create: (context) => UserBloc()
                                  ..add(
                                      UserGetRecent()), // if message modelinitial please add ini bloc ..add(event for bloc)
                                child: BlocBuilder<UserBloc, UserState>(
                                  builder: (context, state) {
                                    if (state is UserSuccess) {
                                      return Row(
                                        children: state.users.map((user) {
                                          return GestureDetector(
                                            onTap: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      TransferAmountScreens(
                                                    data: TransferFormModel(
                                                      sendTo: user.username,
                                                    ),
                                                  ),
                                                ),
                                              );
                                            },
                                            child: HomeUserTransactionItem(
                                              userTransaction: user,
                                            ),
                                          );
                                        }).toList(),
                                      );
                                    }
                                    return const Center(
                                      child: CircularProgressIndicator(),
                                    );
                                  },
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            // Sliper Item LINNER SPACING
            SliverToBoxAdapter(
              child: Container(
                margin: const EdgeInsets.only(top: 10),
                height: 5,
                color: kBlackSoftColor,
              ),
            ),
            // NOTE : Tips & Info Yang menarik tips in E PAY
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  margin: const EdgeInsets.only(
                    top: 20,
                    bottom: 60,
                  ),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: kBlackSoftColor,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // FEATURED
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 20,
                              left: 14,
                            ),
                            child: Text(
                              'Tips & Information',
                              style: whiteTextStyle.copyWith(
                                fontSize: 18,
                                fontWeight: semiBold,
                              ),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(
                              top: 20,
                              left: 10,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: kBlackSoftColor,
                            ),
                            child: BlocProvider(
                              create: (context) => TipsBloc()..add(TipGet()),
                              child: BlocBuilder<TipsBloc, TipsState>(
                                builder: (context, state) {
                                  if (state is TipsSuccess) {
                                    return Wrap(
                                      spacing: 10,
                                      runSpacing: 10,
                                      children: state.tips.map((tip) {
                                        return HomeTipsItem(tips: tip);
                                      }).toList(),
                                    );
                                  }
                                  return Center(
                                    child: LoadingAnimationWidget
                                        .staggeredDotsWave(
                                      color: kWhiteColor,
                                      size: 30,
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

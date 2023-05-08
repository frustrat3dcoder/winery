import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:winery/utils/text_style.dart';

class HomeWidget extends StatelessWidget {
  HomeWidget({super.key});
  List<String> options = ['Beer', 'Wine', 'Spirits', 'Champagne'];
  List<Map<String, dynamic>> receipes = [
    {"title": "Wine1", "image": "assets/wine1.png"},
    {"title": "Wine2", "image": "assets/wine2.png"},
    {"title": "Wine2", "image": "assets/wine3.png"}
  ];
  List<Map<String, dynamic>> editors = [
    {
      "title": "Wine1",
      "image": "assets/wine1.png",
      "spectator_name": "spincer bob",
      "subtitle": "Something something",
      "reviewer_image":
          "https://s3-alpha-sig.figma.com/img/adc3/abe3/de1d79294c0c05a195115ecfa1ee3a03?Expires=1683504000&Signature=Us-OJfqPJG1bW~RFQxpSZfQxqt7FYi8YwcOzFlTnyQNcH7bNK0MD3AKiLGHhT2eA4sMgEgBd8ksJIljNYN66cs7actVn7CYOfmf6rcHjCXU85QL6Ai5KJA0aIIpVIit3smP27BOk3PfxFSdqibytvATB~XoelGOaFsooHPPbEeBROnyCo4aNpd0gEjhFG-68jqTSeY786tlxD3Jhx0Ca~DJEU6sJf87yzqRBnm0POdHt5nL949REfzTWrjvGT3k-RIyAtDJIPQ-JkQ4bbI8krAqsznm0mScqnJoargSJ-KHyLa4lNdpbS2qy0sNlWRkL921r4UmU8ld6ha3feh2NgA__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4"
    },
    {
      "title": "Wine2",
      "image": "assets/wine2.png",
      "spectator_name": "john jones",
      "subtitle": "Something something",
      "reviewer_image":
          "https://s3-alpha-sig.figma.com/img/fd81/9b7b/6ce4aff598ffb0963fa003043c6c9ded?Expires=1683504000&Signature=X2kF3w2HuktT~pAoGF-lf-CmdLlmI5Ocffz0siO4~WdGKgdofr~ynC5WqH6nqWWEgjRRkMXLkDxKcf5j~nsWc5r4DuV4OdVO~4vgvCg5tTx3IHYfMYamLgB87ZC4t0HRnc35rSFxZ~QENqf3YDiYJEQ93BtsRWXomiJ8DcABi5tTaAmz8c7QYm-nG9kLQB983evm8664bqmn3yutgXqcklgcgf2xMqH9FGEWQ4wM1ZA~lBL2FEv7K8j6wnOoXnn7aQTbCZn2dV3IRZMTfn3xzFmqfMLvbdtj59aZ8~~0tr5RfPv9rMx6d9IM7n3--h4VnRgLQByzT~BUwzHpNoIfNA__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4"
    },
    {
      "title": "Wine2",
      "image": "assets/wine3.png",
      "spectator_name": "rick carter",
      "subtitle": "Something something",
      "reviewer_image":
          "https://s3-alpha-sig.figma.com/img/fd81/9b7b/6ce4aff598ffb0963fa003043c6c9ded?Expires=1683504000&Signature=X2kF3w2HuktT~pAoGF-lf-CmdLlmI5Ocffz0siO4~WdGKgdofr~ynC5WqH6nqWWEgjRRkMXLkDxKcf5j~nsWc5r4DuV4OdVO~4vgvCg5tTx3IHYfMYamLgB87ZC4t0HRnc35rSFxZ~QENqf3YDiYJEQ93BtsRWXomiJ8DcABi5tTaAmz8c7QYm-nG9kLQB983evm8664bqmn3yutgXqcklgcgf2xMqH9FGEWQ4wM1ZA~lBL2FEv7K8j6wnOoXnn7aQTbCZn2dV3IRZMTfn3xzFmqfMLvbdtj59aZ8~~0tr5RfPv9rMx6d9IM7n3--h4VnRgLQByzT~BUwzHpNoIfNA__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4"
    }
  ];

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      color: Colors.white,
      width: size.width,
      height: size.height,
      padding: const EdgeInsets.only(top: 60, left: 10, right: 10, bottom: 20),
      child: Column(
        children: [
          header(size),
          const SizedBox(height: 10),
          searchDrinkTextField(),
          const SizedBox(height: 10),
          choiceChip(size),
          const SizedBox(height: 10),
          buildHeaderRows(title1: 'Popular Receipes', title2: 'View all'),
          SizedBox(
              width: size.width,
              height: 145,
              child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: receipes.length,
                  itemBuilder: (context, int index) => buildReceipesWidget(
                      title: receipes[index]["title"],
                      image: receipes[index]["image"]))),
          buildHeaderRows(title1: 'Editor\'s Choice', title2: 'View all'),
          SizedBox(
              height: 250,
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: editors.length,
                  itemBuilder: (context, int index) =>
                      buildEditorChoiceTile(index))),
        ],
      ),
    );
  }

  Row buildHeaderRows({required String title1, required String title2}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title1,
          style: textStyleWithPoppins(
              color: Color(0xff0A2533),
              fontsize: 22.0,
              fontweight: FontWeight.w600),
        ),
        Text(
          title2,
          style: textStyleWithPoppins(
              color: Color(0xff70B9BE),
              fontsize: 14.0,
              fontweight: FontWeight.w400),
        ),
      ],
    );
  }

  SizedBox choiceChip(Size size) {
    return SizedBox(
      width: size.width,
      height: 50,
      child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: options.length,
          itemBuilder: (context, int index) => Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: ChoiceChip(
                  label: Text(options[index]),
                  labelStyle: textStyleWithPoppins(
                      color: Color(0xff393939),
                      fontsize: 16.0,
                      fontweight: FontWeight.w400),
                  selected: options[index] == "Wine" ? true : false,
                  onSelected: (selected) {
                    // Do something when the chip is selected
                  },
                ),
              )),
    );
  }

  SizedBox header(Size size) {
    return SizedBox(
      width: size.width,
      child: Text(
        "Discover Receipes",
        style: textStyleWithPoppins(
            color: Color(0xff0A2533),
            fontsize: 22.0,
            fontweight: FontWeight.w600),
      ),
    );
  }

  TextField searchDrinkTextField() {
    return TextField(
      decoration: InputDecoration(
        hintText: 'Search your drinks',
        hintStyle: textStyleWithPoppins(
            color: const Color(0xffAEAEAE),
            fontsize: 14.0,
            fontweight: FontWeight.w400),
        prefixIcon: Icon(Icons.search),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14.0),
          borderSide: const BorderSide(
            color: Color(0xFFE6EBF2),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14.0),
          borderSide: const BorderSide(
            color: Color(0xFFE6EBF2),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14.0),
          borderSide: const BorderSide(
            color: Color(0xFFE6EBF2),
          ),
        ),
      ),
    );
  }

  buildReceipesWidget({required String title, required String image}) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Card(
        elevation: 5,
        child: Container(
          width: 100,
          height: 135,
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          child: Column(
            children: [
              Expanded(
                  child: ClipRRect(
                borderRadius: BorderRadius.circular(14.0),
                child: SizedBox(
                  height: 100,
                  width: 80,
                  child: Image.asset(
                    image,
                    fit: BoxFit.cover,
                  ),
                ),
              )),
              Text(
                title,
                style: textStyleWithPoppins(
                    color: Colors.black,
                    fontsize: 14.0,
                    fontweight: FontWeight.w400),
              )
            ],
          ),
        ),
      ),
    );
  }

  buildEditorChoiceTile(int index) {
    return Container(
      width: double.infinity,
      height: 120,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(25)),
      child: Row(
        children: [],
      ),
    );
  }
}

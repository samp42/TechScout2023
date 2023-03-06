import 'package:flutter/material.dart';
import 'package:scout/enums/alliance_enum.dart';
import 'package:scout/models/match_scouting.dart';
import 'package:scout/theme.dart';

class TeleopFormColumn extends StatefulWidget {
  final AllianceEnum alliance;
  MatchScouting matchScouting;

  TeleopFormColumn({
    Key? key,
    required this.alliance,
    required this.matchScouting,
  }) : super(key: key);

  @override
  TeleopFormColumnState createState() => TeleopFormColumnState();
}

class TeleopFormColumnState extends State<TeleopFormColumn> {
  int links = 0;
  bool coopertition = false;
  bool engaged = false;

  Color get _primary =>
      widget.alliance == AllianceEnum.red ? redPrimary : bluePrimary;

  Color get _secondary =>
      widget.alliance == AllianceEnum.red ? redSecondary : blueSecondary;

  BorderRadius get _borderRadius => BorderRadius.only(
      topLeft: Radius.circular(
          widget.alliance == AllianceEnum.red ? kBorderRadius : 0),
      topRight: Radius.circular(
          widget.alliance == AllianceEnum.red ? 0 : kBorderRadius),
      bottomLeft: Radius.circular(
          widget.alliance == AllianceEnum.red ? kBorderRadius : 0),
      bottomRight: Radius.circular(
          widget.alliance == AllianceEnum.red ? 0 : kBorderRadius));

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                onPressed: () {
                  setState(() {
                    links = links > 0 ? links - 1 : 0;
                  });
                },
                icon: const Icon(Icons.remove_circle_outline_outlined),
                color: Colors.redAccent,
              ),
              Container(
                margin: const EdgeInsetsDirectional.symmetric(horizontal: 24),
                padding: const EdgeInsets.only(left: 12),
                decoration: ShapeDecoration(
                  color: _primary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      100, // pill shape, radius voluntarily too big
                    ),
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      '$links / 5',
                      style: const TextStyle(
                        color: whiteT4K,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Container(
                      padding: const EdgeInsets.all(4),
                      decoration: const ShapeDecoration(
                        color: whiteT4K,
                        shape: CircleBorder(),
                      ),
                      child: Icon(
                        Icons.add_link_outlined,
                        color: _primary,
                      ),
                    ),
                  ],
                ),
              ),
              IconButton(
                onPressed: () {
                  setState(() {
                    if (links < 9) links++;
                  });
                },
                icon: const Icon(Icons.add_circle_outline_outlined),
                color: Colors.green,
              ),
            ],
          ),
          const SizedBox(height: 8),
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor:
                  MaterialStateColor.resolveWith((states) => _primary),
              shape: MaterialStateProperty.resolveWith(
                  (states) => RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100),
                      )),
            ),
            onPressed: () {
              setState(() {
                coopertition = !coopertition;
              });
            },
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.handshake_rounded,
                  color: coopertition ? whiteT4K : Colors.white54,
                  size: 24,
                ),
                const SizedBox(width: 8),
                Text(
                  'Coopertition',
                  style: TextStyle(
                    color: coopertition ? whiteT4K : Colors.white54,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor:
                  MaterialStateColor.resolveWith((states) => _primary),
              shape: MaterialStateProperty.resolveWith(
                  (states) => RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100),
                      )),
            ),
            onPressed: () {
              setState(() {
                engaged = !engaged;
              });
            },
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.battery_charging_full_outlined,
                  color: engaged ? whiteT4K : Colors.white54,
                  size: 24,
                ),
                const SizedBox(width: 8),
                Text(
                  'Teleop Engaged',
                  style: TextStyle(
                    color: engaged ? whiteT4K : Colors.white54,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

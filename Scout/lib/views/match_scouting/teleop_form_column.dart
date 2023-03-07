import 'package:flutter/material.dart';
import 'package:scout/enums/alliance_enum.dart';
import 'package:scout/models/match_scouting.dart';
import 'package:scout/theme.dart';

class TeleopFormColumn extends StatefulWidget {
  final AllianceEnum alliance;
  final MatchScouting matchScouting;

  const TeleopFormColumn({
    Key? key,
    required this.alliance,
    required this.matchScouting,
  }) : super(key: key);

  @override
  TeleopFormColumnState createState() => TeleopFormColumnState();
}

class TeleopFormColumnState extends State<TeleopFormColumn> {
  Color get _primary =>
      widget.alliance == AllianceEnum.red ? redPrimary : bluePrimary;

  void _decrementLinks() {
    if (widget.alliance == AllianceEnum.red) {
      if (widget.matchScouting.redLinks > 0) {
        widget.matchScouting.redLinks--;
      }
    } else {
      if (widget.matchScouting.blueLinks > 0) {
        widget.matchScouting.blueLinks--;
      }
    }
  }

  void _incrementLinks() {
    if (widget.alliance == AllianceEnum.red) {
      if (widget.matchScouting.redLinks < 9) {
        widget.matchScouting.redLinks++;
      }
    } else {
      if (widget.matchScouting.blueLinks < 9) {
        widget.matchScouting.blueLinks++;
      }
    }
  }

  int get _links => widget.alliance == AllianceEnum.red
      ? widget.matchScouting.redLinks
      : widget.matchScouting.blueLinks;

  void _toggleCoopertition() {
    if (widget.alliance == AllianceEnum.red) {
      widget.matchScouting.redCoopertition =
          !widget.matchScouting.redCoopertition;
    } else {
      widget.matchScouting.blueCoopertition =
          !widget.matchScouting.blueCoopertition;
    }
  }

  bool get _coopertition => widget.alliance == AllianceEnum.red
      ? widget.matchScouting.redCoopertition
      : widget.matchScouting.blueCoopertition;

  void _toggleEngaged() {
    if (widget.alliance == AllianceEnum.red) {
      widget.matchScouting.redEngaged = !widget.matchScouting.redEngaged;
    } else {
      widget.matchScouting.blueEngaged = !widget.matchScouting.blueEngaged;
    }
  }

  bool get _engaged => widget.alliance == AllianceEnum.red
      ? widget.matchScouting.redEngaged
      : widget.matchScouting.blueEngaged;

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
                    _decrementLinks();
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
                      '$_links / 5',
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
                    _incrementLinks();
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
                _toggleCoopertition();
              });
            },
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.handshake_rounded,
                  color: _coopertition ? whiteT4K : Colors.white54,
                  size: 24,
                ),
                const SizedBox(width: 8),
                Text(
                  'Coopertition',
                  style: TextStyle(
                    color: _coopertition ? whiteT4K : Colors.white54,
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
                _toggleEngaged();
              });
            },
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.battery_charging_full_outlined,
                  color: _engaged ? whiteT4K : Colors.white54,
                  size: 24,
                ),
                const SizedBox(width: 8),
                Text(
                  'Teleop Engaged',
                  style: TextStyle(
                    color: _engaged ? whiteT4K : Colors.white54,
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

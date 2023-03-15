import { StyleSheet } from 'react-native';

import { Text, View } from '../../components/Themed';
import {PitScouting} from "../../models/PitScouting";
import {useEffect, useState} from "react";
import {DatabaseService} from "../../services/DatabaseService";

export default function PitScoutingList() {
  const [pitScoutingEntries, setPitScoutingEntries] = useState<PitScouting[]>([]);

  useEffect(() => {
    setPitScoutingEntries(DatabaseService.findAllPitScoutingEntries());
    }, []
  );

  return (
    <View style={styles.container}>
        <Text style={styles.title}>{pitScoutingEntries.length}</Text>
        {
          pitScoutingEntries.map((pitScouting: PitScouting, index: number) => {
            return <Text key={index} style={styles.title}>{pitScouting.teamNumber}</Text>
          })
        }
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    alignItems: 'center',
    justifyContent: 'center',
  },
  title: {
    fontSize: 20,
    fontWeight: 'bold',
  },
  separator: {
    marginVertical: 30,
    height: 1,
    width: '80%',
  },
});

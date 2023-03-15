import { StyleSheet } from 'react-native';

import { Text, View } from '../components/Themed';
import { useEffect, useState } from "react";
import { BarCodeScanner } from "expo-barcode-scanner";
import { useRouter } from "expo-router";
import { PitScouting } from "../models/PitScouting";
import { TeamScouting } from "../models/TeamScouting";
import {DatabaseService} from "../services/DatabaseService";
import {NavigationActions} from "react-navigation";

export default function ScannerScreen() {
  const router = useRouter();
  const [hasPermission, setHasPermission] = useState<boolean | null>(null);
  const [scanned, setScanned] = useState(false);

  useEffect(() => {
    const getBarCodeScannerPermissions = async () => {
      const { status } = await BarCodeScanner.requestPermissionsAsync();
      setHasPermission(status === 'granted');
    };

    getBarCodeScannerPermissions().then(() => { /* ignore */});
  }, []);

  // @ts-ignore
  const handleBarCodeScanned = ({type, data}) => { // ignore type, get data (contains scouting info)
    setScanned(true);
    const model = getModel(data);

    // navigate to the correct page
    if (model != null) {
      if ("practice" in model) {
        // team scouting

        router.push('(tabs)/TeamScoutingList'); // props {model: model}

        // select TeamScoutingList tab
      } else {
        // pit scouting
        DatabaseService.savePitScoutingSheet(model);

        router.push('(tabs)/PitScoutingList'); // props {model: model}
      }
    }
  };

  if (hasPermission === null) {
    return <Text>Requesting for camera permission</Text>;
  }
  if (!hasPermission) {
    return <Text>No access to camera</Text>;
  }

  const getModel = (data: string) : PitScouting | TeamScouting | null  => {
    let pitScouting: PitScouting | null = null;
    let teamScouting: TeamScouting | null = null;

    try {
      pitScouting = Object.assign({}, JSON.parse(data));
      teamScouting = Object.assign({}, JSON.parse(data));
    } catch (typeError) {
      // console.log(typeError);
    }

    return pitScouting != null ? pitScouting : teamScouting;
  }

  return (
    <View style={styles.container}>
      <BarCodeScanner
          onBarCodeScanned={scanned ? undefined : handleBarCodeScanned}
          style={StyleSheet.absoluteFillObject}
          barCodeTypes={['org.iso.QRCode']}
      />
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

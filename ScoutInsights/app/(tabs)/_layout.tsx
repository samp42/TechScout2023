import { Link, Tabs } from 'expo-router';
import { Pressable, useColorScheme } from 'react-native';
import { AntDesign, MaterialCommunityIcons } from '@expo/vector-icons';
import Colors from "../../constants/Colors";
import { DarkTheme, DefaultTheme } from "@react-navigation/native";

/**
 * You can explore the built-in icon families and icons on the web at https://icons.expo.fyi/
 */
export default function TabLayout() {
  const colorScheme = useColorScheme();
  // const

  const qrButton = () => (
          <Link href="/scanner" asChild>
              <Pressable>
                  {({ pressed }) => (
                      <AntDesign
                          name="qrcode"
                          size={24}
                          color={ colorScheme === 'dark' ? DarkTheme.colors.text : DefaultTheme.colors.text }
                          style={{ marginRight: 15, opacity: pressed ? 0.5 : 1 }}
                      />
                  )}
              </Pressable>
          </Link>
      );

  return (
    <Tabs
      screenOptions={{
        tabBarActiveTintColor: Colors[colorScheme ?? 'light'].tint,
      }}>
      <Tabs.Screen
        name="PitScoutingList"
        options={{
          title: 'Pit Scouting',
          tabBarIcon: ({ color }) => <MaterialCommunityIcons name="robot" size={24} color={color} />,
          headerRight: qrButton
        }}
      />
      <Tabs.Screen
        name="TeamScoutingList"
        options={{
          title: 'Team Scouting',
          tabBarIcon: ({ color }) => <AntDesign name="team" size={24} color={color} />,
            headerRight: qrButton
        }}
      />
    </Tabs>
  );
}

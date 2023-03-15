import * as SQLite from "expo-sqlite";
import { PitScouting } from "../models/PitScouting";

export class DatabaseService {
    private static instance?: DatabaseService;
    private static created: boolean = false;

    private constructor() { }

    private getDatabase(): SQLite.WebSQLDatabase {
        const db = SQLite.openDatabase("scout_insights.db");

        if (!DatabaseService.created) {
            DatabaseService.initDb(db);
        }

        return db;
    }

    private static getInstance(): DatabaseService {
        if (!DatabaseService.instance) {
            DatabaseService.instance = new DatabaseService();
        }

        return DatabaseService.instance;
    }

    private static initDb(db: SQLite.WebSQLDatabase): void {
        db.transaction(tx => {
            tx.executeSql(
                "CREATE TABLE IF NOT EXISTS pit_scouting (" +
                "team_number INTEGER PRIMARY KEY NOT NULL, " +
                "scout_name TEXT NOT NULL, " +
                "driver_experience TEXT NOT NULL, " +
                "weight INTEGER NOT NULL, " +
                "width INTEGER NOT NULL, " +
                "length INTEGER NOT NULL, " +
                "drive_base_type TEXT NOT NULL, " +
                "stable INTEGER NOT NULL, " +
                "has_seperate_intake INTEGER NOT NULL, " +
                "can_intake_cone INTEGER NOT NULL, " +
                "can_intake_cube INTEGER NOT NULL, " +
                "pickup_spots_cube TEXT NOT NULL, " +
                "pickup_spots_cone TEXT NOT NULL, " +
                "intake_cone_orientations TEXT NOT NULL, " +
                "game_pieces_notes TEXT, " +
                "grid_scoring_levels_cube TEXT NOT NULL, " +
                "grid_scoring_levels_cone TEXT NOT NULL, " +
                "scoring_notes TEXT, " +
                "charging_station_notes TEXT);"
            );
        });
        DatabaseService.created = true;
    }

    public static savePitScoutingSheet(sheet: PitScouting): void {
        DatabaseService.getInstance().getDatabase().transaction(tx => {
            tx.executeSql(
                "INSERT INTO pit_scouting values (" +
                "?," + // team_number
                "?," + // scout_name
                "?," + // driver_experience
                "?," + // weight
                "?," + // width
                "?," + // length
                "?," + // drive_base_type
                "?," + // stable
                "?," + // has_separate_intake
                "?," + // can_intake_cone
                "?," + // can_intake_cube
                "?," + // pickup_spots_cube
                "?," + // pickup_spots_cone
                "?," + // intake_cone_orientations
                "?," + // game_pieces_notes
                "?," + // grid_scoring_levels_cube
                "?," + // grid_scoring_levels_cone
                "?," + // scoring_notes
                "?);", // charging_station_notes
                [
                    sheet.teamNumber,
                    sheet.scoutName,
                    sheet.driverExperience,
                    sheet.weight,
                    sheet.width,
                    sheet.length,
                    sheet.driveBaseType,
                    sheet.stable ? 1 : 0,
                    sheet.hasSeparateIntake ? 1 : 0,
                    sheet.canIntakeCone ? 1 : 0,
                    sheet.canIntakeCube ? 1 : 0,
                    sheet.pickupSpotsCube,
                    sheet.pickupSpotsCone,
                    sheet.intakeConeOrientations.join(","),
                    sheet.gamePiecesNotes,
                    sheet.gridScoringLevelsCube.join(","),
                    sheet.gridScoringLevelsCone.join(","),
                    sheet.scoringNotes,
                    sheet.chargingStationNotes
                ]
            );
        });
    }

    public static findAllPitScoutingEntries() : PitScouting[] {
        let entries : PitScouting[] = [];

        // DatabaseService.getInstance().getDatabase().transaction(tx => {
        //     tx.executeSql(
        //         "SELECT * FROM pit_scouting;",
        //         [],
        //         (_, { rows }) => {
        //             // alert(JSON.stringify(rows));
        //         }
        //     );
        // });

        DatabaseService.getInstance().getDatabase().transaction(tx => {
            tx.executeSql("select * from pit_scouting", [], (_, { rows }) =>
                rows._array.forEach(row => {
                    entries.push({
                        teamNumber: row.team_number,
                        scoutName: row.scout_name,
                        driverExperience: row.driver_experience,
                        weight: row.weight,
                        width: row.width,
                        length: row.length,
                        driveBaseType: row.drive_base_type,
                        stable: row.stable === 1,
                        hasSeparateIntake: row.has_seperate_intake === 1,
                        canIntakeCone: row.can_intake_cone === 1,
                        canIntakeCube: row.can_intake_cube === 1,
                        pickupSpotsCube: row.pickup_spots_cube,
                        pickupSpotsCone: row.pickup_spots_cone,
                        intakeConeOrientations: row.intake_cone_orientations.split(","),
                        gamePiecesNotes: row.game_pieces_notes,
                        gridScoringLevelsCube: row.grid_scoring_levels_cube.split(","),
                        gridScoringLevelsCone: row.grid_scoring_levels_cone.split(","),
                        scoringNotes: row.scoring_notes,
                        chargingStationNotes: row.charging_station_notes
                    });
                }
            ));
        });

        console.log(entries);

        return entries;
    }

    public static countPitScoutingEntries() : string[] {
        let count : string[] = [];

        DatabaseService.getInstance().getDatabase().transaction(tx => {
            tx.executeSql(
                "SELECT COUNT(*) FROM pit_scouting;",
                [],
                (_, { rows }) => {
                    count = rows.item(0);
                }
            );
        });

        DatabaseService.getInstance().getDatabase().transaction(tx => {
            tx.executeSql(
                "SELECT \n" +
                "    name\n" +
                "FROM \n" +
                "    sqlite_schema\n" +
                "WHERE \n" +
                "    type ='table' AND \n" +
                "    name NOT LIKE 'sqlite_%';",
                [],
                (_, { rows }) => {
                    count = rows.item(0);
                }
            );
        });

        return count;
    }

}

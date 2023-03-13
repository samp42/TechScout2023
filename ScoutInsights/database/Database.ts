import * as SQLite from "expo-sqlite";
import { PitScouting } from "../models/PitScouting";

export class Database {
    private static instance?: Database;
    private static created: boolean = false;

    private constructor() { }

    private getDatabase(): SQLite.WebSQLDatabase {
        const db = SQLite.openDatabase("scout_insights.db");

        if (!Database.created) {
            this.initDb(db);
        }

        return db;
    }

    private static getInstance(): Database {
        if (!Database.instance) {
            Database.instance = new Database();
        }

        return Database.instance;
    }

    private initDb(db: SQLite.WebSQLDatabase): void {
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
        Database.created = true;
    }

    public savePitScoutingSheet(sheet: PitScouting): void {
        // Database.getInstance().getDatabase().transaction(tx => {
        //     tx.executeSql(
        //         "INSERT INTO pit_scouting (team_number, scout_name, driver_experience, weight, width, length, drive_base_type, stable, has_seperate_intake, can_intake_cone, can_intake_cube, pickup_spots_cube, pickup_spots_cone, intake_cone_orientations, game_pieces_notes, grid_scoring_levels_cube, grid_scoring_levels_cone, scoring_notes, charging_station_note

    }

}

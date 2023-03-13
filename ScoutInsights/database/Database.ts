import * as SQLite from "expo-sqlite";
import { PitScouting } from "../models/PitScouting";

export class Database {
    private static instance?: Database;

    private constructor() { }

    private getDatabase(): SQLite.WebSQLDatabase {
        const db = SQLite.openDatabase("scout_insights.db");
        return db;
    }

    private static getInstance(): Database {
        if (!Database.instance) {
            Database.instance = new Database();
        }

        return Database.instance;
    }

    private initDb(): void {

    }

    public savePitScoutingSheet(sheet: PitScouting): void {
        Database.getInstance().getDatabase().transaction
    }

}

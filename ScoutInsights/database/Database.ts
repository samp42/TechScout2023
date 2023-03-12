import * as SQLite from "expo-sqlite";

export class Database {
    private static instance?: Database;

    private constructor() { }

    private getDatabase(): SQLite.WebSQLDatabase {
        const db = SQLite.openDatabase("scout_insights.db");
        return db;
    }

    public static getInstance(): Database {
        if (!Database.instance) {
            Database.instance = new Database();
        }
        return Database.instance;
    }

}

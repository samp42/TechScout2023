//
//  PitScoutinSheet.swift
//  ScoutInsights
//
//  Created by Samuel Proulx on 2023-01-17.
//

import RealmSwift

class Robot: Object {
    @Persisted(primaryKey: true) var _id: ObjectId
    @Persisted var teamNumber: Int
}

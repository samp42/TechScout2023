//
//  PitScoutinSheet.swift
//  ScoutInsights
//
//  Created by Samuel Proulx on 2023-01-17.
//

import RealmSwift

class PitScoutingSheet: Object {
    @Persisted(primaryKey: true) var _id: ObjectId
    @Persisted var teamNumber: Int
}

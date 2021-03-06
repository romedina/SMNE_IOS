//
//  ObservationSchema.swift
//  SMNEApp
//
//  Created by Guillermo Saavedra Dorantes on 01/03/21.
//

import Foundation
import FirebaseFirestore

struct ObservationSchema {
    var createdAt: Timestamp
    var content: String
}

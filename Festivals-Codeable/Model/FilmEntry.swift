//
//  Film Entry.swift
//  Festivals-Codeable
//
//  Created by Ryan Nguyen on 2/7/19.
//  Copyright © 2019 Danh Phu Nguyen. All rights reserved.
//

import UIKit

struct FilmEntry {
    var firstActor: String
    var locations: String
    var releaseYear: String
    var title: String
}

extension FilmEntry {
    
    init?(json: [String: Any]) {
        guard let locations = json["locations"] as? String,
            let a1 = json["actor_1"] as? String,
            let year = json["release_year"] as? String,
            let title = json["title"] as? String
        else {
            return nil
        }
        self.firstActor = a1
        self.releaseYear = year
        self.title = title
        self.locations = locations
    }
}


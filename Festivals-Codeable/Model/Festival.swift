//
//  Festival.swift
//  Festivals-Codeable
//
//  Created by Ryan Nguyen on 2/7/19.
//  Copyright © 2019 Danh Phu Nguyen. All rights reserved.
//

import Foundation

struct Participant{
    let name: String
    let id: String
}

struct City {
    let name: String
    let id: String
}

enum FestivalType {
    case music
    case food
    case cinema
}

struct Festival {
    let date: Date
    let name: String
    let city: City
    let lineup: [Participant]
    let type: FestivalType
}


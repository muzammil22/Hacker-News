//
//  PostData.swift
//  H4X0R News
//
//  Created by Muzammil Muneer on 07/04/2020.
//  Copyright © 2020 Muzammil Muneer. All rights reserved.
//

import Foundation

struct Result: Decodable {
    let hits: [Post]
}


struct Post: Decodable, Identifiable {
    var id: String {
        return objectID
    }
    let points: Int
    let title: String
    let url: String?
    let objectID: String
}

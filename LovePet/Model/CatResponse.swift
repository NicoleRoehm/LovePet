//
//  CatResponse.swift
//  LovePet
//
//  Created by Nicole Röhm on 28.06.23.
//

import Foundation

struct CatResponse: Codable, Hashable{
    
    var results: [Cats]
}

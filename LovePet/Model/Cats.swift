//
//  Cats.swift
//  LovePet
//
//  Created by Nicole Röhm on 28.06.23.
//

import Foundation

struct Cats: Codable, Hashable{
    
    var id: String
    var name: String
    
    static var dummyCat = Cats(id: "1", name: "Miezi")
}

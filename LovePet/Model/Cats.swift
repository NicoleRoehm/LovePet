//
//  Cats.swift
//  LovePet
//
//  Created by Nicole Röhm on 28.06.23.
//

import Foundation

struct Cats: Codable, Hashable{
    
    
    var name: String
    
    static var dummyCat = Cats(name: "Miezi")
}

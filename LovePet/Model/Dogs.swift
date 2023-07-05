//
//  Dogs.swift
//  LovePet
//
//  Created by Nicole Röhm on 28.06.23.
//

import Foundation

struct Dogs: Codable, Hashable{
    
    var id: String
    var name: String
    
    static var dummyDog = Dogs(id: "1", name: "Peanut")
}

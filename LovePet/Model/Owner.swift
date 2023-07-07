//
//  Owner.swift
//  LovePet
//
//  Created by Nicole Röhm on 07.07.23.
//

import Foundation

struct Owner: Codable, Hashable{
    
    var name: String
    var pets: [Pets]
    
}

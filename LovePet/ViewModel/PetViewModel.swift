//
//  PetViewModel.swift
//  LovePet
//
//  Created by Nicole Röhm on 10.07.23.
//

import Foundation
import CoreData

class PetViewModel: ObservableObject{
    
    let persistentContainer: NSPersistentContainer
    
    @Published var savedPets : [Pets] = []
    
    init(){
        
        persistentContainer = NSPersistentContainer(name: "OwnerModel")
        
        persistentContainer.loadPersistentStores{description, error in
            if let error = error{
                fatalError("CoreData store failed: \(error.localizedDescription)")
            }
            
        }
    }
    
    func fetchPets(){
        
        let request = NSFetchRequest<Pets>(entityName: String(describing: Pets.self))
        
        do{
            savedPets = try persistentContainer.viewContext.fetch(request)
            
        }catch{
            print("Error fetching: \(error.localizedDescription)")
        }
    }
    
    func createNewPets(_ pets:Pets, age: String, name:String, gender:String, description:String, race: String, descriptions:String ){
        
        let newPet = Pets(context: persistentContainer.viewContext)
        
        newPet.name = name
        newPet.age = age
        newPet.race = race
        newPet.gender = gender
        newPet.descriptions = descriptions
        
        do{
            try persistentContainer.viewContext.save()
            fetchPets()
        }catch{
            print("Error with saving: \(error.localizedDescription)")
        }
    }
    
}

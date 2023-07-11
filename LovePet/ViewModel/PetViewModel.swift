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
    
    func updatePet(pet: Pets){
        
        let pets = pet.name
        let newPet = pets
        pet.name = newPet
        
        do{
            try persistentContainer.viewContext.save()
            fetchPets()
        }catch{
            print("Updating Error:\(error.localizedDescription)")
            
        }
        
    }
    
    func deletePet(indexSet:IndexSet){
        guard let index = indexSet.first else{
            print("Index not found")
            return
        }
        let petToDelete = savedPets[index]
        persistentContainer.viewContext.delete(petToDelete)
        
        do{
            try persistentContainer.viewContext.save()
            fetchPets()
        }catch{
            print("Error with delete: \(error.localizedDescription)")
        }
        
    }
    
    func fetchPetbyName(by name: String){
        
        let request = NSFetchRequest<Pets>(entityName: String(describing: Pets.self))
        let namePredicate = NSPredicate(format: "name == %@", name)
        request.predicate = namePredicate
        
        do{
            savedPets = try persistentContainer.viewContext.fetch(request)
            
        }catch{
            print("Error while fetching and filtering:\(error.localizedDescription)")
        }
    }
    
}

//
//  MainViewModel.swift
//  LovePet
//
//  Created by Nicole Röhm on 28.06.23.
//

import Foundation
import CoreData

@MainActor
class OwnerViewModel: ObservableObject{
    
     let persistentContainer: NSPersistentContainer
    
    @Published var savedOwner: [Owner] = []
    @Published var savedPets : [Pets] = []
    
    init(){
        persistentContainer = NSPersistentContainer(name: "OwnerModel")
        
        persistentContainer.loadPersistentStores{description, error in
            if let error = error{
                fatalError("CoreData store failed: \(error.localizedDescription)")
            }
            
        }
        createOwner(name: "Mike")
        createOwner(name: "Maax")
        createOwner(name: "Manuela")
        fetchOwners()
        fetchPets()
        
    }
    
    func fetchOwners(){
        
        let request = NSFetchRequest<Owner>(entityName: String(describing: Owner.self))
        
        do{
            savedOwner = try persistentContainer.viewContext.fetch(request)
            
        }catch{
            print("Error fetching: \(error.localizedDescription)")
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
    func createOwner(name:String){
        
        let newOwner = Owner(context: persistentContainer.viewContext)
        
        newOwner.name = name
        newOwner.id = UUID()
        
        do{
            try persistentContainer.viewContext.save()
            fetchOwners()
        }catch{
            print("Error with saving: \(error.localizedDescription)")
        }
    }
    
    func createNewPets(age: String, name:String, gender:String, description:String, race: String, descriptions:String, ownerId: UUID ){
        
        let newPet = Pets(context: persistentContainer.viewContext)
        
        newPet.name = name
        newPet.age = age
        newPet.race = race
        newPet.gender = gender
        newPet.descriptions = descriptions
        newPet.ownerId = ownerId
        
        do{
            try persistentContainer.viewContext.save()
            fetchPets()
        }catch{
            print("Error with saving: \(error.localizedDescription)")
        }
    }
    
    func updateOwner(owner: Owner){
        
        let owners = owner.name
        let newOwner = owners
        owner.name = newOwner
        
        do{
            try persistentContainer.viewContext.save()
            fetchOwners()
        }catch{
            print("Updating Error. \(error.localizedDescription)")
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
    
    func deleteOwners(indexSet: IndexSet){
        guard let index = indexSet.first else{
            print("Index not found")
            return
        }
        let ownersToDelete = savedOwner[index]
        let petToDelete = savedPets[index]
        persistentContainer.viewContext.delete(petToDelete)
        persistentContainer.viewContext.delete(ownersToDelete)
        
        do{
            try persistentContainer.viewContext.save()
            fetchOwners()
            fetchPets()
        }catch{
            print("Error with delete: \(error.localizedDescription)")
        }
    }
    
    func fetchOwnersbyName(by name: String){
        let request = NSFetchRequest<Owner>(entityName: String(describing: Owner.self))
        let namePredicate = NSPredicate(format: "name == %@", name)
        request.predicate = namePredicate
        
        do{
            savedOwner = try persistentContainer.viewContext.fetch(request)
            
        }catch{
            print("Error while fetching and filtering: \(error.localizedDescription)")
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

//
//  MainViewModel.swift
//  LovePet
//
//  Created by Nicole Röhm on 28.06.23.
//

import Foundation
import CoreData

class OwnerViewModel: ObservableObject{
    
    let persistentContainer: NSPersistentContainer
    
    @Published var savedOwner: [Owner] = []
    
    init(){
        persistentContainer = NSPersistentContainer(name: "OwnerModel")
        
        persistentContainer.loadPersistentStores{description, error in
            if let error = error{
                fatalError("CoreData store failed: \(error.localizedDescription)")
            }
            
        }
    }
    
    func fetchOwners(){
        
        let request = NSFetchRequest<Owner>(entityName: String(describing: Owner.self))
        
        do{
            savedOwner = try persistentContainer.viewContext.fetch(request)
            
        }catch{
            print("Error fetching: \(error.localizedDescription)")
        }
    }
    
    func createOwner(_ owner:Owner, name:String){
        
        let newOwner = Owner(context: persistentContainer.viewContext)
        
        newOwner.name = name
        
        
    }
}

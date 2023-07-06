//
//  DogApiViewModel.swift
//  LovePet
//
//  Created by Nicole Röhm on 28.06.23.
//

import Foundation
import SwiftUI

class DogApiService: ObservableObject{
    
    @Published var dogs = [Dogs]()
    
    func fetchDogs(){
       
          guard let url = URL(string: "https://api.thedogapi.com/v1/breeds?api_key=\(API_KEY_DOG)")
            else{
              print("Error forming URL")
          
            return
        }
        
        let task = URLSession.shared.dataTask(with: url){ data, _, error in
            
            guard let data = data, error == nil else{
                print (error as Any)
                return
            }
            do{
                let response = try JSONDecoder().decode([Dogs].self, from: data)
                
                DispatchQueue.main.async{
                    response.forEach{ dog in self.dogs.append(dog)}
                   // self.dogs = dogs.name
                    print(self.dogs)
                }
                
            }catch{
                print(error)
            }
        }
        
        task.resume()
        }
    
    }


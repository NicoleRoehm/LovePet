//
//  DogApiViewModel.swift
//  LovePet
//
//  Created by Nicole Röhm on 28.06.23.
//

import Foundation
import SwiftUI

class DogApiViewModel: ObservableObject{
    
    @Published var dogs = [Dogs]()
    
    func fetchDogs(){
        
        guard let url = URL(string: "https://api.thedogapi.com/v1/breeds")
        else{
            print("Error forming URL")
            return
        }
        
        let task = URLSession.shared.dataTask(with: url){ data, resCode, error in
            print(resCode)
            guard let data = data, error == nil else{
                print (error as Any)
                return
            }
            do{
                let dogs = try JSONDecoder().decode(DogResponse.self, from: data)
                
                DispatchQueue.main.async{
                    self.dogs = dogs.results
                    print(self.dogs)
                }
                
            }catch{
                print(error)
            }
        }
        task.resume()
    }
}

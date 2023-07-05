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
        func creat_raw_url() -> String{
            let base_url = URL(string: "https://api.thedogapi.com/v1/breeds")
            
            return "\(String(describing: base_url))" + API_KEY_DOG
        }
        let raw_url = creat_raw_url()
        let encoded_url = raw_url.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        
        guard encoded_url != nil, let url = URL(string: encoded_url!) else {
            print("Failed to create the URL from the rate")
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


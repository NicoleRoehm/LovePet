//
//  CatApiViewModel.swift
//  LovePet
//
//  Created by Nicole Röhm on 28.06.23.
//

import Foundation

class CatApiViewModel: ObservableObject{
    
    @Published var cats = [Cats]()
    
    func fetchCats(){
        
        guard let url = URL(string: "https://api.thecatapi.com/v1/breeds")
        else{
            print("Error forming URL")
            return
        }
        let task = URLSession.shared.dataTask(with: url){ data, resCode, error in
            print(resCode)
            guard let data = data , error == nil else{
                print(error as Any)
                return
            }
            do{
                let cats = try JSONDecoder().decode(CatResponse.self, from: data)
                
                DispatchQueue.main.async {
                    self.cats = cats.results
                    print(self.cats)
                }
            }catch{
                print(error)
            }
        }
        task.resume()
    }
}

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
        func create_raw_url() -> String{
            
            let base_url = URL(string: "https://api.thecatapi.com/v1/breeds")
        
            return "\(String(describing: base_url))" + API_KEY_CAT
            }
        let raw_url = create_raw_url()
        let encoded_url = raw_url.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        
        guard encoded_url != nil, let url = URL(string: encoded_url!) else{
            print("Failed to create a URL from Race")
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


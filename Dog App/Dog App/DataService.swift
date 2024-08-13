//
//  DataService.swift
//  Dog App
//
//  Created by Lesley Lopez on 8/13/24.
//

import Foundation

struct DataService {
    
    func getDogs() async -> String{
        
        //URL
        if let url = URL(string: "https://dog.ceo/api/breeds/image/random"){
            
            //URL REQUEST
            let request = URLRequest(url: url)
            
             //URL SESSION
            
            do {
                let (data, response) = try await URLSession.shared.data(for:request)
                
                //Parse the data
                let decoder = JSONDecoder()
                let dogImage = try decoder.decode(Dog.self, from: data)
                
                return (dogImage.message ?? "")
                
            } catch {
                return ("error")
            }
           
            
        } else {
            return ( "error" )
        }
       
    }
}

//
//  DogImageView.swift
//  Dog App
//
//  Created by Lesley Lopez on 8/13/24.
//

import SwiftUI

struct DogImageView: View {
    let imageURL : String
    
    var body: some View {
        
        
        AsyncImage(url: URL(string: imageURL)) { phase in
            
            if let image = phase.image {
                
                image
                    .resizable()
                    .scaledToFit()
                
            } else if phase.error != nil {
                
                Text("Failed to load image")
                
            } else {
                ProgressView()
            }
            
        }
        .frame(width: 400, height: 400)
        
    }
    
}
   
#Preview {
    DogImageView(imageURL: "https://images.dog.ceo/breeds/hound-blood/n02088466_9237.jpg")
}

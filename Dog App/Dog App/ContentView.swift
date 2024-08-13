//
//  ContentView.swift
//  Dog App
//
//  Created by Lesley Lopez on 8/13/24.
//

import SwiftUI

struct ContentView: View {
    
    @State var dogURL = ""
    var dataService = DataService()
    
    
    var body: some View {
        
        ZStack{
            Color(red: 244/255, green: 194/255, blue: 194/255)
            VStack {
                
                Text("Who let the dogs out?!")
                    .foregroundStyle(.white)
                    .bold()
                    .font(.title)
                
                if dogURL == "" {
                    Image("Stormi Lopez")
                        .resizable()
                        .scaledToFit()
                } else {
                    DogImageView(imageURL: dogURL)
                }
                
                
                Button(action: {
                    Task{
                        dogURL = await dataService.getDogs()
                    }
                }, label: {
                    HStack{
                        Text("Doggo ")
                        Image(systemName: "pawprint.fill")
                    }
                    .padding(.horizontal)
                    .padding(.vertical, 8)
                    .background(.white)
                    .clipShape(RoundedRectangle(cornerSize: CGSize(width: 25, height: 25)))
                    
                })
                .padding()
            }
        }
        .ignoresSafeArea()

    }
}

#Preview {
    ContentView()
}

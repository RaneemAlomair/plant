//
//  ContentView.swift
//  plant
//
//  Created by Raneem Alomair on 25/04/1446 AH.
//

import SwiftUI

struct MyPlantsView: View {
    @State private var isSheetPresented = false // To track sheet
    //@ObservedObject var plantViewModel: PlantViewModel
    
    var body: some View {
        NavigationStack{
            VStack {
                // Title and icon
                Text("My Plants 🌱")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity, alignment: .leading) // Left align text
                    .padding(.top, 20)
                
                Divider()
                    .background(Color.white)
                
                Spacer()
                
                // Plant image
                Image("planto1")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 200, height: 200)
                
                // Subtitle text
                Text("Start your plant journey!")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .padding(.top, 20)
                
                // Description text
                Text("Now all your plants will be in one place and we will help you take care of them ;)🪴")
                
                    .font(.body)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 33.0)
                    .padding(.top, 10)
                    .foregroundColor(.gray)
                
                
                Spacer()
                
                // Set Plant Reminder button
                Button(action: {
                    // Add action for the button
                    isSheetPresented.toggle()
                }) {
                    Text("Set Plant Reminder")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(width: 280, height: 50)
                        .background(Color.green1)
                        .cornerRadius(10)
                }
                
                .sheet(isPresented: $isSheetPresented) {
                    // Sheet content is the ReminderView
                    //ReminderView()
                }
                
                .padding(.bottom, 100)
            }
            //.background(Color.black.edgesIgnoringSafeArea(.all)) // Set background color
            //.foregroundColor(.white) // Set foreground color
            
        }
    }}

#Preview {
    MyPlantsView()
}

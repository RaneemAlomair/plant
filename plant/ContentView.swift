//
//  SwiftUIView2.swift
//  plant
//
//  Created by Raneem Alomair on 25/04/1446 AH.
//

import SwiftUI

struct ContentView: View {
    @StateObject var plantViewModel = PlantViewModel()
    @State private var isSheetPresented = false

    var body: some View {
        NavigationView {
            VStack {
                Text("My Plants 🌱")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.top, -6)

                Divider()
                
                Text("Today")
                    .font(.title)
                    .bold()
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                ScrollView {
                    ForEach($plantViewModel.Plants) { $plant in
                        HStack {
                            Button(action: {
                                plant.isWatered.toggle()
                            }) {
                                Image(systemName: plant.isWatered ? "checkmark.circle.fill" : "circle")
                                    .foregroundColor(plant.isWatered ? .green1 : .gray)
                                    .font(.title)
                            }
                            
                            VStack(alignment: .leading) {
                                Label("in \(plant.location)", systemImage: "location")
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                                Text(plant.name)
                                    .font(.headline)
                                HStack {
                                    Label(plant.sunlight, systemImage: "sun.max.fill")
                                        .foregroundColor(.yellow)
                                    Label(plant.waterAmount, systemImage: "drop.fill")
                                        .foregroundColor(.blue)
                                }
                                .font(.caption)
                            }
                            
                            Spacer()
                        }
                        .padding(.vertical, 4)
                    }
                }
                
                Spacer()
                
                Button(action: {
                    isSheetPresented.toggle()
                }) {
                    HStack {
                        Image(systemName: "plus.circle.fill")
                        Text("New Reminder")
                        
                    }
                    .font(.title2)
                    .foregroundColor(.green1)
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
                .padding()
                .sheet(isPresented: $isSheetPresented) {
                    ReminderView(plantViewModel: plantViewModel, isSheetPresented: $isSheetPresented)
                }
            }
            .padding()
            
        }
    }
}

#Preview {
    ContentView()
}


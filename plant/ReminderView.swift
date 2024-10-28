//
//  SwiftUIView.swift
//  plant
//
//  Created by Raneem Alomair on 25/04/1446 AH.
//

import SwiftUI

struct ReminderView: View {
    @ObservedObject var plantViewModel: PlantViewModel
    @Binding var isSheetPresented: Bool
    
    @State private var plantName: String = ""
    @State private var selectedRoom = "Bedroom"
    @State private var selectedLight: LightCondition = .fullSun
    @State private var selectedWateringDay = "Every day"
    @State private var selectedWaterAmount = "20-50 ml"
    
    private let roomOptions = ["Bedroom", "Living Room", "Kitchen", "Balcony", "Bathroom"]
    private let WateringDaysOptions = ["Every day", "Every 2 days", "Every 3 days", "Once a week", "Every 10 days", "Every 2 weeks"]
    private let WaterOptions = ["20-50 ml", "50-100 ml", "100-200 ml", "200-300 ml"]
    
    enum LightCondition: String, CaseIterable {
        case fullSun = "Full Sun"
        case partialSun = "Partial Sun"
        case lowLight = "Low Light"
        
        var icon: String {
            switch self {
            case .fullSun:
                return "sun.max"
            case .partialSun:
                return "cloud.sun"
            case .lowLight:
                return "moon"
            }
        }
    }
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Text("Plant Name")
                    TextField("Pothos", text: $plantName)
                }
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(10)
                .padding(.horizontal)
                
                VStack {
                    HStack {
                        Label("Room", systemImage: "location")
                        Spacer()
                        Picker("Room", selection: $selectedRoom) {
                            ForEach(roomOptions, id: \.self) { room in
                                Text(room).tag(room)
                            }
                        }
                        .pickerStyle(MenuPickerStyle())
                        .tint(.gray)
                    }
                    
                    HStack {
                        Label("Light", systemImage: selectedLight.icon)
                        Spacer()
                        Picker("Light", selection: $selectedLight) {
                            ForEach(LightCondition.allCases, id: \.self) { light in
                                Text(light.rawValue).tag(light)
                            }
                        }
                        .pickerStyle(MenuPickerStyle())
                        .tint(.gray)
                    }
                }
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(10)
                .padding(.horizontal)
                
                VStack {
                    HStack {
                        Label("Watering Days", systemImage: "drop")
                        Spacer()
                        Picker("WateringDay", selection: $selectedWateringDay) {
                            ForEach(WateringDaysOptions, id: \.self) { WateringDay in
                                Text(WateringDay).tag(WateringDay)
                            }
                        }
                        .pickerStyle(MenuPickerStyle())
                        .tint(.gray)
                    }
                    HStack {
                        Label("Water", systemImage: "drop")
                        Spacer()
                        Picker("Water", selection: $selectedWaterAmount) {
                            ForEach(WaterOptions, id: \.self) { Water in
                                Text(Water).tag(Water)
                            }
                        }
                        .pickerStyle(MenuPickerStyle())
                        .tint(.gray)
                    }
                }
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(10)
                .padding(.horizontal)

                Spacer()
            }
            .padding()
            .navigationBarTitle("Set Reminder", displayMode: .inline)
            .navigationBarItems(
                leading: Button("Cancel") {
                    isSheetPresented = false
                }.foregroundColor(.green1),
                trailing: Button("Save") {
                    let newPlant = Plant(
                        name: plantName,
                        location: selectedRoom,
                        sunlight: selectedLight.rawValue,
                        waterAmount: selectedWaterAmount,
                        isWatered: false
                    )
                    plantViewModel.addReminder(newPlant)
                    isSheetPresented = false
                }
                .foregroundColor(.green1)
            )
        }
    }
}

#Preview {
    ReminderView(plantViewModel: PlantViewModel(), isSheetPresented: .constant(true))
}

//
//  SwiftUIView3.swift
//  plant
//
//  Created by Raneem Alomair on 25/04/1446 AH.
//

import Foundation

struct Plant: Identifiable {
    let id = UUID()
    let name: String
    let location: String
    let sunlight: String
    let waterAmount: String
    var isWatered: Bool
}

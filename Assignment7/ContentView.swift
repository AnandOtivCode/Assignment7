//
//  ContentView.swift
//  Assignment7
//
//  Created by Anand Otiv on 2025-03-13.
//

import SwiftUI

struct ContentView: View {
    //Form data
    @State private var name = ""
    @State private var email = ""
    @State private var phone = ""
    @State private var numOfCustomers:Double = 1
    
    
    
    var body: some View {
        VStack {
            Section(header: Text("Reservation Form")
                .font(.title2)
                .fontWeight(.heavy)) {
                Divider()
                    //Name Input
                Text("Name")
                TextField(text: $name) {
                    Text("Please enter your name")
                }.textFieldStyle(.roundedBorder)
                    .keyboardType(.numberPad)
                    
                    //Email Input
                    Text("Email")
                    TextField(text: $name) {
                        Text("Please enter your Email")
                    }.textFieldStyle(.roundedBorder)
                        .keyboardType(.numberPad)
                    
                    //Phone Number Input
                    Text("Phone Number")
                    TextField(text: $name) {
                        Text("Please enter your phone number    ")
                    }.textFieldStyle(.roundedBorder)
                        .keyboardType(.numberPad)
                    
                    //Number of Customers Input
                    Text("Number of Customers: \(Int(numOfCustomers))")
                    Slider(value: $numOfCustomers, in: 1...100, step: 1)
                    

                    //Slider(value: $numOfCustomers, in: 0...100,step: 0.5)
                    
                
            }
            
        }
    }
}

#Preview {
    ContentView()
}

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
    @State private var typeMeal = "Lunch"
    
    //Submit Data
    @State private var isAlertShowing = false
    
    
    
    func reserverationMessage() -> String {
        if typeMeal == "Breakfast" {
            return "You have reserved a table for \(Int(numOfCustomers)) people for breakfast."
        } else if typeMeal == "Lunch" {
            return "You have reserved a table for \(Int(numOfCustomers)) people for lunch."
        } else if typeMeal == "Dinner" {
            return "You have reserved a table for \(Int(numOfCustomers)) people for dinner."
        }
            else{
                return "You have reserved a table for \(Int(numOfCustomers)) people."
            }
        }
    
    func isValidData() -> String {
        var alertMessage = ""
        if name.isEmpty {
            alertMessage += "Name is required"
        } else if email.isEmpty {
            alertMessage += "Email is required"
        }
        else if phone.isEmpty {
            alertMessage += "Phone number is required"
        }
        else{
            alertMessage = "Form submitted successfully. "
            alertMessage += reserverationMessage()
        }
        
        return alertMessage
    }
    

    
    
    
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
                    TextField(text: $email) {
                        Text("Please enter your Email")
                    }.textFieldStyle(.roundedBorder)
                        .keyboardType(.numberPad)
                    
                    //Phone Number Input
                    Text("Phone Number")
                    TextField(text: $phone) {
                        Text("Please enter your phone number    ")
                    }.textFieldStyle(.roundedBorder)
                        .keyboardType(.numberPad)
                    
                    //Number of Customers Input
                    Text("Number of Customers: \(Int(numOfCustomers))")
                    Slider(value: $numOfCustomers, in: 1...100, step: 1)
                    
                    //Get breakfast lunch or dinner value
                    Picker("Meal", selection: $typeMeal){
                        Text("Breakfast").tag("Breakfast")
                        Text("Lunch").tag("Lunch")
                        Text("Dinner").tag("Dinner")
                    } .pickerStyle(.segmented)
                    
                    //Submit Button
                    Button("Ok", systemImage: "computermouse.fill"){
                        isAlertShowing.toggle()
                    }.buttonStyle(.borderedProminent)
                        .alert(isValidData(), isPresented: $isAlertShowing) {
                            
                            
                        }
                    

                    
                    
                    
                    
                    
                    
                    
                    
                }
            
        }
    }
}

#Preview {
    ContentView()
}

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
        //        if typeMeal == "Breakfast" {
        //            return "You have reserved a table for \(Int(numOfCustomers)) people for breakfast."
        //        } else if typeMeal == "Lunch" {
        //            return "You have reserved a table for \(Int(numOfCustomers)) people for lunch."
        //        } else if typeMeal == "Dinner" {
        //            return "You have reserved a table for \(Int(numOfCustomers)) people for dinner."
        //        }
        //            else{
        //                return "You have reserved a table for \(Int(numOfCustomers)) people."
        //            }
        
        return ("""
                
                Name: \(name)
                Email: \(email)
                Phone Number: \(phone)
                
                Has reserved \(typeMeal) for \(Int(numOfCustomers)) customers.
                
                """)
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
            alertMessage = "Form submitted successfully."
            alertMessage += reserverationMessage()
        }
        
        return alertMessage
    }
    
    
    
    
    
    var body: some View {
        ScrollView{
            ZStack{
                VStack {
                    Text("Sushi Mart").font(.custom("IndieFlower", size: 60)).fontWeight(.heavy).foregroundColor(Color.red)
                    //Sushi Image
                    Image("sushiPlate").resizable().frame(width: 200, height: 200)
                    Section(header: Text("Reservation Form")
                        .font(.title2)
                        .fontWeight(.heavy)) {
                            Divider()
                            //Name Input
                            Text("Name")
                            TextField(text: $name) {
                                Text("Please enter your name")
                            }.textFieldStyle(.roundedBorder)
                                .keyboardType(.default)
                            //Email Input
                            Text("Email")
                            TextField(text: $email) {
                                Text("Please enter your Email")
                            }.textFieldStyle(.roundedBorder)
                                .keyboardType(.emailAddress)
                            
                            //Phone Number Input
                            Text("Phone Number")
                            TextField(text: $phone) {
                                Text("Please enter your phone number    ")
                            }.textFieldStyle(.roundedBorder)
                                .keyboardType(.numberPad)
                            
                            //Number of Customers Input
                            Text("Number of Customers: \(Int(numOfCustomers))")
                                .fontWeight(.heavy)
                                .foregroundColor(Color.black)
                            Slider(value: $numOfCustomers, in: 1...10, step: 1)
                            
                            //Get breakfast lunch or dinner value
                            Picker("Meal", selection: $typeMeal){
                                Text("Breakfast").tag("Breakfast")
                                Text("Lunch").tag("Lunch")
                                Text("Dinner").tag("Dinner")
                            } .pickerStyle(.segmented).padding()
                        
                            //Submit Button
                            Button("Submit", systemImage: "fork.knife"){
                                isAlertShowing.toggle()
                            }.buttonStyle(.borderedProminent)
                                .alert(isValidData(), isPresented: $isAlertShowing) {
                                    
                                    
                                }
                            
                            
                            
                            
                            
                            
                            
                            
                            
                            
                        }
                }
                
            }
           
        }//Fills the background color
        .background(Color("BackgroundColor").ignoresSafeArea(edges: .all))
        
    }
    
}

#Preview {
    ContentView()
}

//
//  ContentView.swift
//  FormValidation
//
//  Created by Udin Rajkarnikar on 2/14/21.
//

import SwiftUI

struct ContentView: View {
    
    @State var validation = Validation()
    @State var showDatePicker: Bool = false
    var body: some View {
        ZStack {
            VStack{
                EntryField(text: $validation.email, placeholder: "Email", isSecure: false)
                EntryField(text: $validation.password, placeholder: "Password", isSecure: true)
                EntryField(text: $validation.retypePassword, placeholder: "Re-type Password", isSecure: true)
                
                
                
                HStack {
                    
                    Text("Birth Year: ")
                        .fontWeight(.bold)
                    
                    Button(action: {
                        showDatePicker.toggle()
                    }, label: {
                        Text(String(validation.currentDate))
                })
                }.frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal)
                
                
                
             }
            
            if showDatePicker{
                VStack{
                    DatePicker(isDatePickerShown: $showDatePicker, currentDate: $validation.currentDate)
                        .shadow(color: .black, radius: 10, x: 10.0, y: 5.0)
                }.frame(width: 200, height: 200)
            }
        }
         
    }
}

struct EntryField: View {
    @Binding var text: String
    var placeholder: String
    var isSecure: Bool
    var body: some View {
        VStack{
            
            if isSecure {
                SecureField(placeholder, text: $text)
                    .padding()
                    .foregroundColor(.primary)
            } else {
                TextField(placeholder, text: $text)
                    .padding()
                    .foregroundColor(.primary)
            }
        }
    }
}

struct DatePicker: View {
    @Binding var isDatePickerShown: Bool
    @Binding var currentDate: Int
    let year = Calendar.current.component(.year, from: Date())
    var body: some View{
        
       
            ScrollView(showsIndicators: false){
                    VStack{
                        ForEach(((year-100)...year).reversed(), id:\.self) { (y) in
                            Button(action: {
                                isDatePickerShown.toggle()
                                self.currentDate = y
                            }, label: {
                                Text(String(y))
                                    .foregroundColor(Color.white)
                                    .padding(.top, 5)
                            })
                        }
                        
                    }
                }.padding(.horizontal, 30)
                .padding(.vertical, 10)
                .background(Color.gray)
                .cornerRadius(10)
        
            
            
         
     }
}

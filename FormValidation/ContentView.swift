//
//  ContentView.swift
//  FormValidation
//
//  Created by Udin Rajkarnikar on 2/14/21.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var validation = Validation()
    @State var showDatePicker: Bool = false
    var body: some View {
        NavigationView {
            VStack {
                ZStack {
                    VStack{
                        EntryField(text: $validation.email, results: validation.validEmail(), placeholder: "Email", isSecure: false)
                        EntryField(text: $validation.password, results: validation.validPassword(), placeholder: "Password", isSecure: true)
                        EntryField(text: $validation.retypePassword, results: validation.doesPasswordMatchString(), placeholder: "Re-type Password", isSecure: true)
                        VStack {
                            HStack {
                                Text("Birth Year: ")
                                    .fontWeight(.bold)
                                
                                Button(action: {
                                    withAnimation(.linear(duration: 0.15)) {
                                        showDatePicker.toggle()
                                    }
                                }, label: {
                                    Text(String(validation.chosenDate))
                            })
                            }.frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.horizontal)
                            .padding(.top)
                            
                            if !validation.isUserOfSuitableAge(){
                                Text("Must be 18 or older")
                            }
                            
                        }
                        
                        
                        
                     }
                    
                    if showDatePicker{
                        VStack{
                            DatePicker(isDatePickerShown: $showDatePicker, selectedCurrentDate: $validation.chosenDate)
                                .shadow(color: .black, radius: 10, x: 10.0, y: 5.0)
                            }.frame(width: 200, height: 200)
                    }
                }
                
                Spacer()
            
            }.navigationTitle("Form Validation")
            .navigationBarTitleDisplayMode(.large)
        }
         
    }
}

struct EntryField: View {
    @ObservedObject var validation = Validation()
    @Binding var text: String
    var results : String = ""
    var placeholder: String
    var isSecure: Bool
    var body: some View {
        VStack{
            
            if isSecure {
                VStack(alignment: .leading) {
                    SecureField(placeholder, text: $text)
                        .padding()
                        .foregroundColor(.primary)
                    
                        Text(text.isEmpty ? "" : results)
                            .padding(.horizontal)
                            .animation(.spring())
                            .foregroundColor(Color.red)
                    
                    
                        
                }
            } else {
                VStack(alignment: .leading){
                    TextField(placeholder, text: $text)
                        .padding()
                        .foregroundColor(.primary)
                        .autocapitalization(.none)
                    
                    Text(text.isEmpty ? "" : results)
                        .padding(.horizontal)
                        .animation(.spring())
                        .foregroundColor(Color.red)
                }
                
            }
        }
    }
}

struct DatePicker: View {
    @Binding var isDatePickerShown: Bool
    @Binding var selectedCurrentDate: Int
    @ObservedObject var validation = Validation()
    let year = Calendar.current.component(.year, from: Date())
    var body: some View{
        
       
            ScrollView(showsIndicators: false){
                    VStack{
                        ForEach(((year-100)...year).reversed(), id:\.self) { (y) in
                            Button(action: {
                                isDatePickerShown.toggle()
                                self.selectedCurrentDate = y
                                
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

//
//  ContentView.swift
//  Unit Converter
//
//  Created by Aigerim Abitayeva on 27.02.2023.
//

import SwiftUI

struct ContentView: View {
    @State private var unit = "meters"
    @State private var unitTo = "meters"
    @State private var length = 0.0
    @FocusState private var lengthIsFocused: Bool
    
    let units = ["meters", "kilometers", "feet", "yards", "miles"];
    
    var converted : Double {
        var inMeters = 0.0;
        if unit == "meters" {
            inMeters = length;
        } else if unit == "kilometers" {
            inMeters = length/1000;
        } else if unit == "feet" {
            inMeters = length*0.3048;
        } else if unit == "yards" {
            inMeters = length*0.333333;
        } else if unit == "miles" {
            inMeters = length*0.00018939375;
        }
        
        var convUnit = 0.0;
        if unitTo == "meters" {
            convUnit = inMeters;
        } else if unitTo == "kilometers" {
            convUnit = inMeters*1000;
        } else if unitTo == "feet" {
            convUnit = inMeters*3.281;
        } else if unitTo == "yards" {
            convUnit = inMeters*1.094;
        } else if unitTo == "miles" {
            convUnit = inMeters/1609;
        }
        return convUnit;
            
    }
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Length", value: $length, format: .number)
                        .keyboardType(.decimalPad)
                        .focused($lengthIsFocused)
                    
                    Picker("Units", selection: $unitTo) {
                        ForEach(units, id: \.self) {
                            Text($0)
                        }
                    }
                } header: {
                    Text("From: ")
                }
                
                Section {
                    Picker("Units", selection: $unit) {
                        ForEach(units, id: \.self) {
                            Text($0)
                        }
                    } //.pickerStyle(.segmented)
                } header: {
                    Text("To: ")
                }
                
                Section {
                    Text(converted, format: .number)
                }
                .navigationBarTitle("Unit Converter")
                .toolbar {
                    ToolbarItemGroup(placement: .keyboard) {
                        Spacer()
                        Button("Done") {
                            lengthIsFocused = false
                        }
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//
//  AssetCalculatorView.swift
//  Universal-Calculator
//


import SwiftUI

struct AssetCalculatorView: View {
    @State var input1: String = ""
    @State var input2: String = ""
    @State var printCalc = false
    @State var money = "$"

    var calculation: String {
        //check fields for text
        guard input1.isEmpty == false, input2.isEmpty == false else { return "" }

        //check input is a number; else "Error"
        guard let asset = Double(input1), let price  = Double(input2) else { return "Error" }

        let product = asset * price
        return String(format: "%.2f", product)
    }

    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.black, .gray]), startPoint: .topLeading, endPoint: .bottomTrailing)                     .ignoresSafeArea()
                 
        VStack {
            
            
            TextField("Enter Amount of Asset", text: $input1)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
                
            
            TextField("Enter Predicted Future Price", text: $input2)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            
           
            
            Button(action:  {
                
                self.printCalc.toggle()
                
            }) {
                Text("Calculate")
                    .foregroundColor(.white)
                
                
            }
            if printCalc {
                
                Text(calculation)
                    .font(.largeTitle)
                        .foregroundColor(Color.green)
                        .lineSpacing(50)
            }
            
        }
        }
    }
}

struct AssetCalculatorView_Previews: PreviewProvider {
    static var previews: some View {
        AssetCalculatorView()
    }
}

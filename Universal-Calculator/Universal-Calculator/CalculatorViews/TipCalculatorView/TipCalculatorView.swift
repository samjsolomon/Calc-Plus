//
//  TipCalcView.swift
//  Universal-Calculator
//


import SwiftUI

struct TipCalculatorView: View {
    
    //set up values that change
    
    //text inputs must be string
    @State private var billAmount = ""
    @State private var numOfPeople: Double = 2
    @State private var tipPercentage: Double = 20

   
    //tip calculation
    var tipPerPerson:Double{
        //if it cant be a double, = 0
        let orderAmount = Double(billAmount) ?? 0
        return (orderAmount / 100 * tipPercentage)/numOfPeople
    }
    
    //total cost
    var total:Double{
        //if it cant be a double, = 0
        let orderAmount = Double(billAmount) ?? 0
        let tip = orderAmount / 100 * tipPercentage
        
        // grand total divided by number of people
        return (orderAmount + tip) / numOfPeople
    }
    
    var body: some View {
        UITableView.appearance().backgroundColor = .clear

    return ZStack {
            //Background gradient
        LinearGradient(gradient: Gradient(colors: [Color.gray, Color.white]),
                           startPoint: .topLeading,
                           endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Text("Tip Calculator")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
               
                Form {
                    Section(header: Text("Amount")) {
                        //placeholder, binding value
                        TextField("Amount", text: $billAmount)
                            .keyboardType(.decimalPad)
                    }
                    //slider for number of people
                    Section(header: Text("People")){
                        //number of people
                        Slider(value: $numOfPeople, in: 1...50, step: 1)
                        Text("\(numOfPeople, specifier: "%.0f")").font(.system(size: 14))
                    }
                    
                    //slider for tip percentage
                    Section(header: Text("tip")){
                        Slider(value: $tipPercentage, in: 0...50, step: 5)
                        Text("\(tipPercentage, specifier: "%.0f")%").font(.system(size: 14))
                    }
                    //calculated totals
                    Section(header: Text("Tip per person")){
                        Text("$\(tipPerPerson, specifier: "%.2f")")
                    }
                    Section(header: Text("Total per person")){
                        Text("$\(total, specifier: "%.2f")")
                    }
                                
                }
                .background(Color.clear)
                .foregroundColor(Color.black)
                
            }
        }
    }
}

struct TipCalculatorView_Previews: PreviewProvider {
    static var previews: some View {
        TipCalculatorView()
    }
}

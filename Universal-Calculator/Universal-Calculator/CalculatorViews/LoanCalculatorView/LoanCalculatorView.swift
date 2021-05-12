//
//  LoanCalculatorView.swift
//  Universal-Calculator
//


import SwiftUI

struct LoanCalculatorView: View {
    @State var loanTerm = ""
    @State var interestRate = ""
    @State var loanAmount = ""
    
    //Calculate monthly payments
    var monthlyPayment:Double{
        //Make values 0 if not convertible to double
        let loan = Double(loanAmount) ?? 0
        let loanTime = Double(loanTerm) ?? 0.01 //not 0 to avoid division by 0 later
        let interest = Double(interestRate) ?? 0
        let monthlyPay = loan / loanTime
        let loanTimeYears = loanTime / 12
        let interestPay = (loan * interest * loanTimeYears) / loanTime
        
        return monthlyPay + interestPay
    }
    
    //Calculate Total Interest
    var totalInterestPaid:Double{
        //Make values 0 if not convertible to double
        let loan = Double(loanAmount) ?? 0
        let interest = Double(interestRate) ?? 0
        let loanTime = Double(loanTerm) ?? 0
        let loanTimeYears = loanTime / 12
        
        return loan * interest * loanTimeYears

    }

    var body: some View {
        
        UITableView.appearance().backgroundColor = .clear

        return ZStack {
            //Background purple gradient
            LinearGradient(gradient: Gradient(colors: [Color.purple, Color.white]),
                               startPoint: .topLeading,
                               endPoint: .bottomTrailing)
                    .edgesIgnoringSafeArea(.all)
            
            VStack{
                Text("Loan Calculator")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .padding()
                
                Form {
                    HStack {
                        Text("Loan term in months:")
                        TextField("Loan term in months", text: $loanTerm)
                            .keyboardType(.decimalPad)
                    }
                    .padding()
                    
                    HStack {
                        Text("Interest rate in decimal:")
                        TextField("Interest rate", text: $interestRate)
                            .keyboardType(.decimalPad)
                    }
                    .padding()
                    
                    HStack {
                        
                        Text("Loan amount:")
                        TextField("Loan amount", text: $loanAmount)
                            .keyboardType(.decimalPad)
                    }
                    .padding()
                    
                    Section(header: Text("Total interest to be payed")){
                        Text("$\(totalInterestPaid, specifier: "%.2f")")
                    }
                    Section(header: Text("Monthly Payments of")){
                        Text("$\(monthlyPayment, specifier: "%.2f")")
                    }
                }
                .background(Color.clear)
                .foregroundColor(Color.black)
            }
           
        }
    }
}

struct LoanCalculatorView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            LoanCalculatorView()
        }
    }
}






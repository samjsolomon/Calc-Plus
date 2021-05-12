//
//  LoanAmountView.swift
//  Universal-Calculator
//
//  Created by NET on 3/18/21.
//

import SwiftUI

struct LoanAmountView: View {
    @State var loanAmount = ""
    
    var body: some View {
        HStack {
            
            Text("Loan amount:")
            TextField("Loan amount", text: $loanAmount)
                .keyboardType(.decimalPad)
        }
        .padding()
    }
}

struct LoanAmountView_Previews: PreviewProvider {
    static var previews: some View {
        LoanAmountView()
    }
}

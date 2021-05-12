//
//  LoanTermView.swift
//  Universal-Calculator
//
//  Created by NET on 3/18/21.
//

import SwiftUI

struct LoanTermView: View {
    @State var loanTerm = ""
    
    var body: some View {
        HStack {
            Text("Loan term in months:")
            TextField("Loan term in months", text: $loanTerm)
                .keyboardType(.decimalPad)
        }
        .padding()

    }
}


struct LoanTermView_Previews: PreviewProvider {
    static var previews: some View {
        LoanTermView()
    }
}

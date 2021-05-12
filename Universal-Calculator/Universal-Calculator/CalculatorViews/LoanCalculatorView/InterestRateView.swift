//
//  InterestRateView.swift
//  Universal-Calculator
//
//  Created by NET on 3/18/21.
//

import SwiftUI

struct InterestRateView: View {
    @State var interestRate = ""
    var body: some View {
        HStack {
            Text("Interest rate in decimal:")
            TextField("Interest rate", text: $interestRate)
                .keyboardType(.decimalPad)
        }
        .padding()
    }
}


struct InterestRateView_Previews: PreviewProvider {
    static var previews: some View {
        InterestRateView()
    }
}

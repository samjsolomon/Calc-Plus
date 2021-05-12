//
//  GPACalculatorView.swift
//  Universal-Calculator
//

import Combine
import SwiftUI


// Main view for the application
// As of now only displays one semester
// Would like to add the functionality of displaying multiple semesters with an overall GPA

struct GPACalculatorView: View {
    var semester = Semester()
    
    var body: some View {
        
        ZStack{
            LinearGradient(gradient: Gradient(colors: [.black]), startPoint: .topLeading, endPoint: .bottomTrailing)                     .ignoresSafeArea()
            VStack {
                SemesterRow(name: "", grade: "", credits: "")
            }
        }
    }
}



    
struct GPACalculatorView_Previews: PreviewProvider {
    static var previews: some View {
        GPACalculatorView()
            //.colorScheme(.dark)
    }
}


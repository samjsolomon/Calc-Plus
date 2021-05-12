//
//  CalculatorListView.swift
//  Universal-Calculator


import SwiftUI

struct CalculatorListView: View {
    var body: some View {
        NavigationView{
            ZStack {
                //Background gradient
                LinearGradient(gradient: Gradient(colors: [Color("Space"), Color.white]),
                               startPoint: .topLeading,
                               endPoint: .bottomTrailing)
                    .edgesIgnoringSafeArea(.all)
                
                //Calculator links
                VStack{
                    
                    //Asset Calculator
                    NavigationLink("Asset", destination: AssetCalculatorView())
                            .background(
                                LinearGradient(gradient: Gradient(colors: [.black, Color("Space")]), startPoint: .leading, endPoint: .trailing)
                                    .frame(width: 200, height: 70)
                                    .scaledToFill()
                                    .cornerRadius(15)
                                    .shadow(color: Color.black,
                                                   radius: 3.0,
                                                   x: 2, y: 2)
                                
                            ).foregroundColor(Color("Manatee"))
                    
                        Spacer()
                        
                        //GPA Calculator
                        NavigationLink("GPA", destination: GPACalculatorView())
                            .background(
                                LinearGradient(gradient: Gradient(colors: [Color("Space"), Color("Manatee")]), startPoint: .leading, endPoint: .trailing)
                                    .frame(width: 200, height: 70)
                                    .scaledToFill()
                                    .cornerRadius(15)
                                    .shadow(color: Color.black,
                                                   radius: 3.0,
                                                   x: 2, y: 2)
                            )
                    
                        Spacer()
                    
                        //Loan Calculator
                        NavigationLink("Loan", destination: LoanCalculatorView())
                            .background(
                                LinearGradient(gradient: Gradient(colors: [Color("Manatee"), Color("Alice")]), startPoint: .leading, endPoint: .trailing)
                                    .frame(width: 200, height: 70)
                                    .scaledToFill()
                                    .cornerRadius(15)
                                    .shadow(color: Color.black,
                                                   radius: 3.0,
                                                   x: 2, y: 2)
                                
                            )
                    
                        Spacer()
                    
                        //Tip Calculator
                        NavigationLink("Tip", destination:TipCalculatorView())
                            .background(
                                LinearGradient(gradient: Gradient(colors: [Color("Alice"), .white]), startPoint: .leading, endPoint: .trailing)
                                    .frame(width: 200, height: 70)
                                    .scaledToFill()
                                    .cornerRadius(15)
                                    .shadow(color: Color.black,
                                                   radius: 3.0,
                                                   x: 2, y: 2)
                            )
                        Spacer()
                   
                    }
                    .font(.largeTitle)
                    .foregroundColor(.black)
                    .textCase(.uppercase)
                
            }
                
            
            
        }
    }
}

//Preview
struct CalculatorListView_Previews: PreviewProvider {
    static var previews: some View {
        CalculatorListView()
    }
}

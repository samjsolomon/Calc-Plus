//
//  CourseRow.swift
//  Universal-Calculator
//
//  Created by Matthew Trautmann on 4/5/21.
//

import SwiftUI

// Course structure stores the information for the course
// Has name, grade, credits properties as well as a Unique id to display in a list

class Course: ObservableObject, Identifiable {
    let id = UUID()
    @Published var name: String
    @Published var grade: String
    @Published var credits: String
    let grades = ["A", "-A", "+B", "B", "-B", "+C", "C", "-C", "+D", "D", "-D", "F"]
    
    // Two initializers, one empty and one full
    init() {
        self.name = ""
        self.grade = ""
        self.credits = ""
    }
    init(name: String, grade: String, credits: String) {
        self.name = name
        self.grade = grade
        self.credits = credits
        
        
    }
    
    // Get points function returns the number of points attained by a class by multiplying the grades worth by the number of credits
    func getPoints() -> Double {
        if credits != "" {
            if grade == grades[0] {
                return 4.0 * Double(credits)!
            } else if grade == grades[1] {
                return 3.7 * Double(credits)!
            } else if grade == grades[2] {
                return 3.3 * Double(credits)!
            } else if grade == grades[3] {
                return 3.0 * Double(credits)!
            } else if grade == grades[4] {
                return 2.7 * Double(credits)!
            } else if grade == grades[5] {
                return 2.3 * Double(credits)!
            } else if grade == grades[6] {
                return 2.0 * Double(credits)!
            } else if grade == grades[7] {
                return 1.7 * Double(credits)!
            } else if grade == grades[8] {
                return 1.3 * Double(credits)!
            }  else if grade == grades[9] {
                return 1.0 * Double(credits)!
            }  else if grade == grades[10] {
                return 0.7 * Double(credits)!
            } else {
                return 0.0
            }
        } else {
            return 0.0
        }
    }
    
}


// Course Row view
// Has one property a single course instance
// Displays the course and allows the user to change info
struct CourseRow: View {
    @StateObject var course: Course
    var body: some View {
        
        
        HStack(alignment: .center) {
            
            TextField("Class Name", text: $course.name)
                .padding(.horizontal)
                .frame(width: 130.0, height: 30.0)
                .fixedSize()
                .border(Color.white)
            
            TextField("Grade", text: $course.grade)
                .padding(.horizontal)
                .frame(width: 90.0, height: 30.0)
                .fixedSize()
                .border(Color.white)
            
            
            TextField("Credits", text: $course.credits)
                .padding(.horizontal)
                .frame(width: 90.0, height: 30.0)
                .fixedSize()
                .border(Color.white)
                .keyboardType(.numberPad)
        
        }
    }
}


struct CourseRow_Previews: PreviewProvider {
    static var previews: some View {
        CourseRow(course: Course())
    }
}

//
//  SemesterRow.swift
//  Universal-Calculator
//
//  Created by Matthew Trautmann on 4/5/21.
//

import SwiftUI


// Semester Class
// Data structure which stores the array of courses
// Also has a GPA for the semester
class Semester: ObservableObject, Identifiable {
    // Class properties
    let id = UUID()
    @Published var courses: [Course]
    let semesterNumber: Int
    var semesterGPA: Double
    
    // Initializer for an empty Semester to start with 4 classes
    init() {
        self.courses = []
        self.semesterNumber = 1
        self.semesterGPA = 4.0
        
    }
    
    // Intializer which takes in an array of classes to initialize
    init(courses: [Course]){
        self.courses = courses
        
        var totalPoints: Double {
            var i: Int = 0
            var temp: Double = 0
            while i < courses.count {
                temp += courses[i].getPoints()
                i += 1
            }
            return temp
        }
        var totalCredits: Double {
            var i: Int = 0
            var temp: Double = 0
            while i < courses.count {
                temp += (courses[i].credits as NSString).doubleValue
                i += 1
            }
            return temp
        }
        self.semesterNumber = 1
        self.semesterGPA = totalPoints / totalCredits
    }
    
    // calcGPA function, instance method for Semester class which returns semester GPA, also sets semesterGPA
    // Divides all of the courses points by the total credits
    func calcGPA() -> Double {
        var totalPoints: Double {
            var i: Int = 0
            var temp: Double = 0
            while i < courses.count {
                temp += courses[i].getPoints()
                i += 1
            }
            return temp
        }
        var totalCredits: Double {
            var i: Int = 0
            var temp: Double = 0
            while i < courses.count {
                temp += (courses[i].credits as NSString).doubleValue
                i += 1
            }
            return temp
        }
        if totalCredits != 0 {
            return totalPoints / totalCredits
        } else {
            return 0.0
        }
        
    }
}


// View for the semester
// Has a course and semester object
// Course to track the new course added to the semester
// Semester to store and track courses
// Also has name, grade, credits variables to add to course object
// Has a bool isHide which hides the delete button when there are no more courses
struct SemesterRow: View {
    
    @StateObject var semester = Semester()
    @StateObject var course = Course()
    @State var name: String
    @State var grade: String
    @State var credits: String
    @State var isHide: Bool = true
    
    let grades = ["A", "-A", "+B", "B", "-B", "+C", "C", "-C", "+D", "D", "-D", "F"]
    
    var body: some View {
        NavigationView {
            VStack {
                
                HStack {
                    
                    VStack {
                        Text("GPA Calculator")
                            .font(.largeTitle)
                            
                    }
                    
                }.frame(height: 0.0)
                .offset(y: UIScreen.main.bounds.height * -0.02)
                // Form which creates the course the user wants to add to the semester
                Form {
                    
                    Section(header: Text("Enter Course Information: ")) {
                        TextField("Class Name", text: $name)
                            .padding(.horizontal)
                            .frame(width: UIScreen.main.bounds.width * 0.80, height: 30.0)
                            .fixedSize()
                            .border(Color.black)
                        
                        Picker("Select Course Grade", selection: $grade) {
                            ForEach(grades, id: \.self) {
                                    Text($0)
                                }
                        }
                        
                        TextField("Credits", text: $credits)
                            .padding(.horizontal)
                            .frame(width: 130.0, height: 30.0)
                            .fixedSize()
                            .border(Color.black)
                    }
                }
                .frame(width: UIScreen.main.bounds.width * 0.99, height: UIScreen.main.bounds.height * 0.3)
                .offset(y: UIScreen.main.bounds.height * -0.01)
                
                

                // Button to add the written course to semester list
                // Also updates the course if text was written
                Button(action: {
                    let tempCourse = Course(name: name, grade: grade, credits: credits)
                    self.name = ""
                    self.grade = ""
                    self.credits = ""
                    self.semester.courses.append(tempCourse)
                    if semester.courses.count > 0 {
                        isHide = false
                    }
                    
                }) {
                    HStack {
                        Image(systemName: "plus")
                            .font(.body)
                        Text("Add Course to List")
                    }
                    
                }
                .padding(.all)
                .foregroundColor(.white)
                .background(Color.green).frame(width: 200, height: 30)
                .cornerRadius(100)
                .frame(width: 200, height: 20)
                .offset(y: UIScreen.main.bounds.height * -0.09)
                
                
                
                HStack {
                    Text(String(format: "Grade Point Average: %.2f", semester.calcGPA()))
                    Spacer()
                    // Update button updates the list by adding and removing an item
                    Button(action: {
                        let tempCourse = Course(name: name, grade: grade, credits: credits)
                        self.semester.courses.append(tempCourse)
                        self.semester.courses.remove(at: self.semester.courses.count - 1)
                        if semester.courses.count > 0 {
                            isHide = false
                        }
                        
                    }) {
                        HStack {
                            Text("Update")
                        }
                        
                    }
                    .padding(.all)
                    .foregroundColor(.white)
                    .background(Color.blue).frame(width: 200, height: 30)
                    .cornerRadius(100)
                    .frame(width: 50, height: 20)
                    Spacer()
                    
                }.offset(y: UIScreen.main.bounds.height * -0.07)
                
                HStack {
                    Spacer()
                    Text("Course Name").border(Color.white).border(Color.white, width: 1)
                    Spacer()
                    Text("Grade").border(Color.white).border(Color.white, width: 1)
                    Spacer()
                    Text("Credits").border(Color.white).border(Color.white, width: 1)
                    Spacer()
                }.offset(y: UIScreen.main.bounds.height * -0.04)
                
                
                
                List(semester.courses) {course in
                    CourseRow(course: course)
                    
                }
                .frame(width: UIScreen.main.bounds.width + 10, height: UIScreen.main.bounds.height * 0.3)
                .offset(y: UIScreen.main.bounds.height * -0.02)
                
                HStack {
                    
                    
                    
                    // Remove a course from the semester
                    Button(action: {
                        self.semester.courses.remove(at: self.semester.courses.count - 1)
                        if semester.courses.count == 0 {
                            isHide = true
                        }
                        
                    }) {
                        HStack{
                            Image(systemName: "trash")
                                .font(.body)
                            Text("Course")
                        }
                        
                    }
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.red).frame(height: 30)
                    .cornerRadius(20)
                    .frame(width: 150, height: 20)
                    .disabled(isHide == true)
                    .offset(y: UIScreen.main.bounds.height * -0.02)
                    
                }
            }
        }.frame(width: UIScreen.main.bounds.width * 0.99, height: UIScreen.main.bounds.height * 0.94)
        .colorScheme(.dark)
        
        
        
    }
}


struct SemesterRow_Previews: PreviewProvider {
    
    static var previews: some View {
        ZStack {
            
            SemesterRow(name: "", grade: "", credits: "").environmentObject(Semester())
                //.colorScheme(.dark)
        }
        
    }
}

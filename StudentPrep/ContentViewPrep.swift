//
//  ContentViewPrep.swift
//  Bookworm
//
//  Created by Rob Ranf on 8/23/23.
//

import SwiftUI

struct ContentViewPrep: View {
    @State private var rememberMe = false
    @AppStorage("notes") private var notes = ""
    @FetchRequest(sortDescriptors: []) var students: FetchedResults<Student>
    // Get the current managed object context and call it moc
    @Environment(\.managedObjectContext) var moc
    
    var body: some View {
        NavigationView {
            TextEditor(text: $notes)
                .navigationTitle("Notes")
                .padding()
        }
        
        VStack {
            PushButton(title: "Remember Me", isOn: $rememberMe)
            Text(rememberMe ? "On" : "Off")
            List(students) { student in
                Text(student.name ?? "Unknown")
            }
            
            Button("Add") {
                let firstNames = ["Ginny", "Harry", "Ron", "Hermione", "Cho", "Luna"]
                let lastNames = ["Granger", "Lovegood", "Potter", "Chan", "Weasley"]
                
                let chosenFirstName = firstNames.randomElement() ?? "Joanne"
                let chosenLastName = lastNames.randomElement() ?? "Rowling"
                
                // Creata a student object and attach it to a managed object context (moc)
                // so the object knows where it should be stored. Then assign values as normal.
                let student = Student(context: moc)
                student.id = UUID()
                student.name = "\(chosenFirstName) \(chosenLastName)"
                
                // Ask the managed object context to save itself, i.e. write changes to the
                // persistent store. This is a throwing function call, so just call it
                // using try with no error catching because we haven't done anything that
                // can cause an error.
                try? moc.save()
            }
        }
    }
}

struct PushButton: View {
    let title: String
    @Binding var isOn: Bool
    
    var onColors = [Color.red, Color.yellow]
    var offColors = [Color(white: 0.6), Color(white: 0.4)]
    
    var body: some View {
        Button(title) {
            isOn.toggle()
        }
        .padding()
        .background(LinearGradient(gradient: Gradient(colors: isOn ? onColors : offColors), startPoint: .top, endPoint: .bottom))
        .foregroundColor(.white)
        .clipShape(Capsule())
        .shadow(radius: isOn ? 0 : 15)
    }
}

#Preview {
    ContentViewPrep()
}

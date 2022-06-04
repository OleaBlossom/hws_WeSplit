//
//  ContentView.swift
//  WeSplit
//
//  Created by Olea Blossom on 04.06.22.
//

import SwiftUI

struct ContentView: View {
    let students = ["Blossom", "Buttercup", "Bubbles"]
    @State private var selectedStudent = "Blossom"
    
    var body: some View {
        NavigationView {
            Form {
                Picker("Select your student", selection: $selectedStudent) {
                    ForEach(students, id: \.self) {
                        Text($0)
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

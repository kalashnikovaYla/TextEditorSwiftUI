//
//  ContentView.swift
//  TextEditorSwiftUI
//
//  Created by sss on 09.04.2023.
//

import SwiftUI

struct ContentView: View {
    
    @State var text = ""
    @State var totalChars = 0
    @State var lastText = ""
    
    init() {
        UITextView.appearance().backgroundColor = .clear
    }
    
    var body: some View {
        VStack {
            
            ProgressView("Character \(totalChars) / 150 ", value: Double(totalChars), total: 150)
                .frame(width: 300)
                .padding()
                .foregroundColor(.white)
                .tint(.black)
            
            TextEditor(text: $text)
                .padding()
                
                .background(.yellow)
                .scrollContentBackground(.hidden)
                .foregroundColor(.purple)
                .font(.title)
                .frame(width: 370, height: 300)
                .cornerRadius(24)
                .onChange(of: text) { newValue in
                    totalChars = text.count
                    if totalChars <= 150 {
                        lastText = text
                    } else {
                        text = lastText
                    }
                }
               
            Spacer()
        }
        .padding()
        .background(.purple)
        .onTapGesture {
            UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

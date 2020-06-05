//
//  ContentView.swift
//  ProgressiveArc
//
//  Created by Ramill Ibragimov on 05.06.2020.
//  Copyright © 2020 Ramill Ibragimov. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var arcExterior = 100
    @State private var arcInterier = 0
    
    let backgroundColor = LinearGradient(gradient: Gradient(colors: [Color.blue, Color.purple]), startPoint: .leading, endPoint: .trailing)
    
    let frontColor = LinearGradient(gradient: Gradient(colors: [Color.pink, Color.red]), startPoint: .leading, endPoint: .trailing)
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.purple, .blue]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)
            
            ArcShape(finalArc: .degrees(135))
                .stroke(backgroundColor, lineWidth: 40)
                .shadow(color: .black, radius: 10, x: 0, y: 0)
            
            ArcShape(finalArc: calculateAngle())
                .stroke(frontColor, lineWidth: 30)
                    .shadow(color: .white, radius: 2, x: 0, y: 0)
            
            Button(action: {
                withAnimation {
                    if self.arcInterier < 100 {
                        self.arcInterier += 10
                    } else {
                        self.arcInterier = 0
                    }
                }
            }) {
                Text("Press me")
                    .foregroundColor(.white)
                    .font(.largeTitle)
            }
        }
    }
    
    func calculateAngle() -> Angle {
        let completeArc = Angle.degrees(270)
        let longtitude = completeArc / Double(arcExterior)
        let latitude = longtitude * Double(arcInterier)
        return latitude + Angle.degrees(225)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

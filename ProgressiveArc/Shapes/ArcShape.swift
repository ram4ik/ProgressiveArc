//
//  ArcShape.swift
//  ProgressiveArc
//
//  Created by Ramill Ibragimov on 05.06.2020.
//  Copyright © 2020 Ramill Ibragimov. All rights reserved.
//

import SwiftUI

struct ArcShape: Shape {
    
    var finalArc: Angle
    
    func path(in rect: CGRect) -> Path {
        let rotationAngle = Angle.degrees(90)
        let finalModifier = finalArc - rotationAngle
        
        var path = Path()
        path.addArc(center: CGPoint(x: rect.midX, y: rect.midY), radius: 150, startAngle: .degrees(225 - 90), endAngle: finalModifier, clockwise: false)
        return path
    }
}


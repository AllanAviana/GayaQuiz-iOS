//
//  RoundedCorner.swift
//  GayaQuiz
//
//  Created by Allan Viana on 20/11/24.
//

import SwiftUI

struct RoundedCorner: Shape {
    var radius: CGFloat = 8.0
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(
            roundedRect: rect, byRoundingCorners: corners,
            cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

#Preview {
    RoundedCorner()
}

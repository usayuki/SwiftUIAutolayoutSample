//
//  ViewModel.swift
//  SwiftUIAutolayoutSample
//
//  Created by usayuki on 2020/10/17.
//

import Combine
import UIKit

final class ViewModel: ObservableObject {

    let subject = PassthroughSubject<CGFloat, Never>()

    func send(height: CGFloat) {
        subject.send(height)
    }
}

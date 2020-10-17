//
//  ViewController.swift
//  SwiftUIAutolayoutSample
//
//  Created by usayuki on 2020/10/17.
//

import Combine
import UIKit
import SwiftUI

class ViewController: UIViewController {
    var cancellables: Set<AnyCancellable> = .init()

    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var topConstraint: NSLayoutConstraint!

    private let viewModel = ViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()

        let hostingViewController = UIHostingController(rootView: ExpandLabelView(viewModel: viewModel))
        addChild(hostingViewController)
        view.addSubview(hostingViewController.view)
        hostingViewController.didMove(toParent: self)

        hostingViewController.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            hostingViewController.view.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 16),
            hostingViewController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            hostingViewController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])

        viewModel.subject.sink { [weak self] height in
            self?.topConstraint.constant = height + 32
        }
        .store(in: &cancellables)
    }


}


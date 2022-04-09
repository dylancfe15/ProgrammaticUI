//
//  ViewController.swift
//  ProgrammaticUI
//
//  Created by Difeng Chen on 4/9/22.
//

import UIKit

class ViewController: UIViewController {
    // MARK: - Views

    private lazy var welcomeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Welcome to Dylan's gig!"
        label.font = .boldSystemFont(ofSize: 25)
        return label
    }()

    private lazy var button: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(.blue, for: .normal)
        button.setTitle("Tap to count", for: .normal)
        button.addAction(UIAction(handler: { _ in
            self.count += 1
        }), for: .touchUpInside)
        return button
    }()

    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [welcomeLabel, button, UIView()])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .center
        return stackView
    }()

    // MARK: - Properties

    private var count = 0 {
        didSet {
            button.setTitle("Count: \(count)", for: .normal)
        }
    }

    // MARK: - Lifecycles

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(stackView)

        NSLayoutConstraint.activate([
            welcomeLabel.heightAnchor.constraint(equalToConstant: 50),

            button.heightAnchor.constraint(equalToConstant: 50),

            stackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}


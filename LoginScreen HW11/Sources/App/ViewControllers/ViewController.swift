//
//  ViewController.swift
//  LoginScreen HW11
//
//  Created by Артур Горлов on 19.08.2022.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    // MARK: - Outlets

    private let backgroundImageView: UIImageView = {
        let image = UIImage(named: "back")
        let backgroundImageView = UIImageView(image: image)
        backgroundImageView.contentMode = .scaleAspectFill
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        return backgroundImageView
    }()

    private let loginLabel: UILabel = {
        let loginLabel = UILabel()
        loginLabel.text = "Login"
        loginLabel.textAlignment = .center
        loginLabel.font = UIFont(name: "noteworthy", size: 50)
        loginLabel.textColor = UIColor.white
        loginLabel.translatesAutoresizingMaskIntoConstraints = false
        return loginLabel
    }()

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupHierarchy()
        setupLayout()
    }

    // MARK: - Setup

    private func setupHierarchy() {
        view.addSubview(backgroundImageView)
        view.addSubview(loginLabel)
    }

    private func setupLayout() {
        backgroundImageView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
            make.trailing.equalToSuperview()
            make.leading.equalToSuperview()
        }

        loginLabel.snp.makeConstraints { make in
            make.centerX.equalTo(view)
            make.top.equalTo(view.safeAreaInsets.top).offset(20)
            make.bottom.equalTo(loginLabel.snp.top).offset(100)
        }
    }

    // MARK: - Actions

}


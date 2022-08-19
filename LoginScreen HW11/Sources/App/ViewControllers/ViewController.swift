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

    private let textFieldUsername: UITextField = {
        let textFieldUsername = UITextField()
        textFieldUsername.placeholder = "enter username"
        textFieldUsername.textColor = UIColor.black
        textFieldUsername.backgroundColor = UIColor.white
        textFieldUsername.layer.cornerRadius = 20
        textFieldUsername.setLeftIcon(UIImage(systemName: "person"))
        textFieldUsername.setRightIcon(UIImage(systemName: "checkmark.circle.fill"))
        textFieldUsername.tintColor = UIColor.systemGray
        textFieldUsername.layer.shadowColor = UIColor.black.cgColor
        textFieldUsername.layer.shadowOpacity = 0.3
        textFieldUsername.layer.shadowOffset = .zero
        textFieldUsername.layer.shadowRadius = 5
        textFieldUsername.layer.shouldRasterize = true
        textFieldUsername.layer.rasterizationScale = UIScreen.main.scale
        textFieldUsername.translatesAutoresizingMaskIntoConstraints = false
        return textFieldUsername
    }()

    private let textFieldPassword: UITextField = {
        let textFieldPassword = UITextField()
        textFieldPassword.placeholder = "password"
        textFieldPassword.textColor = UIColor.black
        textFieldPassword.backgroundColor = UIColor.white
        textFieldPassword.layer.cornerRadius = 20
        textFieldPassword.setLeftIcon(UIImage(systemName: "lock"))
        textFieldPassword.tintColor = UIColor.systemGray
        textFieldPassword.layer.shadowColor = UIColor.black.cgColor
        textFieldPassword.layer.shadowOpacity = 0.3
        textFieldPassword.layer.shadowOffset = .zero
        textFieldPassword.layer.shadowRadius = 5
        textFieldPassword.layer.shouldRasterize = true
        textFieldPassword.layer.rasterizationScale = UIScreen.main.scale
        textFieldPassword.translatesAutoresizingMaskIntoConstraints = false
        return textFieldPassword
    }()

    private let textFieldStack: UIStackView = {
        let textFieldStack = UIStackView()
        textFieldStack.axis = .vertical
        textFieldStack.distribution = .fillEqually
        textFieldStack.alignment = .fill
        textFieldStack.spacing = 20
        textFieldStack.translatesAutoresizingMaskIntoConstraints = false
        return textFieldStack
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
        view.addSubview(textFieldStack)
        textFieldStack.addArrangedSubview(textFieldUsername)
        textFieldStack.addArrangedSubview(textFieldPassword)
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

        textFieldStack.snp.makeConstraints { make in
            make.top.equalTo(loginLabel).offset(150)
            make.leading.equalTo(view).offset(50)
            make.trailing.equalTo(view).inset(50)
            make.bottom.equalTo(textFieldStack.snp.top).offset(100)
        }
    }

    // MARK: - Actions

}


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

    private lazy var loginButton: UIButton = {
        let loginButton = UIButton(type: .system)
        loginButton.backgroundColor = .systemIndigo
        loginButton.alpha = 0.8
        loginButton.setTitle("Login", for: .normal)
        loginButton.setTitleColor(UIColor.white, for: .normal)
        loginButton.layer.cornerRadius = 20
        loginButton.layer.shadowColor = UIColor.black.cgColor
        loginButton.layer.shadowOpacity = 0.3
        loginButton.layer.shadowOffset = .zero
        loginButton.layer.shadowRadius = 5
        loginButton.layer.shouldRasterize = true
        loginButton.layer.rasterizationScale = UIScreen.main.scale
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        loginButton.addTarget(self, action: #selector(loginButtonPressed), for: .touchUpInside)
        return loginButton
    }()

    private lazy var passwordResetButton: UIButton = {
        let passwordResetButton = UIButton(type: .system)
        passwordResetButton.setTitle("Forgot your password?", for: .normal)
        passwordResetButton.setTitleColor(UIColor.white, for: .normal)
        passwordResetButton.translatesAutoresizingMaskIntoConstraints = false
        passwordResetButton.addTarget(self, action: #selector(resetPasswordButtonPressed), for: .touchUpInside)
        return passwordResetButton
    }()

    private let signInStack: UIStackView = {
        let signInStack = UIStackView()
        signInStack.axis = .vertical
        signInStack.distribution = .fillEqually
        signInStack.alignment = .fill
        signInStack.spacing = 20
        signInStack.translatesAutoresizingMaskIntoConstraints = false
        return signInStack
    }()

    private let lineViewLabel: UILabel = {
        let lineViewLabel = UILabel()
        lineViewLabel.text = "or connect with"
        lineViewLabel.textAlignment = .center
        lineViewLabel.textColor = UIColor.white
        lineViewLabel.alpha = 0.5
        lineViewLabel.translatesAutoresizingMaskIntoConstraints = false
        return lineViewLabel
    }()

    private let lineViewFirst: UIView = {
        let lineViewFirst = UIView()
        lineViewFirst.backgroundColor = .white
        lineViewFirst.layer.cornerRadius = 2
        lineViewFirst.alpha = 0.5
        lineViewFirst.translatesAutoresizingMaskIntoConstraints = false
        return lineViewFirst
    }()

    private let lineViewSecond: UIView = {
        let lineViewSecond = UIView()
        lineViewSecond.backgroundColor = .white
        lineViewSecond.layer.cornerRadius = 2
        lineViewSecond.alpha = 0.5
        lineViewSecond.translatesAutoresizingMaskIntoConstraints = false
        return lineViewSecond
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
        view.addSubview(signInStack)
        signInStack.addArrangedSubview(loginButton)
        signInStack.addArrangedSubview(passwordResetButton)
        view.addSubview(lineViewFirst)
        view.addSubview(lineViewSecond)
        view.addSubview(lineViewLabel)
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

        signInStack.snp.makeConstraints { make in
            make.top.equalTo(textFieldStack.snp.bottom).offset(50)
            make.leading.equalTo(textFieldStack.snp.leading)
            make.trailing.equalTo(textFieldStack.snp.trailing)
            make.bottom.equalTo(signInStack.snp.top).offset(100)
        }

        lineViewLabel.snp.makeConstraints { make in
            make.centerX.equalTo(view)
            make.bottom.equalTo(view.safeAreaInsets.bottom).inset(170)
        }

        lineViewFirst.snp.makeConstraints { make in
            make.height.equalTo(1)
            make.leading.equalTo(view).offset(50)
            make.trailing.equalTo(lineViewLabel.snp.leading).offset(-10)
            make.bottom.equalTo(lineViewLabel.snp.bottom).inset(8)
        }

        lineViewSecond.snp.makeConstraints { make in
            make.height.equalTo(1)
            make.trailing.equalTo(view).inset(50)
            make.leading.equalTo(lineViewLabel.snp.trailing).offset(10)
            make.bottom.equalTo(lineViewLabel.snp.bottom).inset(8)
        }
    }

    // MARK: - Actions

    @objc private func loginButtonPressed() {
        print("**Hello**")
    }

    @objc private func resetPasswordButtonPressed() {
        print("Reset your password?")
    }
    
}


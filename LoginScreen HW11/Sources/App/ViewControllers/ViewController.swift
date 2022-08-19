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

    private lazy var facebookButton: UIButton = {
        let facebookButton = UIButton(type: .system)
        facebookButton.backgroundColor = .systemBlue
        facebookButton.alpha = 0.7
        facebookButton.setTitle("Facebook", for: .normal)
        facebookButton.setTitleColor(UIColor.white, for: .normal)
        facebookButton.layer.cornerRadius = 18
        facebookButton.contentHorizontalAlignment = .center
        facebookButton.layer.shadowColor = UIColor.black.cgColor
        facebookButton.layer.shadowOpacity = 0.3
        facebookButton.layer.shadowOffset = .zero
        facebookButton.layer.shadowRadius = 2
        facebookButton.layer.shouldRasterize = true
        facebookButton.layer.rasterizationScale = UIScreen.main.scale
        facebookButton.translatesAutoresizingMaskIntoConstraints = false
        facebookButton.addTarget(self, action: #selector(facebookButtonPressed), for: .touchUpInside)
        return facebookButton
    }()

    private let facebookIcon: UIImageView = {
        let facebookIcon = UIImageView()
        facebookIcon.image = UIImage(named: "facebookIcon")
        facebookIcon.translatesAutoresizingMaskIntoConstraints = false
        return facebookIcon
    }()

    private lazy var twitterButton: UIButton = {
        let twitterButton = UIButton(type: .system)
        twitterButton.backgroundColor = .systemIndigo
        twitterButton.alpha = 0.7
        twitterButton.setTitle("Twitter", for: .normal)
        twitterButton.setTitleColor(UIColor.white, for: .normal)
        twitterButton.layer.cornerRadius = 18
        twitterButton.contentHorizontalAlignment = .center
        twitterButton.layer.shadowColor = UIColor.black.cgColor
        twitterButton.layer.shadowOpacity = 0.3
        twitterButton.layer.shadowOffset = .zero
        twitterButton.layer.shadowRadius = 2
        twitterButton.layer.shouldRasterize = true
        twitterButton.layer.rasterizationScale = UIScreen.main.scale
        twitterButton.translatesAutoresizingMaskIntoConstraints = false
        twitterButton.addTarget(self, action: #selector(twitterButtonPressed), for: .touchUpInside)
        return twitterButton
    }()

    private let twitterIcon: UIImageView = {
        let twitterIcon = UIImageView()
        twitterIcon.image = UIImage(named: "twitterIcon")
        twitterIcon.translatesAutoresizingMaskIntoConstraints = false
        return twitterIcon
    }()

    private let otherConnectionButtonStack: UIStackView = {
        let otherConnectionButtonStack = UIStackView()
        otherConnectionButtonStack.axis = .horizontal
        otherConnectionButtonStack.distribution = .fillEqually
        otherConnectionButtonStack.alignment = .fill
        otherConnectionButtonStack.spacing = 10
        otherConnectionButtonStack.translatesAutoresizingMaskIntoConstraints = false
        return otherConnectionButtonStack
    }()

    private let createAccountLabel: UILabel = {
        let createAccountLabel = UILabel()
        createAccountLabel.text = "Don`t have account?"
        createAccountLabel.font = UIFont.systemFont(ofSize: 14)
        createAccountLabel.textAlignment = .center
        createAccountLabel.textColor = UIColor.white
        createAccountLabel.alpha = 0.5
        createAccountLabel.translatesAutoresizingMaskIntoConstraints = false
        return createAccountLabel
    }()

    private lazy var signUpButton: UIButton = {
        let signUpButton = UIButton(type: .system)
        signUpButton.setTitle("Sign up", for: .normal)
        signUpButton.setTitleColor(UIColor.blue, for: .normal)
        signUpButton.alpha = 0.45
        signUpButton.translatesAutoresizingMaskIntoConstraints = false
        signUpButton.addTarget(self, action: #selector(signUpButtonPressed), for: .touchUpInside)
        return signUpButton
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
        view.addSubview(otherConnectionButtonStack)
        facebookButton.addSubview(facebookIcon)
        twitterButton.addSubview(twitterIcon)
        otherConnectionButtonStack.addArrangedSubview(facebookButton)
        otherConnectionButtonStack.addArrangedSubview(twitterButton)
        view.addSubview(createAccountLabel)
        view.addSubview(signUpButton)
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

        otherConnectionButtonStack.snp.makeConstraints { make in
            make.top.equalTo(lineViewLabel.snp.bottom).offset(20)
            make.leading.equalTo(lineViewFirst.snp.leading)
            make.trailing.equalTo(lineViewSecond.snp.trailing)
            make.bottom.equalTo(otherConnectionButtonStack.snp.top).offset(35)
        }

        facebookIcon.snp.makeConstraints { make in
            make.top.equalTo(facebookButton.snp.top).inset(7)
            make.bottom.equalTo(facebookButton.snp.bottom).inset(7)
            make.leading.equalTo(facebookButton.snp.leading).offset(8)
            make.trailing.equalTo(facebookButton.snp.leading).offset(31)
        }

        twitterIcon.snp.makeConstraints { make in
            make.top.equalTo(twitterButton.snp.top).inset(7)
            make.bottom.equalTo(twitterButton.snp.bottom).inset(7)
            make.leading.equalTo(twitterButton.snp.leading).offset(8)
            make.trailing.equalTo(twitterButton.snp.leading).offset(31)
        }

        createAccountLabel.snp.makeConstraints { make in
            make.top.equalTo(otherConnectionButtonStack.snp.bottom).offset(25)
            make.trailing.equalTo(view.snp.centerX)
        }

        signUpButton.snp.makeConstraints { make in
            make.top.equalTo(otherConnectionButtonStack.snp.bottom).offset(18)
            make.leading.equalTo(view.snp.centerX)
            make.trailing.equalTo(otherConnectionButtonStack.snp.trailing).offset(-70)
        }
    }

    // MARK: - Actions

    @objc private func loginButtonPressed() {
        print("**Hello**")
    }

    @objc private func resetPasswordButtonPressed() {
        print("Reset your password?")
    }
    
    @objc private func facebookButtonPressed() {
        print("Go to facebook")
    }

    @objc private func twitterButtonPressed() {
        print("Go to twitter")
    }

    @objc private func signUpButtonPressed() {
        print("Create new account for you?")
    }
    
}


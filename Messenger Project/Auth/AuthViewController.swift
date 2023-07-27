//
//  ViewController.swift
//  Messenger Project
//
//  Created by macbook on 16.07.2023.
//

import UIKit
import SnapKit

class AuthViewController: UIViewController {
    
    let loginAndPassword = UIStackView()
    
    var login = UITextField()
    var password = UITextField()
        
    let logIn = UIButton()
    let signUp = UIButton()
    let faq = UIButton()


    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        
    }

    
    private func configure() { // метод вызова других методов setup<Views>
        setupViewUI()
        
        
        setupStackViews()
        setupTextFields()
        setupButtonsUI()
        
        
        
        setupViewsSubviews()
        setupViewsConstrains()
        setupViewsActions()
    }
    
    private func setupViewUI() { // конфигурация view(фона)
        view.backgroundColor = .systemCyan
    }
    // MARK: - Конфигурация Кнопок "Войти" и "Зарегестрироваться"
    private func setupButtonsUI() {
        logIn.setTitle("Log In", for: .normal)
        signUp.setTitle("Sign Up", for: .normal)
        faq.setTitle("FAQ", for: .normal)
        
        logIn.setTitleColor(.black, for: .normal)
        signUp.setTitleColor(.black, for: .normal)
        faq.setTitleColor(.black, for: .normal)
        
        logIn.titleLabel?.font = UIFont(name: "Open Sans", size: 12)
        signUp.titleLabel?.font = UIFont(name: "Open Sans", size: 12)
        faq.titleLabel?.font = UIFont(name: "Open Sans", size: 12)
        
        logIn.backgroundColor = UIColor.white
        signUp.backgroundColor = UIColor.white
        
        logIn.layer.cornerRadius = 12
        signUp.layer.cornerRadius = 12
    }
    // MARK: - Конфигурация StackView
    private func setupStackViews() {
        loginAndPassword.axis = .vertical
        loginAndPassword.alignment = .fill
        loginAndPassword.distribution = .fill
        loginAndPassword.spacing = 10
        loginAndPassword.center = view.center
    }
    // MARK: - TextField
    private func setupTextFields() {
        let textFields = [login,password]
        for textField in textFields {
            textField.backgroundColor = .white
            textField.borderStyle = .roundedRect
            textField.textAlignment = .left
            textField.autocapitalizationType = .none
            textField.adjustsFontSizeToFitWidth = true
            textField.clearButtonMode = .always
            textField.delegate = self
        }
        
        login.placeholder = "Enter your login"
        password.placeholder = "Enter your password"
        
        login.keyboardType = .emailAddress
        
        login.returnKeyType = .next
        password.returnKeyType = .join
        
        login.isSecureTextEntry = false
        password.isSecureTextEntry = true
        
        login.textContentType = .emailAddress
        password.textContentType = .password
        
    }
    private func setupViewsSubviews() {
        let stackViews = [loginAndPassword]
        for stackView in stackViews { view.addSubview(stackView) }
        
        let textFields = [login , password]
        for textField in textFields { loginAndPassword.addSubview(textField) }
        
        let buttons = [logIn, signUp, faq]
        for button in buttons { view.addSubview(button) }
    }
    private func setupViewsConstrains() {
        loginAndPassword.snp.makeConstraints { make in
            make.width.equalToSuperview()
            make.height.equalTo(100)
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        }
        login.snp.makeConstraints { make in
            make.width.equalTo(200)
            make.height.equalTo(44)
            make.centerX.equalToSuperview()
        }
        password.snp.makeConstraints { make in
            make.width.equalTo(200)
            make.height.equalTo(44)
            make.top.equalTo(login.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
        }
        logIn.snp.makeConstraints { make in
            make.top.equalTo(loginAndPassword.snp.bottom).offset(20)
            make.height.equalTo(40)
            make.width.equalTo(120)
            make.centerX.equalToSuperview()
        }
        signUp.snp.makeConstraints { make in
            make.top.equalTo(logIn.snp.bottom).offset(8)
            make.height.equalTo(40)
            make.width.equalTo(120)
            make.centerX.equalToSuperview()
        }
        faq.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().inset(28)
        }
    }
    private func setupViewsActions() {
        faq.addTarget(self, action: #selector(faqOpen), for: .touchUpInside)
        signUp.addTarget(self, action: #selector(showRegister), for: .touchUpInside)
    }
   
   
    
}


// MARK: - objc methods
extension AuthViewController {
    
    @objc func faqOpen() {
        let vc = FAQViewController()
        self.present(vc, animated: true)
    }
    @objc func showRegister() {
        let vc = RegistrationViewController()
        self.present(vc, animated: true)
    }
}


extension AuthViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == login {
            password.becomeFirstResponder()
        } else {
            textField.resignFirstResponder()
        }
        return true
    }
}

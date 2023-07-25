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
    }
    // MARK: - TextField
    private func setupTextFields() {
        login = UITextField(frame: CGRect(x: 0,
                                          y: 0,
                                          width: 244,
                                          height: 36))
        password = UITextField(frame: CGRect(x: 0,
                                             y: 0,
                                             width: 244,
                                             height: 36))
        
        login.backgroundColor = .white
        password.backgroundColor = .white
        
        login.placeholder = "Enter your login"
        password.placeholder = "Enter your password"
        
        login.borderStyle = .roundedRect
        password.borderStyle = .roundedRect
        
        login.keyboardType = .emailAddress
        password.keyboardType = .default
        
        login.returnKeyType = .next
        password.returnKeyType = .join
        
        login.isSecureTextEntry = false
        password.isSecureTextEntry = true
        
        login.textAlignment = .left
        password.textAlignment = .left
        
        login.autocapitalizationType = .none
        password.autocapitalizationType = .none
        
        login.adjustsFontSizeToFitWidth = true
        password.adjustsFontSizeToFitWidth = true
        
        login.clearButtonMode = .always
        password.clearButtonMode = .always
        
        login.textContentType = .emailAddress
        password.textContentType = .password
        
        login.delegate = self
        password.delegate = self
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
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.height.equalTo(80)
            make.width.equalTo(260)
        }
        login.snp.makeConstraints { make in
            make.height.equalTo(36)
            make.width.equalTo(244)
            make.centerX.equalToSuperview()
            make.top.equalToSuperview()
        }
        password.snp.makeConstraints { make in
            make.height.equalTo(36)
            make.width.equalTo(244)
            make.centerX.equalToSuperview()
            make.top.equalTo(login.snp.bottom).offset(4)
            make.bottom.equalToSuperview()
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

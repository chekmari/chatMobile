//
//  ViewController.swift
//  Messenger Project
//
//  Created by macbook on 16.07.2023.
//

import UIKit
import SnapKit

class AuthViewController: UIViewController {
    
    let logo = UILabel()
    let imageView = UIImageView()
    var image = UIImage(named: "sasha")
    
    let sashaAndDima = UIStackView()
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
        
        setupLabel()
        setupImages()
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
    private func setupLabel() {
        logo.text = "MESSENGER"
        logo.font = UIFont(name: "Open Sans", size: 35)
        logo.textAlignment = .center
        logo.textColor = UIColor.white
        logo.numberOfLines = 0
    }
    private func setupImages() {
        imageView.image = image
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
        sashaAndDima.axis = .horizontal
        sashaAndDima.alignment = .fill
        sashaAndDima.distribution = .fill
        sashaAndDima.spacing = 10
        
        loginAndPassword.axis = .vertical
        loginAndPassword.alignment = .fill
        loginAndPassword.distribution = .fill
        loginAndPassword.spacing = 10
    }
    // MARK: - TextField
    private func setupTextFields() {
        login = UITextField(frame: CGRect(x: 0, y: 0, width: 244, height: 36))
        password = UITextField(frame: CGRect(x: 0, y: 0, width: 244, height: 36))
        
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
    
    }
    private func setupViewsSubviews() {
        let stackViews = [sashaAndDima, loginAndPassword]
        for stackView in stackViews { view.addSubview(stackView) }
        
        sashaAndDima.addSubview(imageView)
        sashaAndDima.layer.borderColor = UIColor.black.cgColor
        sashaAndDima.layer.borderWidth = 1
        
        let labels = [logo]
        for label in labels { view.addSubview(label) }
        
        let textFields = [login , password]
        for textField in textFields { loginAndPassword.addSubview(textField) }
        
        let buttons = [logIn, signUp, faq]
        for button in buttons { view.addSubview(button) }
    }
    private func setupViewsConstrains() {
        
        logo.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().dividedBy(3)
        }
        sashaAndDima.snp.makeConstraints { make in
            make.height.equalTo(200)
            make.centerX.equalToSuperview()
            make.top.equalTo(logo.snp.bottom).offset(12)
            make.leading.equalToSuperview().inset(12)
            make.trailing.equalToSuperview().inset(12)
        }
        imageView.snp.makeConstraints { make in
            make.height.equalTo(40)
            make.width.equalTo(40)
        }
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
    }
   
   
    
}


// MARK: - objc methods
extension AuthViewController {
    
    @objc func faqOpen() {
        let vc = FAQViewController()
        self.present(vc, animated: true)
    }
}




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
        view.addSubview(loginAndPassword)
        
        let textFields = [login , password]
        for textField in textFields { loginAndPassword.addSubview(textField) }
        
        let buttons = [logIn, signUp, faq]
        for button in buttons { view.addSubview(button) }
    }
    private func setupViewsActions() {
        login.addTarget(   self,
                           action: #selector(textFieldDidChange),
                           for: .editingChanged)
        password.addTarget(self,
                           action: #selector(textFieldDidChange),
                           for: .editingChanged)
        faq.addTarget(     self,
                           action: #selector(faqOpen),
                           for: .touchUpInside)
        signUp.addTarget(  self,
                           action: #selector(showRegister),
                           for: .touchUpInside)
        logIn.addTarget(   self,
                           action: #selector(logInPressed),
                           for: .touchUpInside)
    }
   
   
    
}
// MARK: - верстка UI
extension AuthViewController {
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
}
// MARK: - переходы между viewControllers
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
// MARK: - textFields delegates methods
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
// MARK: - JSON method
extension AuthViewController {
    @objc func logInPressed() {
        guard let email = login.text,
              let password = password.text else { return }
        
        var requestData: [String:Any] = [
            "email": email,
            "password": password
        ]
        
        do {
            // convert dict to json
            let jsonData = try JSONSerialization.data(withJSONObject: requestData, options: [])
            // печатаем json в консоль
            if let jsonString = String(data: jsonData, encoding: .utf8) {
                print(jsonString)
            }
        }
        catch {
            print("ошибка отправки json")
        }
        accountLogin()
    }
    
    private func accountLogin() {
        if let fileURL = FileManager.default.urls(for:.documentDirectory,
                                                  in: .userDomainMask).first?.appendingPathComponent("UsersJSON.json") {
            if let data = try? Data(contentsOf: fileURL) {
                do {
                    let users = try JSONDecoder().decode([User].self,
                                                         from: data)
                    
                    for user in users {
                        if user.email == login.text ,
                           user.password == password.text {
                            let mainVC = MainViewController()
                            self.present(mainVC, animated: true)
                        } else {
                            let alert = createAlert(title: "WARNING!",
                                                    message: "This user does not exist. Check the entered data!",
                                                    buttonText: "OK")
                            self.present(alert,
                                         animated: true)
                        }
                    }
                }
                catch {
                    print("Error decoding JSON: \(error)")
                }
                
            }
        }
    }
}


// MARK: - Наблюдатели для для обязательных полей textFields
extension AuthViewController {
    @objc private func updateLogInButtonState() {
         // Проверка на обязательные поля при входе в аккаунт
        let isEmailValid = isValid(textField: login)
        let isPasswordValid = isValid(textField: password)
        
        let isLogInEnabled = isEmailValid &&
                             isPasswordValid
        logIn.isEnabled = isLogInEnabled
    }
    private func isValid(textField: UITextField) -> Bool {
        return !(textField.text ?? "").isEmpty
    }
    @objc func textFieldDidChange(_ textField: UITextField) {
        // этот метод вызывается при изменениb text
        updateLogInButtonState()
    }
}


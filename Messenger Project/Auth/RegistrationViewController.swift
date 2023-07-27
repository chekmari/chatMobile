//
//  RegistrationViewController.swift
//  Messenger Project
//
//  Created by macbook on 23.07.2023.
//

import UIKit
import SnapKit

class RegistrationViewController: UIViewController, UITextFieldDelegate {
    
    let registerStackView = UIStackView()
    
    var email = UITextField()
    var password = UITextField()
    var firstName = UITextField()
    var lastName = UITextField()
    var middleName = UITextField()
    var age = UITextField()
    var country = UITextField()
    var town = UITextField()
    let send = UIButton()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        
        
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    private func configure() { // метод вызова других методов setup<Views>
        setupViewUI()
        
        setupStackView()
        setupTextFields()
        setupButtonUI()
        
        setupViewsSubviews()
        setupViewsConstrains()
        setupViewsActions()
    }
    
    private func setupViewUI() { view.backgroundColor = .systemCyan }
    private func setupStackView() {
        registerStackView.axis = .vertical
        registerStackView.spacing = 10
        registerStackView.alignment = .fill
        registerStackView.distribution = .fill
    }
    private func setupTextFields() {
        let textFields = [email,
                          password,
                          firstName,
                          lastName,
                          middleName,
                          age,
                          country,
                          town]
        
        for textField in textFields {
            textField.backgroundColor = .white
            textField.clearButtonMode = .always
            textField.adjustsFontSizeToFitWidth = true
            textField.delegate = self
            textField.isSecureTextEntry = false
            textField.borderStyle = .roundedRect
            textField.font = UIFont.systemFont(ofSize: 14)
            
            if textField == town {
                textField.returnKeyType = .send
            } else { textField.returnKeyType = .next }
        }
        
        let optionalAttributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.red,
            .font: UIFont.systemFont(ofSize: 14)
        ]

        let emailPlaceholder = NSAttributedString(string: "Enter your login", attributes: optionalAttributes)
        let passwordPlaceholder = NSAttributedString(string: "Enter your password", attributes: optionalAttributes)
        let firstNamePlaceholder = NSAttributedString(string: "Enter your first name", attributes: optionalAttributes)
        let lastNamePlaceholder = NSAttributedString(string: "Enter your last name", attributes: optionalAttributes)
        let middleNamePlaceholder = NSAttributedString(string: "Enter your middle name", attributes: optionalAttributes)
        
        email.attributedPlaceholder = emailPlaceholder
        password.attributedPlaceholder = passwordPlaceholder
        firstName.attributedPlaceholder = firstNamePlaceholder
        lastName.attributedPlaceholder = lastNamePlaceholder
        middleName.attributedPlaceholder = middleNamePlaceholder
        age.placeholder = "Enter your age"
        country.placeholder = "Enter your country name"
        town.placeholder = "Enter your town name"
        
        email.keyboardType = .emailAddress
        age.keyboardType = .numberPad
        
        email.autocapitalizationType = .none
        password.autocapitalizationType = .none
        
        email.autocorrectionType = .no
        password.autocorrectionType = .no
    }
    private func setupButtonUI() {
        send.setTitle("Sign In", for: .normal)
        send.setTitleColor(.black, for: .normal)
        send.titleLabel?.font = UIFont(name: "Open Sans", size: 12)
        send.backgroundColor = .white
        send.layer.cornerRadius = 12
    }
    private func setupViewsSubviews() {
        view.addSubview(registerStackView)
        let textFields = [email,
                          password,
                          firstName,
                          lastName,
                          middleName,
                          age,
                          country,
                          town]
        for textField in textFields { registerStackView.addSubview(textField) }
        view.addSubview(send)
    }
    private func setupViewsConstrains() {
        registerStackView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().dividedBy(1.5)
            make.width.equalToSuperview()
            make.height.equalTo(422)
        }
        email.snp.makeConstraints { make in
            make.height.equalTo(44)
            make.width.equalTo(200)
            make.centerX.equalToSuperview()
            make.top.equalToSuperview()
        }
        password.snp.makeConstraints { make in
            make.height.equalTo(44)
            make.width.equalTo(200)
            make.centerX.equalToSuperview()
            make.top.equalTo(email.snp.bottom).offset(10)
        }
        firstName.snp.makeConstraints { make in
            make.height.equalTo(44)
            make.width.equalTo(200)
            make.centerX.equalToSuperview()
            make.top.equalTo(password.snp.bottom).offset(10)
        }
        lastName.snp.makeConstraints { make in
            make.height.equalTo(44)
            make.width.equalTo(200)
            make.centerX.equalToSuperview()
            make.top.equalTo(firstName.snp.bottom).offset(10)
        }
        middleName.snp.makeConstraints { make in
            make.height.equalTo(44)
            make.width.equalTo(200)
            make.centerX.equalToSuperview()
            make.top.equalTo(lastName.snp.bottom).offset(10)
        }
        age.snp.makeConstraints { make in
            make.height.equalTo(44)
            make.width.equalTo(200)
            make.centerX.equalToSuperview()
            make.top.equalTo(middleName.snp.bottom).offset(10)
        }
        country.snp.makeConstraints { make in
            make.height.equalTo(44)
            make.width.equalTo(200)
            make.centerX.equalToSuperview()
            make.top.equalTo(age.snp.bottom).offset(10)
        }
        town.snp.makeConstraints { make in
            make.height.equalTo(44)
            make.width.equalTo(200)
            make.centerX.equalToSuperview()
            make.top.equalTo(country.snp.bottom).offset(10)
        }
        send.snp.makeConstraints { make in
            make.top.equalTo(registerStackView.snp.bottom).offset(20)
            make.height.equalTo(40)
            make.width.equalTo(120)
            make.centerX.equalToSuperview()
        }
    }
    private func setupViewsActions() {}

}
    

   



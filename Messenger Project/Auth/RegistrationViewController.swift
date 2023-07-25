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
    
    private func setupViewUI() { view.backgroundColor = .white }
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
//        email.placeholder = "Enter your login"
        
        for textField in textFields {
            textField.backgroundColor = .white
            textField.clearButtonMode = .always
            textField.adjustsFontSizeToFitWidth = true
            textField.delegate = self
            textField.isSecureTextEntry = false
            textField.borderStyle = .roundedRect
            textField.font = UIFont.systemFont(ofSize: 20)
            
            if textField == town {
                textField.returnKeyType = .send
            } else { textField.returnKeyType = .next }
            textField.placeholder = "Enter your \(textField)"
        }
        
    }
    private func setupButtonUI() {
        send.setTitle("Sign In", for: .normal)
        send.setTitleColor(.white, for: .normal)
        send.backgroundColor = .systemCyan
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
        registerStackView.addSubview(send)
    }
    private func setupViewsConstrains() {
        registerStackView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.width.equalTo(340)
            make.height.equalTo(600)
        }
        registerStackView.layer.borderColor = UIColor.black.cgColor
        registerStackView.layer.borderWidth = 1
        
        email.snp.makeConstraints { make in
            make.height.equalTo(52)
            make.width.equalTo(320)
            make.centerX.equalToSuperview()
            make.top.equalToSuperview()
        }
        password.snp.makeConstraints { make in
            make.height.equalTo(52)
            make.width.equalTo(320)
            make.centerX.equalToSuperview()
            make.top.equalTo(email.snp.bottom).offset(10)
        }
        firstName.snp.makeConstraints { make in
            make.height.equalTo(52)
            make.width.equalTo(320)
            make.centerX.equalToSuperview()
            make.top.equalTo(password.snp.bottom).offset(10)
        }
        lastName.snp.makeConstraints { make in
            make.height.equalTo(52)
            make.width.equalTo(320)
            make.centerX.equalToSuperview()
            make.top.equalTo(firstName.snp.bottom).offset(10)
        }
        middleName.snp.makeConstraints { make in
            make.height.equalTo(52)
            make.width.equalTo(320)
            make.centerX.equalToSuperview()
            make.top.equalTo(lastName.snp.bottom).offset(10)
        }
        age.snp.makeConstraints { make in
            make.height.equalTo(52)
            make.width.equalTo(320)
            make.centerX.equalToSuperview()
            make.top.equalTo(middleName.snp.bottom).offset(10)
        }
        country.snp.makeConstraints { make in
            make.height.equalTo(52)
            make.width.equalTo(320)
            make.centerX.equalToSuperview()
            make.top.equalTo(age.snp.bottom).offset(10)
        }
        town.snp.makeConstraints { make in
            make.height.equalTo(52)
            make.width.equalTo(320)
            make.centerX.equalToSuperview()
            make.top.equalTo(country.snp.bottom).offset(10)
        }
        send.snp.makeConstraints { make in
            make.height.equalTo(52)
            make.width.equalTo(104)
            make.centerX.equalToSuperview()
            make.top.equalTo(town.snp.bottom).offset(10)
        }
        
        
    }
    private func setupViewsActions() {}

}
    

   



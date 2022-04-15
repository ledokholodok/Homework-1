//
//  ChangePasswordViewController.swift
//  Homework 1. Task 2.
//
//  Created by Lidiya Karnaukhova on 14.04.2022.
//

import UIKit
import SnapKit

class ChangePasswordViewController: UIViewController {

    let backArrowImage = UIImageView()
    let navigationLabel = UILabel()
    let currentPasswordTextField = CustomTextField()
    let newPasswordTextField = CustomTextField()
    let repeatPasswordTextField = CustomTextField()
    let forgotPasswordButton = UIButton()
    let saveButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        view.backgroundColor = UIColor(red: 0.97, green: 0.97, blue: 0.97, alpha: 1.0)
        configureNavigationBar()
        configureCurrentPasswordTextField()
        configureNewPasswordTextField()
        configureRepeatPasswordTextField()
        configureForgotPasswordButton()
        configureSaveButton()
    }
    
    private func configureNavigationBar() {
        view.addSubview(backArrowImage)
        backArrowImage.image = UIImage(named: "back arrow")
        
        view.addSubview(navigationLabel)
        setLabel(label: navigationLabel, text: "Изменить пароль", font: "Montserrat", size: 16)
        
        backArrowImage.snp.makeConstraints {
            $0.top.equalToSuperview().inset(58)
            $0.leading.equalToSuperview().inset(18)
            $0.height.width.equalTo(24)
        }
        
        navigationLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(74)
            $0.top.equalToSuperview().inset(61)
        }
    }
    
    func setLabel(label: UILabel, text: String, font: String, size: CGFloat) {
        label.attributedText = NSAttributedString(string: text, attributes: [.kern: 0.16])
        label.font = UIFont(name: font, size: size)
        label.textColor = UIColor(red: 0.22, green: 0.22, blue: 0.22, alpha: 1.0)
    }
        
    private func configureCurrentPasswordTextField() {
        view.addSubview(currentPasswordTextField)
        setLabel(label: currentPasswordTextField.title, text: "Текущий пароль", font: "Montserrat Regular", size: 12)
        currentPasswordTextField.eye.image = UIImage(named: "opened eye")
        currentPasswordTextField.isSecureTextEntry = false

        currentPasswordTextField.snp.makeConstraints {
            $0.top.equalTo(navigationLabel.snp.bottom).offset(23)
            $0.leading.trailing.equalToSuperview().inset(15)
            $0.height.equalTo(50)
        }
    }

    private func configureNewPasswordTextField() {
        view.addSubview(newPasswordTextField)
        setLabel(label: newPasswordTextField.title, text: "Новый пароль", font: "Montserrat Regular", size: 12)
        newPasswordTextField.eye.image = UIImage(named: "opened eye")
        newPasswordTextField.isSecureTextEntry = false

        newPasswordTextField.snp.makeConstraints {
            $0.top.equalTo(currentPasswordTextField.snp.bottom).offset(16)
            $0.leading.trailing.equalToSuperview().inset(15)
            $0.height.equalTo(50)
        }
    }
    
    private func configureRepeatPasswordTextField() {
        view.addSubview(repeatPasswordTextField)
        repeatPasswordTextField.padding = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 100);
        repeatPasswordTextField.attributedPlaceholder = NSAttributedString(
            string: "Повторить новый пароль",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor(red: 0.22, green: 0.22, blue: 0.22, alpha: 1.0)]
        )
        
        repeatPasswordTextField.snp.makeConstraints {
            $0.top.equalTo(newPasswordTextField.snp.bottom).offset(16)
            $0.leading.trailing.equalToSuperview().inset(15)
            $0.height.equalTo(50)
        }
    }
    
    private func configureForgotPasswordButton() {
        view.addSubview(forgotPasswordButton)
        forgotPasswordButton.configuration = .plain()
        
        let forgotButtonAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont(name: "Montserrat Regular", size: 14) as Any,
              .foregroundColor:  UIColor(red: 0.22, green: 0.22, blue: 0.22, alpha: 1.0),
              .underlineStyle: NSUnderlineStyle.single.rawValue
        ]
        
        let attributeString = NSMutableAttributedString (
                string: "Забыли пароль?",
                attributes: forgotButtonAttributes
        )
        forgotPasswordButton.setAttributedTitle(attributeString, for: .normal)

        forgotPasswordButton.snp.makeConstraints {
            $0.top.equalTo(repeatPasswordTextField.snp.bottom).offset(32)
            $0.centerX.equalToSuperview()
            
        }
    }
    
    private func configureSaveButton() {
        view.addSubview(saveButton)
        saveButton.backgroundColor = .white
        saveButton.layer.borderWidth = 1
        saveButton.layer.borderColor = CGColor(red: 0.65, green: 0.65, blue: 0.65, alpha: 1.0)
        saveButton.layer.cornerRadius = 10
        
        let saveButtonAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont(name: "Montserrat Regular", size: 20) as Any,
              .foregroundColor:  UIColor(red: 0.65, green: 0.65, blue: 0.65, alpha: 1.0),
        ]
        
        let attributeString = NSMutableAttributedString (
                string: "Cохранить",
                attributes: saveButtonAttributes
        )
        saveButton.setAttributedTitle(attributeString, for: .normal)
        
        saveButton.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(24)
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.height.equalTo(50)
        }
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        saveButton.snp.remakeConstraints {
            $0.top.equalTo(forgotPasswordButton.snp.bottom).offset(104);
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.height.equalTo(50)
        }
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        saveButton.snp.remakeConstraints {
            $0.bottom.equalToSuperview().inset(24);
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.height.equalTo(50)
        }
    }
}



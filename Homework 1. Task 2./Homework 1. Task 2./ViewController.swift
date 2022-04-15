//
//  ViewController.swift
//  Homework 1. Task 2.
//
//  Created by Lidiya Karnaukhova on 12.04.2022.
//

import UIKit
import SnapKit
import PhotosUI

class ViewController: UIViewController {
    
    let backArrowImage = UIImageView()
    let navigationLabel = UILabel()
    let imageView = UIImageView()
    let changeImageView = UIImageView()
    let changeImage = UIImageView()
    let userName = UILabel()
    let userMail = UILabel()
    let line = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 0.97, green: 0.97, blue: 0.97, alpha: 1.0)
        configureNavigationBar()
        configureImageView()
        configureUserInfo()
        configureLine()
        configureCells()
    }

    private func configureNavigationBar() {
        view.addSubview(backArrowImage)
        backArrowImage.image = UIImage(named: "back arrow")
        
        view.addSubview(navigationLabel)
        setLabel(label: navigationLabel, text: "Профиль", font: "Montserrat", size: 16)
        
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
    
    private func configureImageView() {
        view.addSubview(imageView)
        imageView.image = UIImage(named: "photo")
        roundView(image: imageView, x: 37)
        imageView.layer.borderWidth = 1.0
        imageView.layer.borderColor = CGColor(red: 0.28, green: 0.28, blue: 0.28, alpha: 1.0)
        let gesture = UITapGestureRecognizer(target: self, action:  #selector(self.checkImageAction))
        imageView.addGestureRecognizer(gesture)
        imageView.isUserInteractionEnabled = true
        
        view.addSubview(changeImageView)
        changeImageView.backgroundColor = UIColor(red: 0.18, green: 0.38, blue: 0.89, alpha: 1.0)
        roundView(image: changeImageView, x: 14)
        
        changeImageView.addSubview(changeImage)
        changeImage.image = UIImage(named: "take image")
        
        imageView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(106)
            $0.leading.equalToSuperview().inset(150)
            $0.height.width.equalTo(74)
        }
        
        changeImageView.snp.makeConstraints {
            $0.top.equalTo(imageView).inset(44)
            $0.leading.equalTo(imageView).inset(46)
            $0.height.width.equalTo(28)
        }
        
        changeImage.snp.makeConstraints {
            $0.top.leading.equalToSuperview().inset(6)
            $0.height.width.equalTo(16)
        }
    }
    
    func roundView(image : UIImageView, x : CGFloat) {
        image.layer.cornerRadius = x
        image.clipsToBounds = true
    }
    
    @objc func checkImageAction(sender : UITapGestureRecognizer) {
        PHPhotoLibrary.requestAuthorization(for: .readWrite) { [unowned self] (status) in
            DispatchQueue.main.async { [unowned self] in
                if status == .authorized || status == .limited {
                    let vc = UIImagePickerController()
                    vc.sourceType = .photoLibrary
                    vc.delegate = self
                    vc.allowsEditing = true
                    present(vc, animated: true)
                }
            }
        }
    }
    
    private func configureUserInfo() {
        view.addSubview(userName)
        setLabel(label: userName, text: "Лидия Карнаухова", font: "Montserrat SemiBold", size: 16)
        
        view.addSubview(userMail)
        setLabel(label: userMail, text: "lidiya.karn@gmail.com", font: "Montserrat Regular", size: 14)
    
        userName.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().inset(196)
        }
        
        userMail.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().inset(218)
        }
    }
    
    private func configureLine() {
        view.addSubview(line)
        line.backgroundColor = UIColor(red: 0.73, green: 0.73, blue: 0.73, alpha: 1.0)
        
        line.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(userMail.snp.bottom).offset(20)
            $0.height.equalTo(1)
            $0.width.equalTo(344)
        }
    }
    
    private func createCell(cell: Cell, topView: UIView) -> UIView {
        let cellView = UIView()
        let label = UILabel()
        let divider = UIView()
        
        view.addSubview(cellView)
        cellView.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.top.equalTo(topView.snp.bottom)
            $0.trailing.equalToSuperview()
            $0.height.equalTo(56)
        }
        
        cellView.addSubview(label)
        label.text = cell.text
        label.textColor = cell.textColor
        label.attributedText = NSAttributedString(string: cell.text, attributes: [.kern: 0.16])
        label.font = UIFont(name: "Montserrat Regular", size: 16)
        label.snp.makeConstraints {
            $0.top.equalToSuperview().inset(19)
            $0.leading.equalToSuperview().inset(16)
        }
        
        cellView.addSubview(divider)
        divider.backgroundColor = UIColor(red: 0.73, green: 0.73, blue: 0.73, alpha: 1.0)
        divider.snp.makeConstraints {
            $0.bottom.equalToSuperview()
            $0.leading.trailing.equalToSuperview().inset(15)
            $0.height.equalTo(1)
        }
        
        switch cell.rightElement {
            case RightElement.Switch:
                let switchView = UISwitch()
                cellView.addSubview(switchView)
                switchView.snp.makeConstraints {
                    $0.trailing.equalToSuperview().inset(15)
                    $0.top.equalToSuperview().inset(14)
                }
            case RightElement.Arrow:
                let arrow = UIImageView()
                cellView.addSubview(arrow)
                arrow.image = UIImage(named: "forward arrow")
                arrow.snp.makeConstraints {
                    $0.trailing.equalToSuperview().inset(16)
                    $0.top.equalToSuperview().inset(16)
                    $0.height.width.equalTo(24)
                }
            case RightElement.Nothing:
                break
        }
        
        return cellView
    }
    
    func getTextColor(isExit: Bool) -> UIColor {
        if isExit {
            return UIColor(red: 1.0, green: 0.32, blue: 0.32, alpha: 1.0)
        } else {
            return UIColor(red: 0.22, green: 0.22, blue: 0.22, alpha: 1.0)
        }
    }

    private func configureCells() {
        let cellArray: [Cell] = [
            Cell(text: "Push уведомления", textColor: getTextColor(isExit: false), rightElement: RightElement.Switch),
            Cell(text: "Изменить пароль", textColor: getTextColor(isExit: false), rightElement: RightElement.Arrow),
            Cell(text: "Изменить код быстрого доступа", textColor: getTextColor(isExit: false), rightElement: RightElement.Arrow),
            Cell(text: "Вход с Face/Touch ID", textColor: getTextColor(isExit: false), rightElement: RightElement.Switch),
            Cell(text: "Изменить номер телефона", textColor: getTextColor(isExit: false), rightElement: RightElement.Arrow),
            Cell(text: "Выход", textColor: getTextColor(isExit: true), rightElement: RightElement.Nothing)
        ]
        
        var previousCell: UIView = line
        for i in 0...(cellArray.count - 1) {
            let cellView = createCell(cell: cellArray[i], topView: previousCell)
            if i == 1 {
                let gesture = UITapGestureRecognizer(target: self, action:  #selector(self.checkAction))
                cellView.addGestureRecognizer(gesture)
            }
            previousCell = cellView
        }
    }
    
    @objc func checkAction(sender : UITapGestureRecognizer) {
        let rootVC = ChangePasswordViewController()
        let navVC = UINavigationController(rootViewController: rootVC)
        navVC.modalPresentationStyle = .fullScreen
        present(navVC, animated: true)
    }
    
}

extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey(rawValue: "UIImagePickerControllerEditedImage")] as? UIImage {
            imageView.image = image
        }
        picker.dismiss(animated: true, completion: nil)
    }

    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
}


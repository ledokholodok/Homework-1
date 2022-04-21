//
//  ViewController.swift
//  Homework 1. Task 1.
//
//  Created by Lidiya Karnaukhova on 10.04.2022.
//

import UIKit
import SnapKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    let navigationBar = UINavigationBar()
    let taskTextField = UITextField()
    let taskView = UIView()
    let remindDayView = UIView()
    let remindDayLabel = UILabel()
    let remindDaySwitch = UISwitch()
    let dateView = UIView()
    let dateLabel = UILabel()
    let datePicker = UIDatePicker()
    let dateFormatter = DateFormatter()
    let repeatView = UIView()
    let repeatLabel = UILabel()
    let repeatOption = UILabel()
    let repeatImage = UIImageView()
    let remindLocationView = UIView()
    let remindLocationLabel = UILabel()
    let remindLocationSwitch = UISwitch()
    let priorityView = UIView()
    let priorityLabel = UILabel()
    let prioritySegmentedControl = UISegmentedControl()
    let notesView = UIView()
    let notesLabel = UILabel()
    let segments = ["None", "!", "!!", "!!!"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray6
        taskTextField.delegate = self
        configureNavigationBar()
        configureTaskTextField()
        configureRemindDayView()
        configureDateView()
        conifigureDatePicker()
        configureRepeatView()
        configureRemindLocationView()
        configurePriorityView()
        configureNotesView()
    }
    
    private func configureNavigationBar() {
        view.addSubview(navigationBar)
        navigationBar.backgroundColor = .white
        let leftBarButton = UIBarButtonItem(title: "Done", style: .plain, target: ViewController.self, action: #selector(doneTapped))
        navigationItem.leftBarButtonItem = leftBarButton
        navigationItem.title = "Create Reminder"
        let rightBarButton = UIBarButtonItem(title: "Cancel", style: .plain, target: ViewController.self,  action: #selector(cancelTapped))
        navigationItem.rightBarButtonItem = rightBarButton
        
        navigationBar.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
        }
    }
    
    @objc func doneTapped(_ sender: UIBarButtonItem) {
        print("Done")
    }
    
    @objc func cancelTapped(_ sender: UIBarButtonItem) {
        print("Cancel")
    }
    
    private func configureTaskTextField() {
        view.addSubview(taskView)
        taskView.backgroundColor = .white
        taskView.addSubview(taskTextField)
        taskTextField.backgroundColor = .white
        taskTextField.placeholder = "Enter the task"
        
        taskTextField.snp.makeConstraints {
            $0.top.trailing.bottom.equalToSuperview()
            $0.leading.equalToSuperview().offset(15)
        }
        
        taskView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(34)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(44)
        }
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        taskTextField.endEditing(true)
        return true
    }
    
    private func configureRemindDayView() {
        view.addSubview(remindDayView)
        remindDayView.backgroundColor = .white
        
        remindDayView.addSubview(remindDayLabel)
        remindDayLabel.text = "Remind me on a day"
        
        remindDayView.addSubview(remindDaySwitch)
        remindDaySwitch.addTarget(self, action: #selector(self.switchValueDidChange), for: .valueChanged)
        
        remindDayLabel.snp.makeConstraints {
            $0.top.trailing.bottom.equalToSuperview()
            $0.leading.equalToSuperview().offset(15)
        }
        
        remindDaySwitch.snp.makeConstraints {
            $0.top.equalToSuperview().inset(6)
            $0.trailing.equalToSuperview().inset(15)
            $0.bottom.equalToSuperview()
        }
        
        remindDayView.snp.makeConstraints {
            $0.top.equalTo(taskView.snp.bottom).offset(34)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(44)
        }
    }
    
    @objc func switchValueDidChange(sender:UISwitch!) {
            print("Remind")
    }
    
    private func configureDateView() {
        view.addSubview(dateView)
        dateView.backgroundColor = .white
        
        dateView.addSubview(dateLabel)
        configureDateLabel()

        dateLabel.snp.makeConstraints {
            $0.top.trailing.bottom.equalToSuperview()
            $0.leading.equalToSuperview().offset(15)
        }
        
        dateView.snp.makeConstraints {
            $0.top.equalTo(remindDayView.snp.bottom).offset(1)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(44)
        }
    }
    
    private func configureDateLabel() {
        dateFormatter.locale = Locale(identifier: "en_us")
        dateFormatter.dateFormat = "EEEE, MMM d, yyyy, h:mm a"
        datePicker.addTarget(self, action: #selector(datePickerChanged(picker:)), for: .valueChanged)
        dateLabel.text = dateFormatter.string(from: datePicker.date)
        dateLabel.textColor = .systemBlue
    }
    
    private func conifigureDatePicker() {
        view.addSubview(datePicker)
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.backgroundColor = .white
        datePicker.locale = Locale(identifier: "en_us")
        
        datePicker.snp.makeConstraints {
            $0.top.equalTo(dateView.snp.bottom).offset(1)
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
        }
    }

    @objc func datePickerChanged(picker: UIDatePicker) {
        dateLabel.text = dateFormatter.string(from: datePicker.date)
        print(dateLabel.text!)
    }
    
    private func configureRepeatView() {
        view.addSubview(repeatView)
        repeatView.backgroundColor = .white
        
        repeatView.addSubview(repeatLabel)
        repeatLabel.text = "Repeat"
        
        repeatView.addSubview(repeatOption)
        repeatOption.text = "Never"
        repeatOption.textColor = .gray
        
        repeatView.addSubview(repeatImage)
        repeatImage.image = UIImage(systemName: "chevron.forward")
        repeatImage.tintColor = .gray
        
        repeatLabel.snp.makeConstraints {
            $0.top.trailing.bottom.equalToSuperview()
            $0.leading.equalToSuperview().offset(15)
        }
        
        repeatOption.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
        
        repeatImage.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(15)
            $0.top.bottom.equalTo(repeatLabel).inset(14)
            $0.leading.equalTo(repeatOption.snp_trailingMargin).offset(10)
        }
        
        repeatView.snp.makeConstraints {
            $0.top.equalTo(datePicker.snp.bottom).offset(1)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(44)
        }
        
    }
    
    private func configureRemindLocationView() {
        view.addSubview(remindLocationView)
        remindLocationView.backgroundColor = .white
        
        remindLocationView.addSubview(remindLocationLabel)
        remindLocationLabel.text = "Remind me at a location"
        
        remindLocationView.addSubview(remindLocationSwitch)
        remindLocationSwitch.addTarget(self, action: #selector(self.switchValueDidChange), for: .valueChanged)
        
        remindLocationLabel.snp.makeConstraints {
            $0.top.trailing.bottom.equalToSuperview()
            $0.leading.equalToSuperview().offset(15)
        }
        
        remindLocationSwitch.snp.makeConstraints {
            $0.top.equalToSuperview().inset(6)
            $0.trailing.equalToSuperview().inset(15)
            $0.bottom.equalToSuperview()
        }
        
        remindLocationView.snp.makeConstraints {
            $0.top.equalTo(repeatView.snp.bottom).offset(34)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(44)
        }
    }
    
    private func configurePriorityView() {
        view.addSubview(priorityView)
        priorityView.backgroundColor = .white
        
        priorityView.addSubview(priorityLabel)
        priorityLabel.text = "Priority"
        
        priorityView.addSubview(prioritySegmentedControl)
        configureSegmentedControl()
        
        priorityLabel.snp.makeConstraints {
            $0.top.trailing.bottom.equalToSuperview()
            $0.leading.equalToSuperview().offset(15)
        }
        
        prioritySegmentedControl.snp.makeConstraints {
            $0.leading.equalTo(priorityView.snp_centerXWithinMargins)
            $0.trailing.equalToSuperview().inset(10)
            $0.centerYWithinMargins.equalTo(priorityView.snp_centerYWithinMargins)
        }
        
        priorityView.snp.makeConstraints {
            $0.top.equalTo(remindLocationView.snp.bottom).offset(34)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(44)
        }
    }
    
    private func configureSegmentedControl() {
        prioritySegmentedControl.selectedSegmentTintColor = .systemBlue
        let titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        prioritySegmentedControl.setTitleTextAttributes(titleTextAttributes, for: .selected)
        prioritySegmentedControl.layer.borderWidth = 1
        prioritySegmentedControl.layer.borderColor = UIColor.systemBlue.cgColor
        prioritySegmentedControl.addTarget(self, action: #selector(self.priorityChanged), for:.valueChanged)
        
        for segment in segments {
            prioritySegmentedControl.insertSegment(withTitle: segment, at: prioritySegmentedControl.numberOfSegments, animated: false)
        }
    }
    
    @objc func priorityChanged(sender: UISegmentedControl) {
        print(segments[sender.selectedSegmentIndex])
    }
    
    private func configureNotesView() {
        view.addSubview(notesView)
        notesView.backgroundColor = .white
        
        notesView.addSubview(notesLabel)
        notesLabel.text = "Notes"
        
        notesLabel.snp.makeConstraints {
            $0.top.trailing.equalToSuperview()
            $0.leading.equalToSuperview().offset(15)
            $0.bottom.equalTo(notesView.snp_centerYWithinMargins)
        }
        
        notesView.snp.makeConstraints {
            $0.top.equalTo(priorityView.snp.bottom).offset(1)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(88)
            $0.bottom.equalToSuperview().inset(10)
        }
    }
}



//
//  ViewController.swift
//  Tipsy
//
//  Created by Sergey on 05.02.2023.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    //MARK: - Variables
    
    var buttons = ButtonsProperty()
    var labels = LabelProperty()
    
    //MARK: - Views and StackViews
    
    lazy var totalStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 26.0
        stack.alignment = .fill
        stack.contentMode = .scaleToFill
        stack.distribution = .fillProportionally
        [billTotalLabel,
        totalTextField].forEach {
            stack.addArrangedSubview($0)
        }
        return stack
    }()
    
    lazy var parameterStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 10.0
        stack.alignment = .fill
        stack.contentMode = .scaleToFill
        stack.distribution = .fillProportionally
        [percentageTitleLabel,
        percentageHorizontalStackView,
        splitTitleLabel,
        splitHorizontalStackView].forEach {
            stack.addArrangedSubview($0)
        }
        return stack
    }()
    
    lazy var percentageHorizontalStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 10.0
        stack.alignment = .fill
        stack.contentMode = .scaleToFill
        stack.distribution = .fillEqually
        [zeroPercentButton,
        tenPercentButton,
        twentyPercentButton].forEach{
            stack.addArrangedSubview($0)
        }
        return stack
    }()
    
    lazy var splitHorizontalStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 10.0
        stack.alignment = .fill
        stack.contentMode = .scaleToFill
        stack.distribution = .fillEqually
        [splitValueLabel,
        stepper].forEach {
            stack.addArrangedSubview($0)
        }
        return stack
    }()
    
    lazy var calculateView: UIView = {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 120, height: 300))
        view.backgroundColor = #colorLiteral(red: 0.8431372549, green: 0.9764705882, blue: 0.9215686275, alpha: 1)
        view.addSubview(parameterStackView)
        view.addSubview(calculateButton)
        return view
    }()
    
    //MARK: - UIButtons
    
    lazy var calculateButton: UIButton = {
        let button = UIButton(frame: buttons.calcButtonFrame)
        button.setTitle("Calculate", for: .normal)
        button.backgroundColor = buttons.calcButtonColor
        button.setTitleColor(buttons.calcButtonTextColor, for: .normal)
        button.titleLabel?.font = buttons.calcButtonFont
        button.titleLabel?.numberOfLines = 1
        button.addTarget(self, action: #selector(calcButtonTapped), for: .touchUpInside)
        return button
    }()
    
    lazy var zeroPercentButton: UIButton = {
        let button = UIButton(frame: buttons.percentButtonFrame)
        button.setTitle("0%", for: .normal)
        button.backgroundColor = buttons.percentButtonNotSelectedColor
        button.setTitleColor(buttons.percentButtonTextNotSelectedColor, for: .normal)
        button.titleLabel?.font = buttons.percentButtonFont
        button.titleLabel?.numberOfLines = 1
        button.addTarget(self, action: #selector(percentButtonTapped), for: .touchUpInside)
        return button
    }()
    
    lazy var tenPercentButton: UIButton = {
        let button = UIButton(frame: buttons.percentButtonFrame)
        button.setTitle("10%", for: .normal)
        button.backgroundColor = buttons.percentButtonNotSelectedColor
        button.setTitleColor(buttons.percentButtonTextNotSelectedColor, for: .normal)
        button.titleLabel?.font = buttons.percentButtonFont
        button.titleLabel?.numberOfLines = 1
        button.addTarget(self, action: #selector(percentButtonTapped), for: .touchUpInside)
        return button
    }()
    
    lazy var twentyPercentButton: UIButton = {
        let button = UIButton(frame: buttons.percentButtonFrame)
        button.setTitle("20%", for: .normal)
        button.backgroundColor = buttons.percentButtonNotSelectedColor
        button.setTitleColor(buttons.percentButtonTextNotSelectedColor, for: .normal)
        button.titleLabel?.font = buttons.percentButtonFont
        button.titleLabel?.numberOfLines = 1
        button.addTarget(self, action: #selector(percentButtonTapped), for: .touchUpInside)
        return button
    }()
    
    //MARK: - UITextFields
    
    lazy var totalTextField: UITextField = {
        let text = UITextField()
        text.textAlignment = .left
        text.placeholder = "e.g 123.45"
        text.textColor = #colorLiteral(red: 0, green: 0.6901960784, blue: 0.4196078431, alpha: 1)
        text.borderStyle = .none
        text.backgroundColor = .white
        text.font = UIFont.systemFont(ofSize: 40.0, weight: .regular)
        return text
    }()
    
    //MARK: - UILabels
    
    lazy var billTotalLabel: UILabel = {
        let label = UILabel(frame: labels.billLabelFrame)
        label.text = "Enter bill total"
        label.textColor = labels.billLTextColor
        label.font = labels.billLabelFont
        label.textAlignment = .left
        return label
    }()
    
    lazy var percentageTitleLabel: UILabel = {
        let label = UILabel(frame: labels.percentageTitleLabelFrame)
        label.text = "Select tip"
        label.font = labels.percentageTitleLabelFont
        label.textColor = labels.percentageTitleTextColor
        label.textAlignment = .left
        return label
    }()
    
    lazy var splitTitleLabel: UILabel = {
        let label = UILabel(frame: labels.splitTitleLabelFrame)
        label.text = "Choose Split"
        label.font = labels.splitTitleLabelFont
        label.textColor = labels.splitTitleTextColor
        label.textAlignment = .left
        return label
    }()
    
    lazy var splitValueLabel: UILabel = {
        let label = UILabel(frame: labels.splitValueTitleLabelFrame)
        label.text = "1"
        label.font = labels.splitValueTitleLabelFont
        label.textColor = labels.splitValueTitleTextColor
        label.textAlignment = .center
        return label
    }()
    
    //MARK: - Other UI elements
    
    lazy var stepper: UIStepper = {
        let step = UIStepper()
        step.maximumValue = 10
        step.minimumValue = 1
        step.wraps = true
        step.autorepeat = true
        step.addTarget(self, action: #selector(stepperChanged), for: .valueChanged)
        return step
    }()
    
    //MARK: - ViewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(totalStackView)
        view.addSubview(calculateView)
        setupConstraints()
    }
    
    //MARK: - Setup constraints
    
    func setupConstraints() {
        
        totalStackView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(100)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.height.equalTo(104)
        }
        calculateView.snp.makeConstraints { make in
            make.top.equalTo(totalStackView.snp.bottom)
            make.trailing.equalToSuperview()
            make.leading.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
        calculateButton.snp.makeConstraints { make in
            make.height.equalTo(54)
            make.trailing.equalToSuperview().offset(-80)
            make.leading.equalToSuperview().offset(80)
            make.centerX.equalTo(calculateView)
            make.bottom.equalTo(calculateView).offset(-20)
        }
        
        totalTextField.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.trailing.equalToSuperview().offset(-80)
            make.leading.equalToSuperview().offset(80)
        }
        
        billTotalLabel.snp.makeConstraints { make in
            make.height.equalTo(30)
            make.leading.equalTo(40)
        }
        
        totalTextField.snp.makeConstraints { make in
            make.height.equalTo(48)
            make.leading.equalTo(80)
        }
        
        parameterStackView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.width.equalTo(calculateView.snp.width).offset(-80)
            make.top.equalTo(calculateView.snp.top).offset(80)
        }
        
        stepper.snp.makeConstraints { make in
            make.height.equalTo(29)
            make.width.equalTo(93)
        }
        
        splitValueLabel.snp.makeConstraints { make in
            make.height.equalTo(29)
            make.width.equalTo(93)
        }
        
        zeroPercentButton.snp.makeConstraints { make in
            make.width.equalTo(101)
        }
        
        tenPercentButton.snp.makeConstraints { make in
            make.width.equalTo(101)
        }
        
        twentyPercentButton.snp.makeConstraints { make in
            make.width.equalTo(101)
        }
        
    }
    
    //MARK: - Methods

    @objc func calcButtonTapped(_ sender: UIButton) {
        goToResultVC()
    }
    
    @objc func stepperChanged(_ sender: UIStepper) {
        let value = sender.value
        splitValueLabel.text = String(format: "%.0f", value)
    }
    
    @objc func percentButtonTapped(_ sender: UIButton) {
        
        let buttonsArray: [UIButton] = [zeroPercentButton, tenPercentButton, twentyPercentButton]
        for button in buttonsArray {
            if sender == button {
                sender.setTitleColor(buttons.percentButtonTextSelectedColor, for: .normal)
                sender.backgroundColor = buttons.percentButtonSelectedColor
            } else {
                button.setTitleColor(buttons.percentButtonTextNotSelectedColor, for: .normal)
                button.backgroundColor = buttons.percentButtonNotSelectedColor
            }
        }
        
    }
    
    func goToResultVC() {
        let secondVC = ResultViewController()
        secondVC.modalPresentationStyle = .fullScreen
        dismiss(animated: true)
        self.present(secondVC, animated: true, completion: nil)
    }
    

}


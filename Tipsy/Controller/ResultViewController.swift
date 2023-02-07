//
//  ResultViewController.swift
//  Tipsy
//
//  Created by Sergey on 05.02.2023.
//

import UIKit
import SnapKit

class ResultViewController: UIViewController {

    //MARK: - Variable
    
    var percentage: Double?
    var split: Int?
    var result: Double?
    
    var labels = LabelProperty()
    var buttons = ButtonsProperty()
    
    //MARK: - UIView and UIStackView
    
    lazy var resultView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.8431372549, green: 0.9764705882, blue: 0.9215686275, alpha: 1)
        view.addSubview(totalResultLabel)
        view.addSubview(totalResultValueLabel)
        return view
    }()
    
    //MARK: - UIButton
    
    lazy var recalculateButton: UIButton = {
        let button = UIButton(frame: buttons.calcButtonFrame)
        button.setTitle("Recalculate", for: .normal)
        button.backgroundColor = buttons.calcButtonColor
        button.setTitleColor(buttons.calcButtonTextColor, for: .normal)
        button.titleLabel?.font = buttons.calcButtonFont
        button.titleLabel?.numberOfLines = 1
        button.addTarget(self, action: #selector(recalcButtonTapped), for: .touchUpInside)
        return button
    }()
    
    //MARK: - UILabel
    
    lazy var totalResultLabel: UILabel = {
        let label = UILabel(frame: labels.totalResultTitleLabelFrame)
        label.text = "Total per person"
        label.textAlignment = .center
        label.font = labels.totalResultTitleLabelFont
        label.textColor = labels.totalResultTitleTextColor
        return label
    }()
    
    lazy var totalResultValueLabel: UILabel = {
        let label = UILabel(frame: labels.totalResultValueLabelFrame)
        label.text = String(result ?? 0)
        label.textAlignment = .center
        label.font = labels.totalResultValueLabelFont
        label.textColor = labels.totalResultValueTextColor
        label.numberOfLines = 1
        return label
    }()
    
    lazy var settingsTitleLabel: UILabel = {
        let label = UILabel(frame: labels.settingsTitleLabelFrame)
        label.text = "Split between \(split ?? 0) people, with \(percentage ?? 0)% tip."
        label.textAlignment = .center
        label.font = labels.settingsTitleLabelFont
        label.textColor = labels.settingsTitleLabelTextColor
        label.numberOfLines = 0
        return label
    }()
    
    //MARK: - Other UI elements
    
    //MARK: - ViewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(resultView)
        view.addSubview(settingsTitleLabel)
        view.addSubview(recalculateButton)
        setupConstraints()
        
    }
    
    //MARK: - Setup Constraints

    func setupConstraints() {
        
        recalculateButton.snp.makeConstraints { make in
            make.height.equalTo(54)
            make.trailing.equalToSuperview().offset(-80)
            make.leading.equalToSuperview().offset(80)
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().offset(-20)
        }
        
        totalResultLabel.snp.makeConstraints { make in
            make.trailing.equalToSuperview()
            make.leading.equalToSuperview()
            make.top.equalTo(resultView.snp.top).offset(80)
        }
        
        resultView.snp.makeConstraints { make in
            make.trailing.equalToSuperview()
            make.leading.equalToSuperview()
            make.height.equalTo(300)
        }
        
        totalResultValueLabel.snp.makeConstraints { make in
            make.top.equalTo(totalResultLabel.snp.bottom).offset(40)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
        }
        
        settingsTitleLabel.snp.makeConstraints { make in
            make.trailing.equalToSuperview()
            make.leading.equalToSuperview()
            make.centerY.equalToSuperview()
        }
        
    }
    
    //MARK: - Methods
    
    @objc func recalcButtonTapped(_ sender: UIButton) {
        
        goToFirstVC()
        
    }
    
    func goToFirstVC() {
        let firstVC = ViewController()
        firstVC.modalPresentationStyle = .fullScreen
        dismiss(animated: true)
        self.present(firstVC, animated: true, completion: nil)
    }

}

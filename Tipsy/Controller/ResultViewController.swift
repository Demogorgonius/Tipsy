//
//  ResultViewController.swift
//  Tipsy
//
//  Created by Sergey on 05.02.2023.
//

import UIKit

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
        view.addSubview(resultView)
        view.addSubview(settingsTitleLabel)
        view.addSubview(recalculateButton)
        setupConstraints()
        
    }
    
    //MARK: - Setup Constraints

    func setupConstraints() {
        
    }
    
    //MARK: - Methods
    
    @objc func recalcButtonTapped(_ sender: UIButton) {
        
    }

}

//
//  ViewController.swift
//  ebukharev_1PW2
//
//  Created by Евгений Бухарев on 10.10.2023.
//

import UIKit

final class WishMakerViewController: UIViewController {
    
    enum Constants {
            static let sliderMin: Double = 0
            static let sliderMax: Double = 1
            
            static let red: String = "Red"
            static let blue: String = "Blue"
            static let green: String = "Green"
            
            static let titleFont: Double = 32
            static let titleLeading: CGFloat = 30
            static let titleTop: CGFloat = 30
            static let titleText: String = "WishMaker"
            
            static let colorAlpha: Double = 1.0
            
            static let descriptionFont: Double = 24
            static let descriptionLeading: CGFloat = 30
            static let descriptionTop: CGFloat = 24
            static let descriptionText: String = "Close your eyes and make a wish."
            
            static let stackRadius: CGFloat = 24
            static let stackBottom: CGFloat = -70
            static let stackLeading: CGFloat = 20
            
            static let buttonText: String = "Hide button"
            static let buttonBottom: CGFloat = -35
            
        }
        
        private let stack: UIStackView = UIStackView()
        private let button: UIButton = UIButton()
        private let titleView = UILabel()
        private let desciprionView = UILabel()
        private var currentRed:CGFloat = 0
        private var currentGreen:CGFloat = 0
        private var currentBlue:CGFloat = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }

    
    private func configureUI() {
        view.backgroundColor = .systemIndigo
        
        configureTitle()
        configureDescription()
        configureSliders()
        configureButton()
    }
    
    private func configureTitle() {
        titleView.translatesAutoresizingMaskIntoConstraints = false
        titleView.text = Constants.titleText
        titleView.font = UIFont.systemFont(ofSize: Constants.titleFont, weight: .bold)
        
        view.addSubview(titleView)
        NSLayoutConstraint.activate([
            titleView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            titleView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30)
        ])
    }
    
    private func configureDescription() {
        let description = UILabel()
        description.translatesAutoresizingMaskIntoConstraints = false
        description.text = Constants.descriptionText
        description.font = UIFont.boldSystemFont(ofSize: Constants.descriptionFont)
        description.textColor = UIColor.black
        
        view.addSubview(description)
        NSLayoutConstraint.activate([
            description.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            description.topAnchor.constraint(equalTo: titleView.bottomAnchor, constant: Constants.descriptionTop)
        ])
    }

    private func configureSliders() {
        
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        view.addSubview(stack)
        stack.layer.cornerRadius = Constants.stackRadius
        stack.clipsToBounds = true
        
        let sliderRed = CustomSlider(title: Constants.red, min: Constants.sliderMin, max: Constants.sliderMax)
        sliderRed.slider.value = Float(currentRed)
        let sliderBlue = CustomSlider(title: Constants.blue, min: Constants.sliderMin, max: Constants.sliderMax)
        sliderBlue.slider.value = Float(currentBlue)
        let sliderGreen = CustomSlider(title: Constants.green, min: Constants.sliderMin, max: Constants.sliderMax)
        sliderGreen.slider.value = Float(currentGreen)
        
        for slider in [sliderRed, sliderBlue, sliderGreen] {
            stack.addArrangedSubview(slider)
        }
        
        NSLayoutConstraint.activate([
            stack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constants.stackLeading),
            stack.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: Constants.stackBottom)
        ])
        
        sliderRed.valueChanged = { [weak self] value in
                    self?.view.backgroundColor = UIColor(red: CGFloat(sliderRed.slider.value), green: self!.currentGreen, blue: self!.currentBlue, alpha: Constants.colorAlpha)
                    self?.currentRed = CGFloat(sliderRed.slider.value)
                }
                
        sliderBlue.valueChanged = { [weak self] value in
                    self?.view.backgroundColor = UIColor(red: self!.currentRed, green: self!.currentGreen, blue: CGFloat(sliderBlue.slider.value), alpha: Constants.colorAlpha)
                    self?.currentBlue = CGFloat(sliderBlue.slider.value)
                }
                
        sliderGreen.valueChanged = { [weak self] value in
                    self?.view.backgroundColor = UIColor(red: self!.currentRed, green: CGFloat(sliderGreen.slider.value), blue: self!.currentBlue, alpha: Constants.colorAlpha)
                    self?.currentGreen = CGFloat(sliderGreen.slider.value)
                }
    }
    
    @objc func hideSlider(){
        stack.isHidden = !stack.isHidden
    }
    
    private func configureButton(){
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(Constants.buttonText, for: .normal)
        button.backgroundColor = .blue
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(hideSlider), for: .touchDown)
        button.layer.cornerRadius = Constants.stackRadius

        view.addSubview(button)
        
        NSLayoutConstraint.activate([
            button.rightAnchor.constraint(equalTo: view.rightAnchor),
            button.leftAnchor.constraint(equalTo: view.leftAnchor),
            button.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: Constants.buttonBottom)
        ])
    }
}


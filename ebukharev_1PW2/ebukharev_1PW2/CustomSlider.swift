//
//  CustomSlider.swift
//  ebukharev_1PW2
//
//  Created by Евгений Бухарев on 12.10.2023.
//

import UIKit

final class CustomSlider: UIView {
    var valueChanged: ((Double) -> Void)?
    
    enum SliderConstants{
        static let titleTop: CGFloat = 10
        static let titleLeft: CGFloat = 20
        
        static let sliderBottom: CGFloat = -10
        static let sliderLeft: CGFloat = 20
    }
    
    var slider = UISlider()
    var titleView = UILabel()
    init(title: String, min: Double, max: Double) {
        super.init(frame: .zero)
        titleView.text = title
        slider.minimumValue = Float(min)
        slider.maximumValue = Float(max)
        slider.addTarget(self, action: #selector(sliderValueChanged), for: .valueChanged)
        configureUI()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureUI() {
        backgroundColor = .white
        translatesAutoresizingMaskIntoConstraints = false
        
        for view in [slider, titleView] {
            addSubview(view)
            view.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            titleView.centerXAnchor.constraint(equalTo: centerXAnchor),
            titleView.topAnchor.constraint(equalTo: topAnchor, constant: SliderConstants.titleTop),
            titleView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: SliderConstants.titleLeft),
            
            slider.topAnchor.constraint(equalTo: titleView.bottomAnchor),
            slider.centerXAnchor.constraint(equalTo: centerXAnchor),
            slider.bottomAnchor.constraint(equalTo: bottomAnchor, constant: SliderConstants.sliderBottom),
            slider.leadingAnchor.constraint(equalTo: leadingAnchor, constant: SliderConstants.sliderLeft)
        ])
    }
    
    @objc
    private func sliderValueChanged() {
        valueChanged!(Double(slider.value))
    }
    
}

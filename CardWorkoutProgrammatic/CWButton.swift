//
//  CWButton.swift
//  CardWorkoutProgrammatic
//
//  Created by Yeldar Kaisabekov on 11.03.2023.
//

import UIKit

class CWButton : UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(backgroundCOlor: UIColor, title: String){
        super.init(frame: .zero)
        self.backgroundColor = backgroundCOlor
        setTitle(title, for: .normal)
        configure()
    }
    
    func configure(){
        layer.cornerRadius = 8
        titleLabel?.font = UIFont.systemFont(ofSize: 19, weight: .bold)
        setTitleColor(.white, for: .normal)
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}

//
//  TopControlView.swift
//  MatchingApp
//
//  Created by ヤハタ・マサカズ on 2021/02/10.
//

import UIKit
import RxCocoa
import RxSwift


class TopControlView : UIView {
    
    private let disposedbag = DisposeBag()
    
    let tinderButton = createTopButton(imageName: "update_selected", unselectedImage: "update")
    let goodButton = createTopButton(imageName: "momo_selected", unselectedImage: "momo")
    let commentButton = createTopButton(imageName: "momo_selected", unselectedImage: "momo")
    let profileButton = createTopButton(imageName: "momo_selected", unselectedImage: "momo")
    
    static func  createTopButton(imageName: String, unselectedImage: String) -> UIButton {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: imageName), for: .selected)
        button.setImage(UIImage(named: unselectedImage), for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        return button
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setuplayout()
        setupBindings()
        
    }
    
    private func setuplayout() {
        let baseStackView = UIStackView(arrangedSubviews: [tinderButton, goodButton, commentButton, profileButton])
        baseStackView.axis = .horizontal
        baseStackView.distribution = .fillEqually
        baseStackView.spacing = 43
        baseStackView.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(baseStackView)
        
        baseStackView.anchor(top: topAnchor, bottom: bottomAnchor, left: leftAnchor, right: rightAnchor, leftPadding: 40, rightPadding: 40)
        
//        [
//            baseStackView.topAnchor.constraint(equalTo: topAnchor),
//            baseStackView.bottomAnchor.constraint(equalTo: bottomAnchor),
//            baseStackView.leftAnchor.constraint(equalTo: leftAnchor, constant: 40),
//            baseStackView.rightAnchor.constraint(equalTo: rightAnchor, constant: -40),
//
//
//        ].forEach {$0.isActive = true}
        
        tinderButton.isSelected = true
    }
    
    private func setupBindings() {
        tinderButton.rx.tap
            .asDriver()
            .drive(onNext: { [weak self] _ in
                guard let self = self else { return }
                self.handleSelectedButton(selectedButton: self.tinderButton)
            })
            .disposed(by: disposedbag)
            
        goodButton.rx.tap
            .asDriver()
            .drive(onNext: { [weak self] _ in
                guard let self = self else { return }
                self.handleSelectedButton(selectedButton: self.goodButton)
            })
            .disposed(by: disposedbag)
        
        commentButton.rx.tap
            .asDriver()
            .drive(onNext: { [weak self] _ in
                guard let self = self else { return }
                self.handleSelectedButton(selectedButton: self.commentButton)
            })
            .disposed(by: disposedbag)
        
        profileButton.rx.tap
            .asDriver()
            .drive(onNext: { [weak self] _ in
                guard let self = self else { return }
                self.handleSelectedButton(selectedButton: self.profileButton)
            })
            .disposed(by: disposedbag)

//            .subscribe { _ in
//                self.handleSelectedButton(selectedButton: self.tinderButton)
//
//            }
//            .disposed(by: disposedbag)
//
//        goodButton.rx.tap
//            .subscribe { _ in
//                self.handleSelectedButton(selectedButton: self.goodButton)
//
//            }
//            .disposed(by: disposedbag)
//
//        commentButton.rx.tap
//            .subscribe { _ in
//                self.handleSelectedButton(selectedButton: self.commentButton)
//
//            }
//            .disposed(by: disposedbag)
//
//        profileButton.rx.tap
//            .subscribe { _ in
//                self.handleSelectedButton(selectedButton: self.profileButton)
//
//            }
//            .disposed(by: disposedbag)
        
    }
    
    private func handleSelectedButton(selectedButton: UIButton) {
        let buttons = [tinderButton, goodButton, commentButton, profileButton]
        
        buttons.forEach { button in
            if button == selectedButton {
                button.isSelected = true
            }  else {
                button.isSelected = false
            }
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

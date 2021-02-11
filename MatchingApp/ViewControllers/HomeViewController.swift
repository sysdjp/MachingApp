//
//  ViewController.swift
//  MatchingApp
//
//  Created by ヤハタ・マサカズ on 2021/01/31.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        let topcontrolView = TopControlView()

        let cardView = CardView()  // cardView
        
        let bottomcontrolview = BottomControlView()
        
        let stackView = UIStackView(arrangedSubviews: [topcontrolView,  cardView, bottomcontrolview])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
//        stackView.distribution = .fillEqually
        
        self.view.addSubview(stackView)
        
        [
            topcontrolView.heightAnchor.constraint(equalToConstant: 100),
            bottomcontrolview.heightAnchor.constraint(equalToConstant: 120),

            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            stackView.leftAnchor.constraint(equalTo: view.leftAnchor),
            stackView.rightAnchor.constraint(equalTo: view.rightAnchor)].forEach {$0.isActive = true}

        // Do any additional setup after loading the view.
    }


}


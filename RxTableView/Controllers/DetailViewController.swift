//
//  DetailViewController.swift
//  RxTableView
//
//  Created by Arifin Firdaus on 1/26/19.
//  Copyright © 2019 Arifin Firdaus. All rights reserved.
//

import UIKit
import SnapKit

class DetailViewController: UIViewController {
    
    fileprivate let label: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = "Label"
        return label
    }()
    
    init(labelText text: String?) {
        super.init(nibName: nil, bundle: nil)
        label.text = text
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupLabel()
    }
    
    fileprivate func setupLabel() {
        view.addSubview(label)
        label.snp.makeConstraints { make in
            make.top.equalTo(view).offset(150)
            make.leading.equalTo(view).offset(20)
            make.trailing.equalTo(view).offset(-20)
        }
    }
    
}

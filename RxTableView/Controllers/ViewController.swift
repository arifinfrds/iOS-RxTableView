//
//  ViewController.swift
//  RxTableView
//
//  Created by Arifin Firdaus on 1/26/19.
//  Copyright © 2019 Arifin Firdaus. All rights reserved.
//

import UIKit
import SnapKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {
    
    fileprivate let tableView: UITableView = {
        let tableView = UITableView(frame: .zero)
        return tableView
    }()
    
    fileprivate let dataSource = Observable.of(["Hello", "World", "Lorem", "ipsum", "THis is RxSwift", "With TableView"])
    fileprivate let cellId = "cellId"
    fileprivate let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupNavigationBar()
        setupTableView()
    }
    
    fileprivate func setupNavigationBar() {
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "RxTableView"
    }
    
    fileprivate func setupTableView() {
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.edges.equalTo(view)
        }
        tableView.register(CustomCell.self, forCellReuseIdentifier: cellId)
        setupTableViewRxItems()
        setupTableViewRxModelSelected()
    }
    
    fileprivate func setupTableViewRxItems() {
        dataSource.asDriver(onErrorJustReturn: [])
            .drive(tableView.rx.items(cellIdentifier: cellId, cellType: CustomCell.self)) { (row, element, cell) in
                cell.textLabel?.text = element
            }
            .disposed(by: disposeBag)
    }
    
    fileprivate func setupTableViewRxModelSelected() {
        tableView.rx.modelSelected(String.self)
            .subscribe(onNext: { [weak self] element in
                self?.navigateToDetailViewController(with: element)
            })
            .disposed(by: disposeBag)
    }
    
    fileprivate func navigateToDetailViewController(with title: String?) {
        let viewController = DetailViewController(labelText: title)
        navigationController?.pushViewController(viewController, animated: true)
    }
}



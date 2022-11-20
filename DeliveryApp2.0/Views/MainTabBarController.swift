//
//  MainTabBarController.swift
//  DeliveryApp2.0
//
//  Created by Iskhak Zhutanov on 19/11/22.
//

import UIKit

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        view.tintColor = .label
        addVCs()
    }
    
    private func addVCs() {
        viewControllers = [setupVCs(viewController: HomeViewController(), imageName: "house"),
                           setupVCs(viewController: HistoryViewController(), imageName: "clock.arrow.circlepath"),
                           setupVCs(viewController: CreateOrderViewController(), imageName: "plus.square"),
                           setupVCs(viewController: ChatsViewController(), imageName: "ellipsis.message"),
                           setupVCs(viewController: ContactsViewController(), imageName: "person")]
    }
    
    private func setupVCs(viewController: UIViewController, imageName: String) -> UIViewController {
        viewController.tabBarItem.image = UIImage(systemName: imageName)
        return viewController
    }
}

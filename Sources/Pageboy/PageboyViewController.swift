//
//  PageboyViewController.swift
//  Pageboy
//
//  Created by Merrick Sapsford on 04/01/2017.
//  Copyright © 2018 UI At Six. All rights reserved.
//

import UIKit

/// A simple, highly informative page view controller.
open class PageboyViewController: UIViewController {
    
    // MARK: Properties
    
    open weak var dataSource: PageboyViewControllerDataSource?
    open weak var delegate: PageboyViewControllerDelegate?
}

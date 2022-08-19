//
//  TextFieldExtensions.swift
//  LoginScreen HW11
//
//  Created by Артур Горлов on 19.08.2022.
//

import UIKit

extension UITextField {

    func setLeftIcon(_ image: UIImage?) {
        let iconView = UIImageView(frame: CGRect(x: 40, y: 4, width: 22, height: 20))
        iconView.image = image
        let iconContainerView: UIView = UIView(frame: CGRect(x: 20, y: 0, width: 80, height: 30))
        iconContainerView.addSubview(iconView)
        leftView = iconContainerView
        leftViewMode = .always
    }

    func setRightIcon(_ image: UIImage?) {
        let iconView = UIImageView(frame: CGRect(x: 25, y: 4, width: 22, height: 20))
        iconView.image = image
        iconView.tintColor = UIColor.systemGreen
        let iconContainerView: UIView = UIView(frame: CGRect(x: 20, y: 0, width: 60, height: 30))
        iconContainerView.addSubview(iconView)
        rightView = iconContainerView
        rightViewMode = .always
    }
}

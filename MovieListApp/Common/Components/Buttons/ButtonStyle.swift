//
//  ButtonStyle.swift
//  MovieListApp
//
//  Created by Valued Customer on 16/08/23.
//

import Foundation
import UIKit

enum ButtonStyle {
   case primary
   case secondary
   case outlined
   
   
   var backgroundColor: UIColor {
       switch self {
       case .primary:
           return Colors.primary
       case .secondary, .outlined:
           return .clear
       }
   }
   
   var disabledBackgroundColor: UIColor {
       return Colors.lightGray
   }
   
   var borderColor: CGColor {
        switch self {
        case .primary, .secondary:
            return Colors.primary.cgColor
        case .outlined:
            return Colors.primary.cgColor
        }
   }
   
   var textColor: UIColor {
       switch self {
       case .primary:
           return .white
       case .secondary:
           return Colors.primary
       case .outlined:
           return Colors.primary
       }
   }
   
   var disabledTextColor: UIColor {
       return Colors.darkGray
   }
   
   var hasBorder: Bool {
       self == .outlined
   }
}

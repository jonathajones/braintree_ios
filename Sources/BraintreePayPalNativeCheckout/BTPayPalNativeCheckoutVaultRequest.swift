//
//  BTPayPalNativeCheckoutVaultRequest.swift
//  BraintreePayPalNativeCheckout
//
//  Created by Jones, Jon on 6/9/22.
//

import Foundation
import BraintreePayPal
/**
 Options for the PayPal Vault flow.
 */
@objc public class BTPayPalNativeVaultRequest: BTPayPalVaultRequest, BTPayPalNativeRequest {

    // MARK: - Public

    /**
     Initializes a PayPal Vault request.

     - Returns: A PayPal Vault request.
     */
  @objc public override init() {
        self.hermesPath = "v1/paypal_hermes/setup_billing_agreement"
        super.init()
    }

    // MARK: - Internal

    let hermesPath: String
}

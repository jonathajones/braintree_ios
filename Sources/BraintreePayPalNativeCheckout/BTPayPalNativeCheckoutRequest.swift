import BraintreePayPal

/**
 Options for the PayPal Checkout and PayPal Checkout with Vault flows.
 */
@objc public class BTPayPalNativeCheckoutRequest: BTPayPalCheckoutRequest, BTPayPalNativeRequest {

    // MARK: - Public

    /**
     Initializes a PayPal Checkout request.

     - Parameter amount: Used for a one-time payment. Amount must be greater than or equal to zero, may optionally contain exactly 2 decimal places separated by '.' and is limited to 7 digits before the decimal point.

     - Returns: A PayPal Checkout request.
     */
  @objc public override init(amount: String) {
        self.hermesPath = "v1/paypal_hermes/create_payment_resource"
        super.init(amount: amount)
    }

    // MARK: - Internal

    let hermesPath: String

    var intentAsString: String {
        switch intent {
        case .sale:
            return "sale"
        case .order:
            return "order"
        default:
            return "authorize"
        }
    }
}

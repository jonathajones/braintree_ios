import BraintreeCore
import PayPalCheckout
import BraintreePayPal

class BTPayPalNativeTokenizationClient {

    private let apiClient: BTAPIClient

    init(apiClient: BTAPIClient) {
        self.apiClient = apiClient
    }

    func tokenize(request: BTPayPalRequest,
                  completion: @escaping (Result<BTPayPalNativeCheckoutAccountNonce, BTPayPalNativeError>) -> Void) {

      apiClient.metadata
        let tokenizationRequest = BTPayPalNativeTokenizationRequest(request: request,
                                                                    correlationID: State.correlationIDs.riskCorrelationID ?? "",
                                                                    clientMetadata: apiClient.metadata)

        apiClient.post("/v1/payment_methods/paypal_accounts", parameters: tokenizationRequest.parameters()) { body, _, error in
            guard let json = body, error == nil else {
                completion(.failure(.tokenizationFailed))
                return
            }

            guard let accountNonce = BTPayPalNativeAccountNonce(json: json) else {
                completion(.failure(.parsingTokenizationResultFailed))
                return
            }

            completion(.success(accountNonce))
        }
    }
}

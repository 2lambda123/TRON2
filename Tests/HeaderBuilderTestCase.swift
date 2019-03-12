//
//  HeaderBuilderTestCase.swift
//  TRON
//
//  Created by Denys Telezhkin on 31.01.16.
//  Copyright © 2016 Denys Telezhkin. All rights reserved.
//

import XCTest
import TRON
import Nimble
import Alamofire

class HeaderBuilderTestCase: ProtocolStubbedTestCase {
    
    func testTronRequestHeaderBuilderAppendsHeaders() {
        let request: APIRequest<Int,APIError> = tron.swiftyJSON.request("status/200")
        request.headers = ["If-Modified-Since":"Sat, 29 Oct 1994 19:43:31 GMT"]
        request.stubStatusCode(200)
        let alamofireRequest = request.performCollectingTimeline(withCompletion: { _ in })
        
        expect(alamofireRequest.request).toEventuallyNot(beNil())
        let headers = alamofireRequest.request?.allHTTPHeaderFields
        
        expect(headers?["If-Modified-Since"]) == "Sat, 29 Oct 1994 19:43:31 GMT"
    }
    
}

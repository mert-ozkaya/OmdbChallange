//
//  AlamofireErrorHandler.swift
//  OmdbChallenge
//
//  Created by mert ozkaya on 22.02.2021.
//

import Foundation
import Alamofire

final class AlamofireErrorHandler {
    
    var error: Error?
    
    init(_ error: Error) {
        self.error = error
    }
    
    func errorFilter() -> String{
        if let error = error as? AFError {
            switch error {
            case .invalidURL(let url):
                return "Invalid URL: \(url) - \(error.localizedDescription)"
            case .parameterEncodingFailed(let reason):
                return "Parameter encoding failed: \(error.localizedDescription) \n Failure Reason: \(reason)"
            case .multipartEncodingFailed(let reason):
                return "Multipart encoding failed: \(error.localizedDescription) \n Failure Reason: \(reason)"
            case .responseValidationFailed(let reason):
                switch reason {
                case .dataFileNil, .dataFileReadFailed:
                    return "Response validation failed: \(error.localizedDescription) \n Failure Reason: \(reason) \n Downloaded file could not be read"
                case .missingContentType(let acceptableContentTypes):
                    return "Response validation failed: \(error.localizedDescription) \n Failure Reason: \(reason) \n Content Type Missing: \(acceptableContentTypes)"
                case .unacceptableContentType(let acceptableContentTypes, let responseContentType):
                    return "Response validation failed: \(error.localizedDescription) \n Failure Reason: \(reason) \n Response content type: \(responseContentType) was unacceptable: \(acceptableContentTypes)"
                case .unacceptableStatusCode(let code):
                    return "Response validation failed: \(error.localizedDescription) \n Failure Reason: \(reason) \n Response status code was unacceptable: \(code)"
                case .customValidationFailed(let code):
                    return "Response validation failed: \(error.localizedDescription) \n Failure Reason: \(reason) \n customValidationFailed code: \(code)"
                }
            case .responseSerializationFailed(let reason):
                return "Response serialization failed: \(error.localizedDescription) \n Failure Reason: \(reason)"
            case .createUploadableFailed(error: let error):
                return "createUploadableFailed: \(error.localizedDescription)"
            case .createURLRequestFailed(error: let error):
                return "createURLRequestFailed: \(error.localizedDescription)"
            case .downloadedFileMoveFailed(error: let error, source: let source, destination: let destination):
                return "Downloaded file move failed: \(error.localizedDescription) \n Failure source: \(source) \n Failure destination: \(destination)"
            case .explicitlyCancelled:
                return "ErrorHandler explicitly cancelled"
            case .parameterEncoderFailed(reason: let reason):
                return "Parameter encoder failed: \(error.localizedDescription) \n Failure Reason: \(reason)"
            case .requestAdaptationFailed(error: let error):
                return "Request adaptation failed: \(error.localizedDescription)"
            case .requestRetryFailed(retryError: let retryError, originalError: let originalError):
                return "Request retry failed: \(retryError.localizedDescription) \n Original error: \(originalError.localizedDescription)"
            case .serverTrustEvaluationFailed(reason: let reason):
                return "Server trust evaluation failed: \(error.localizedDescription) \n Failure Reason: \(reason)"
            case .sessionDeinitialized:
                return "Session deinitialized"
            case .sessionInvalidated(error: let error):
                return "Session invalidated: \(error?.localizedDescription ?? "")"
            case .sessionTaskFailed(error: let error):
                return "Session task failed: \(error.localizedDescription)"
            case .urlRequestValidationFailed(reason: let reason):
                return "Url request validation failed: \(error.localizedDescription) \n Failure Reason:\(reason)"
            }
        } else if let error = error as? URLError {
            return "URLError occurred: \(error)"
        } else {
            return "Unknown error: \(String(describing: error))"
        }
    }
    
}

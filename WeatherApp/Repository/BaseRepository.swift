import Foundation

class BaseRepository {
    
    func handleApiCall<T>(
        response: T?,
        error: ResponseException?,
        completion: @escaping(Resource<T>) -> Void
    ) {
        if (response != nil) && error == nil {
            let successResource = Resource(
                successData: response!
            )
            completion(successResource)
        } else {
            let failureResource = Resource<T>(
                failureData: nil,
                errorCode: error?.errorCode,
                message: error?.message
            )
            completion(failureResource)
        }
    }
}

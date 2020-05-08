#import "JMArtistModelController.h"
#import "JMArtist.h"

// MARK: _@Constants
/**©-------------------------------------------©*/
/// fullURL--? https://api.musixmatch.com/ws/1.1/\artist.search?\q_artist=Metallica\&apikey=c2dfd942d236a20c4d0dba3c3bb12d75
static NSString *const baseURLStr = @"https://api.musixmatch.com/ws/1.1";
static NSString *const artistComponent = @"artist.search";
static NSString *const artistQueryName = @"q_artist";
static NSString *const apiKeyName = @"apikey";
static NSString *const apiKeyValue = @"c2dfd942d236a20c4d0dba3c3bb12d75";
static NSString *const kMsgDictionary = @"message";
static NSString *const kBodyDictionary = @"body";
static NSString *const kArtistList = @"artist_list";
/**©-------------------------------------------©*/

@implementation JMArtistModelController

// MARK: _@fetchArtistForSearchTerm
/**©------------------------------------------------------------------------------©*/
+ (void)fetchArtistForSearchTerm:(NSString *)searchTerm completion:(void (^)(NSArray<JMArtist *> *))completion {
    // 1) - URL
    NSURL *baseURL = [NSURL URLWithString:baseURLStr];
    /// Add our artist component
    NSURL *artistURL = [baseURL URLByAppendingPathComponent:artistComponent];
    /// Create components
    NSURLComponents *urlComponents = [NSURLComponents componentsWithURL:artistURL resolvingAgainstBaseURL:true];

    /// Handling our query items
    NSURLQueryItem *artistQueryItem = [NSURLQueryItem queryItemWithName:artistQueryName value:searchTerm];
    /// Another query item
    NSURLQueryItem *apiQueryItem = [NSURLQueryItem queryItemWithName:apiKeyName value:apiKeyValue];
    urlComponents.queryItems = @[artistQueryItem, apiQueryItem];
    
    /// Getting our final url
    NSURL *fullURL = urlComponents.URL;
    /// Printing our url
    NSLog(@"%@", fullURL);

    // 2) - Data-Task
    [[NSURLSession.sharedSession dataTaskWithURL:fullURL completionHandler:^(NSData *data, NSURLResponse *res, NSError *error) {
    // 3) - Error-Handling
    if (error) {
        NSLog(@"%@", error.localizedDescription);
        completion(nil);
    }
    // 4) - Check for Data
    if (!data) {
        NSLog(@"Error: No data was returned from the data task...");
        completion(nil);
        return;
    }

    // 5) - Decode-Data
    NSDictionary *jsonDict = [NSJSONSerialization JSONObjectWithData:data options:2 error:&error];

    if (!jsonDict || ![jsonDict isKindOfClass:NSDictionary.class]) {
        NSLog(@"Unable to create a dictionary from the data");
        completion(nil);
        return;
    }

    NSDictionary<NSString *, id> *msgDict = jsonDict[kMsgDictionary];
    NSDictionary<NSString *, id> *bodyDict = msgDict[kBodyDictionary];
    NSArray<NSDictionary<NSString *, id> *> *artistDictionary = bodyDict[kArtistList];

    NSMutableArray<JMArtist *> *artistPlaceHolder = NSMutableArray.array;

    for (NSDictionary<NSString *, id> *artistDict in artistDictionary) {
        JMArtist *artist = [JMArtist.alloc initWithDictionary:artistDict];

        [artistPlaceHolder addObject:artist];
    }
    completion(artistPlaceHolder);
    }] resume];
}/// END OF FUNC
/**©------------------------------------------------------------------------------©*/
@end

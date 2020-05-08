#import "JMArtist.h"

// MARK: _@Magic-Strings 🧙🏾‍♂️ Keys
static NSString *const kArtistDict = @"artist";
static NSString *const kArtistName = @"artist_name";
static NSString *const kArtistRating = @"artist_rating";

@implementation JMArtist

// MARK: _@initWithArtistName
/**©------------------------------------------------------------------------------©*/
- (instancetype)initWithArtistName:(NSString *)artistName artistRating:(NSNumber *)artistRating; {
    if ((self = super.init)) {
        _artistName = artistName;
        _artistRating = artistRating;
    }
    return self;
}
/**©------------------------------------------------------------------------------©*/

// MARK: _@initWithDictionary
/**©------------------------------------------------------------------------------©*/
- (instancetype)initWithDictionary:(NSDictionary *)dictionary; {
    /// SubScripting into artist
    NSDictionary <NSString *, id> *artistDict = dictionary[kArtistDict];
    NSString *artistName = artistDict[kArtistName];
    NSNumber *artistRating = artistDict[kArtistRating];

    return [self initWithArtistName:artistName artistRating:artistRating];
}
/**©------------------------------------------------------------------------------©*/
@end

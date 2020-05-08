#import <Foundation/Foundation.h>
@class JMArtist;

NS_ASSUME_NONNULL_BEGIN

@interface JMArtistModelController : NSObject

// MARK: _@Class method-->>
/**©------------------------------------------------------------------------------©*/
+(void) fetchArtistForSearchTerm:(NSString *)searchTerm
                      completion:(void (^) (NSArray <JMArtist *> *_Nullable artist))completion;
/**©------------------------------------------------------------------------------©*/
@end

NS_ASSUME_NONNULL_END

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface JMArtist : NSObject

// MARK: _@Properties
/**©------------------------------------------------------------------------------©*/
@property (nonatomic, copy, readonly) NSString *artistName;
@property (nonatomic, copy, readonly) NSNumber *artistRating;
/**©------------------------------------------------------------------------------©*/

// MARK: _@initWithArtistName
/**©------------------------------------------------------------------------------©*/
-(instancetype)initWithArtistName:(NSString *)artistName
                     artistRating:(NSNumber *)artistRating;
/**©------------------------------------------------------------------------------©*/

// MARK: _@initWithDictionary
/**©------------------------------------------------------------------------------©*/
-(instancetype)initWithDictionary:(NSDictionary *)dictionary;
/**©------------------------------------------------------------------------------©*/
@end

NS_ASSUME_NONNULL_END

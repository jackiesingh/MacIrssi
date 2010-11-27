/*
 * NSAttributedStringAdditions.h
 * Fire
 *
 * Created by Eric Peyton on Thu Apr 22 1999.
 * Copyright (c) 1999-2003 Fire Development Team and/or epicware, Inc.
 * All rights reserved.
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
 */

#import <Foundation/Foundation.h>

@interface NSAttributedString (Additions)
+ (float)stringHeightForAttributes:(NSDictionary *)attributes;
+ (NSAttributedString *)stringWithString:(NSString *)inString;
- (float)heightWithWidth:(float)width;
@end


@interface NSMutableAttributedString (Additions)
- (void)appendString:(NSString*)text foreground:(int)fg background:(int)bg flags:(int)flags attributes:(NSDictionary*)attributes;
- (void)detectURLs:(NSColor*)linkColor;
@end

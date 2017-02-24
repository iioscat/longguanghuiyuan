//
//  LGAlertViewCell.m
//  LGAlertView
//
//
//  The MIT License (MIT)
//
//  Copyright © 2015 Grigory Lutkov <Friend.LGA@gmail.com>
//  (https://github.com/Friend-LGA/LGAlertView)
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.
//

#import "LGAlertViewCell.h"
#import "LGAlertViewSharedPrivate.h"

@interface LGAlertViewCell ()

@property (readwrite) UIView *separatorView;

@end

@implementation LGAlertViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;

        self.textLabel.backgroundColor = UIColor.clearColor;
        self.imageView.backgroundColor = UIColor.clearColor;

        self.separatorView = [UIView new];
        [self addSubview:self.separatorView];

        self.enabled = YES;
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];

    CGFloat frameWidth = CGRectGetWidth(self.frame);
    CGFloat frameHeight = CGRectGetHeight(self.frame);

    // -----

    BOOL imageExists = (self.imageView.image != nil);
    CGSize imageSize = self.imageView.image.size;

    CGFloat textLabelMaxWidth;

    if (imageExists) {
        textLabelMaxWidth = frameWidth-kLGAlertViewPaddingW*2-imageSize.width-kLGAlertViewButtonImageOffsetFromTitle;
    }
    else {
        textLabelMaxWidth = frameWidth-kLGAlertViewPaddingW*2;
    }

    CGRect textLabelFrame = CGRectMake(NSNotFound, kLGAlertViewPaddingH, textLabelMaxWidth, frameHeight-kLGAlertViewPaddingH*2);

    if (self.textLabel.textAlignment == NSTextAlignmentLeft) {
        textLabelFrame.origin.x = kLGAlertViewPaddingW;

        if (imageExists && self.iconPosition == LGAlertViewButtonIconPositionLeft) {
            textLabelFrame.origin.x += imageSize.width + kLGAlertViewButtonImageOffsetFromTitle;
        }
    }
    else if (self.textLabel.textAlignment == NSTextAlignmentRight) {
        textLabelFrame.origin.x = frameWidth - textLabelMaxWidth - kLGAlertViewPaddingW;

        if (imageExists && self.iconPosition == LGAlertViewButtonIconPositionRight) {
            textLabelFrame.origin.x -= (imageSize.width + kLGAlertViewButtonImageOffsetFromTitle);
        }
    }
    else {
        textLabelFrame.origin.x = frameWidth/2.0 - textLabelMaxWidth/2.0;

        if (imageExists) {
            if (self.iconPosition == LGAlertViewButtonIconPositionLeft) {
                textLabelFrame.origin.x += imageSize.width/2.0 + kLGAlertViewButtonImageOffsetFromTitle/2.0;
            }
            else {
                textLabelFrame.origin.x -= (imageSize.width/2.0 + kLGAlertViewButtonImageOffsetFromTitle/2.0);
            }
        }
    }

    if ([UIScreen mainScreen].scale == 1.0) {
        textLabelFrame = CGRectIntegral(textLabelFrame);
    }

    self.textLabel.frame = textLabelFrame;

    // -----

    if (self.imageView.image) {
        CGSize imageSize = self.imageView.image.size;

        CGRect imageViewFrame = CGRectMake(NSNotFound, frameHeight/2.0 - imageSize.height/2.0, imageSize.width, imageSize.height);

        if (self.textLabel.textAlignment == NSTextAlignmentCenter) {
            CGSize textLabelSize = [self.textLabel sizeThatFits:CGSizeMake(textLabelMaxWidth, CGFLOAT_MAX)];
            CGFloat imageAndTextWidth = imageSize.width + textLabelSize.width + kLGAlertViewButtonImageOffsetFromTitle;

            if (self.iconPosition == LGAlertViewButtonIconPositionLeft) {
                imageViewFrame.origin.x = frameWidth/2.0 - imageAndTextWidth/2.0;
            }
            else {
                imageViewFrame.origin.x = frameWidth/2.0 + imageAndTextWidth/2.0 - imageSize.width;
            }
        }
        else {
            if (self.iconPosition == LGAlertViewButtonIconPositionLeft) {
                imageViewFrame.origin.x = kLGAlertViewPaddingW;
            }
            else {
                imageViewFrame.origin.x = frameWidth - imageSize.width - kLGAlertViewPaddingW;
            }
        }

        if ([UIScreen mainScreen].scale == 1.0) {
            imageViewFrame = CGRectIntegral(imageViewFrame);
        }

        self.imageView.frame = imageViewFrame;
    }

    // -----

    if (!self.separatorView.hidden) {
        CGFloat separatorHeight = [UIScreen mainScreen].scale == 1.0 ? 1.0 : 0.5;

        self.separatorView.frame = CGRectMake(0.0,
                                              CGRectGetHeight(self.frame)-separatorHeight,
                                              CGRectGetWidth(self.frame),
                                              separatorHeight);
    }
}

- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated {
    [super setHighlighted:highlighted animated:animated];

    if (highlighted) {
        self.textLabel.textColor = self.titleColorHighlighted;
        self.imageView.image = self.imageHighlighted;
        self.backgroundColor = self.backgroundColorHighlighted;
    }
    else {
        [self setEnabled:self.enabled];
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    if (selected) {
        self.textLabel.textColor = self.titleColorHighlighted;
        self.imageView.image = self.imageHighlighted;
        self.backgroundColor = self.backgroundColorHighlighted;
    }
    else {
        [self setEnabled:self.enabled];
    }
}

- (void)setEnabled:(BOOL)enabled {
    _enabled = enabled;

    self.userInteractionEnabled = enabled;

    if (enabled) {
        self.textLabel.textColor = self.titleColor;
        self.imageView.image = self.image;
        self.backgroundColor = self.backgroundColorNormal;
    }
    else {
        self.textLabel.textColor = self.titleColorDisabled;
        self.imageView.image = self.imageDisabled;
        self.backgroundColor = self.backgroundColorDisabled;
    }
}

- (CGSize)sizeThatFits:(CGSize)size {
    CGSize sizeForTextLabel = size;
    sizeForTextLabel.width -= kLGAlertViewPaddingW * 2;

    if (self.imageView.image) {
        sizeForTextLabel.width -= (self.imageView.image.size.width + kLGAlertViewButtonImageOffsetFromTitle);
    }

    CGSize labelSize = [self.textLabel sizeThatFits:size];

    CGSize resultSize;

    if (self.imageView.image) {
        CGSize imageSize = self.imageView.image.size;

        CGFloat width = MAX(labelSize.width, imageSize.width);
        width = MIN(width, size.width);

        CGFloat height = MAX(labelSize.height, imageSize.height);

        resultSize = CGSizeMake(width, height);
    }
    else {
        resultSize = labelSize;
    }

    resultSize.height += kLGAlertViewPaddingH * 2;

    return resultSize;
}

@end

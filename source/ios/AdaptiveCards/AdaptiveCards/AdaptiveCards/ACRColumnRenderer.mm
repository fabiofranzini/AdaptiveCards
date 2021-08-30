//
//  ACRColumnRenderer
//  ACRColumnRenderer.mm
//
//  Copyright © 2017 Microsoft. All rights reserved.
//

#import "ACRColumnRenderer.h"
#import "ACOBaseCardElementPrivate.h"
#import "ACOHostConfigPrivate.h"
#import "ACRColumnSetView.h"
#import "ACRColumnView.h"
#import "ACRRendererPrivate.h"
#import "Column.h"
#import "SharedAdaptiveCard.h"
#import "UtiliOS.h"

@implementation ACRColumnRenderer

+ (ACRColumnRenderer *)getInstance
{
    static ACRColumnRenderer *singletonInstance = [[self alloc] init];
    return singletonInstance;
}

+ (ACRCardElementType)elemType
{
    return ACRColumn;
}

- (UIView *)render:(UIView<ACRIContentHoldingView> *)viewGroup
           rootView:(ACRView *)rootView
             inputs:(NSMutableArray *)inputs
    baseCardElement:(ACOBaseCardElement *)acoElem
         hostConfig:(ACOHostConfig *)acoConfig;
{
    std::shared_ptr<BaseCardElement> elem = [acoElem element];
    std::shared_ptr<Column> columnElem = std::dynamic_pointer_cast<Column>(elem);

    [rootView.context pushBaseCardElementContext:acoElem];

    ACRColumnView *column = [[ACRColumnView alloc] initWithStyle:(ACRContainerStyle)columnElem->GetStyle()
                                                     parentStyle:[viewGroup style]
                                                      hostConfig:acoConfig
                                                       superview:viewGroup];

    column.rtl = rootView.context.rtl;

    column.pixelWidth = columnElem->GetPixelWidth();
    auto width = columnElem->GetWidth();
    if (width.empty() || width == "stretch") {
        column.columnWidth = @"stretch";
    } else if (width == "auto") {
        column.columnWidth = @"auto";
    } else {
        try {
            column.relativeWidth = std::stof(width);
            column.hasMoreThanOneRelativeWidth = ((ACRColumnSetView *)viewGroup).hasMoreThanOneColumnWithRelatvieWidth;
        } catch (...) {
            [rootView addWarnings:ACRInvalidValue mesage:@"Invalid column width is given"];
            column.columnWidth = @"stretch";
        }
    }

    UIView *leadingBlankSpace = nil, *trailingBlankSpace = nil;
    if (columnElem->GetVerticalContentAlignment() == VerticalContentAlignment::Center || columnElem->GetVerticalContentAlignment() == VerticalContentAlignment::Bottom) {
//        leadingBlankSpace = [column configurePaddingFor:column];
//        [column addArrangedSubview:leadingBlankSpace];
    }

    ACRColumnSetView *columnsetView = (ACRColumnSetView *)viewGroup;
    column.isLastColumn = columnsetView.isLastColumn;
    column.columnsetView = columnsetView;

    [ACRRenderer render:column
               rootView:rootView
                 inputs:inputs
          withCardElems:columnElem->GetItems()
          andHostConfig:acoConfig];

    if (columnElem->GetVerticalContentAlignment() == VerticalContentAlignment::Center || (columnElem->GetVerticalContentAlignment() == VerticalContentAlignment::Top && _fillAlignment)) {
//        trailingBlankSpace = [column configurePaddingFor:column];
//        [column addArrangedSubview:trailingBlankSpace];
    }

    if (!column.hasStretchableView) {
//        [column addArrangedSubview:[column configurePaddingFor:column]];
//        column.hasPaddingView = YES;
    }

    if (columnElem->GetMinHeight() > 0) {
        NSLayoutConstraint *constraint =
            [NSLayoutConstraint constraintWithItem:column
                                         attribute:NSLayoutAttributeHeight
                                         relatedBy:NSLayoutRelationGreaterThanOrEqual
                                            toItem:nil
                                         attribute:NSLayoutAttributeNotAnAttribute
                                        multiplier:1
                                          constant:columnElem->GetMinHeight()];
        constraint.priority = 999;
        constraint.active = YES;
    }

    [column setClipsToBounds:NO];

    std::shared_ptr<BaseActionElement> selectAction = columnElem->GetSelectAction();
    ACOBaseActionElement *acoSelectAction = [ACOBaseActionElement getACOActionElementFromAdaptiveElement:selectAction];

    [column configureForSelectAction:acoSelectAction rootView:rootView];

    column.shouldGroupAccessibilityChildren = YES;

    [column activatePaddingConstraints];

    // config visibility for column view followed by configuring visibility of the items of column
    configVisibility(column, elem);
    configVisibilityWithVisibilityManager(rootView, column, column);

    [column hideIfSubviewsAreAllHidden];

    [viewGroup addArrangedSubview:column];

    // viewGroup and column has to be in view hierarchy before configBleed is called
    configBleed(rootView, elem, column, acoConfig, viewGroup);

    renderBackgroundImage(columnElem->GetBackgroundImage(), column, rootView);

    [rootView.context popBaseCardElementContext:acoElem];

    column.accessibilityElements = [column getArrangedSubviews];

    return column;
}

- (void)configUpdateForUIImageView:(ACRView *)rootView acoElem:(ACOBaseCardElement *)acoElem config:(ACOHostConfig *)acoConfig image:(UIImage *)image imageView:(UIImageView *)imageView
{
    std::shared_ptr<BaseCardElement> elem = [acoElem element];
    std::shared_ptr<Column> columnElem = std::dynamic_pointer_cast<Column>(elem);
    auto backgroundImageProperties = columnElem->GetBackgroundImage();

    renderBackgroundImage(rootView, backgroundImageProperties.get(), imageView, image);
}

@end

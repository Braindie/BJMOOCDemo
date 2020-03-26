//
//  BJTextureASCellNode.m
//  QimuDemo
//
//  Created by 张文军 on 2020/3/24.
//  Copyright © 2020 ll. All rights reserved.
//

#import "BJTextureASCellNode.h"

@implementation BJTextureASCellNode {
    ASNetworkImageNode *_titleImageNode;

    ASTextNode *_titleTextNode;
    ASTextNode *_timeTextNode;
    
    ASButtonNode *_addButtonNode;
    
    ASTextNode *_contentTextNode;
    
    ASDisplayNode *_lineNode;
    
    ASImageNode *_goodImageNode;
    ASImageNode *_eyesImageNode;

    ASDisplayNode *_bottomLineNode;
}

- (instancetype)initWithObject:(NSString *)string
{
    self = [super init];
    if (self) {
        
        _titleImageNode = [[ASNetworkImageNode alloc] init];
        _titleImageNode.URL = [NSURL URLWithString:@"http://p1.img.cctvpic.com/photoAlbum/page/performance/img/2018/6/8/1528429861352_588.png"];
        
        _titleTextNode = [[ASTextNode alloc] init];
        NSDictionary *titleDic = @{ NSFontAttributeName: [UIFont fontWithName:@"HelveticaNeue" size:14.0f] };
        NSAttributedString *titleAttr = [[NSAttributedString alloc] initWithString:@"名字" attributes:titleDic];
        _titleTextNode.attributedText = titleAttr;
        
        _timeTextNode = [[ASTextNode alloc] init];
        NSDictionary *timeDic = @{ NSFontAttributeName: [UIFont fontWithName:@"HelveticaNeue" size:12.0f] };
        NSAttributedString *timeAttr = [[NSAttributedString alloc] initWithString:@"7个月17天" attributes:timeDic];
        _timeTextNode.attributedText = timeAttr;
        
        _addButtonNode = [[ASButtonNode alloc] init];
        [_addButtonNode setTitle:@"加好友" withFont:[UIFont systemFontOfSize:15] withColor:[UIColor orangeColor] forState:UIControlStateNormal];
        [_addButtonNode addTarget:self action:@selector(addBtnBlock) forControlEvents:ASControlNodeEventTouchUpInside];
        
        
        _contentTextNode = [[ASTextNode alloc] init];
        NSDictionary *contentDic = @{ NSFontAttributeName: [UIFont fontWithName:@"HelveticaNeue" size:13.0f] };
        NSAttributedString *contentAttr = [[NSAttributedString alloc] initWithString:string attributes:contentDic];
        _contentTextNode.attributedText = contentAttr;
        
        
        _lineNode = [[ASDisplayNode alloc] init];
        
        
        _goodImageNode = [[ASImageNode alloc] init];
        [_goodImageNode setImage:[UIImage imageNamed:@"bj_cell_good"]];
        
        _eyesImageNode = [[ASImageNode alloc] init];
        [_eyesImageNode setImage:[UIImage imageNamed:@"bj_cell_eyes"]];
        
        
        _bottomLineNode = [[ASDisplayNode alloc] init];
        
        self.automaticallyManagesSubnodes = YES;
    }
    return self;
}

- (ASLayoutSpec *)layoutSpecThatFits:(ASSizeRange)constrainedSize
{

    
    NSMutableArray *headerChildren = [NSMutableArray array];
    NSMutableArray *verticalChildren = [NSMutableArray array];
    
    // 头部横向布局
    ASStackLayoutSpec *headerStack = [ASStackLayoutSpec horizontalStackLayoutSpec];
    headerStack.alignItems = ASStackLayoutAlignItemsCenter;
    
        // 用户头像
        _titleImageNode.style.preferredSize = CGSizeMake(50, 50);
        _titleImageNode.cornerRadius = 25;
        _titleImageNode.clipsToBounds = YES;
        [headerChildren addObject:[ASInsetLayoutSpec insetLayoutSpecWithInsets:UIEdgeInsetsMake(15, 15, 15, 15) child:_titleImageNode]];
    
        // 用户名&时间
        ASStackLayoutSpec *titleStack = [ASStackLayoutSpec verticalStackLayoutSpec];
        titleStack.style.flexShrink = 1.0;
        [headerChildren addObject:titleStack];
        //
        _titleTextNode.style.flexShrink = 1.0;
        ASInsetLayoutSpec *titleInset = [ASInsetLayoutSpec insetLayoutSpecWithInsets:UIEdgeInsetsMake(0, 0, 10, 0) child:_titleTextNode];
        _timeTextNode.style.flexShrink = 1.0;
        [titleStack setChildren:@[titleInset, _timeTextNode]];
    
        // 占位
        ASLayoutSpec *spaceLayout = [ASLayoutSpec new];
        spaceLayout.style.flexGrow = 1.0;
        [headerChildren addObject:spaceLayout];
    
        // 按钮
        _addButtonNode.style.spacingBefore = 10;
        [headerChildren addObject:[ASInsetLayoutSpec insetLayoutSpecWithInsets:UIEdgeInsetsMake(15, 15, 15, 15) child:_addButtonNode]];
    
    headerStack.children = headerChildren;
    
    // 内容
    _contentTextNode.style.flexShrink = 1.0;
    
    // 分割线
    _lineNode.style.height = ASDimensionMakeWithPoints(1);
    _lineNode.backgroundColor = [UIColor groupTableViewBackgroundColor];
    
    
    // 尾部横向布局
    _goodImageNode.style.preferredSize = CGSizeMake(20, 20);
    _eyesImageNode.style.preferredSize = CGSizeMake(20, 20);
    ASStackLayoutSpec *footerStack = [ASStackLayoutSpec stackLayoutSpecWithDirection:ASStackLayoutDirectionHorizontal spacing:30 justifyContent:ASStackLayoutJustifyContentEnd alignItems:ASStackLayoutAlignItemsCenter children:@[_goodImageNode, _eyesImageNode]];
    
    // 底部分割线
    _bottomLineNode.style.height = ASDimensionMakeWithPoints(15);
    _bottomLineNode.backgroundColor = [UIColor groupTableViewBackgroundColor];

    
    // 整体纵向布局
    ASStackLayoutSpec *verticalStack = [ASStackLayoutSpec verticalStackLayoutSpec];
    [verticalChildren addObject:[ASInsetLayoutSpec insetLayoutSpecWithInsets:UIEdgeInsetsMake(0, 0, 0, 0) child:headerStack]];
    [verticalChildren addObject:[ASInsetLayoutSpec insetLayoutSpecWithInsets:UIEdgeInsetsMake(0, 15, 15, 15) child:_contentTextNode]];
    [verticalChildren addObject:[ASInsetLayoutSpec insetLayoutSpecWithInsets:UIEdgeInsetsMake(0, 15, 15, 15) child:_lineNode]];
    [verticalChildren addObject:[ASInsetLayoutSpec insetLayoutSpecWithInsets:UIEdgeInsetsMake(0, 0, 15, 15) child:footerStack]];
    [verticalChildren addObject:[ASInsetLayoutSpec insetLayoutSpecWithInsets:UIEdgeInsetsMake(0, 0, 0, 0) child:_bottomLineNode]];
    
    verticalStack.children = verticalChildren;
    
    return verticalStack;
}

- (void)addBtnBlock {
    if (self.addBlock) {
        self.addBlock();
    }
}

@end

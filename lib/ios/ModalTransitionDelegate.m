#import "ModalTransitionDelegate.h"

@implementation ModalTransitionDelegate

- (instancetype)initWithContentTransition:(TransitionOptions *)contentTransitionOptions bridge:(RCTBridge *)bridge {
    self = [super initWithBridge:bridge];
    _contentTransitionOptions = contentTransitionOptions;
    return self;
}

- (NSArray *)createTransitionsFromVC:(UIViewController *)fromVC toVC:(UIViewController *)toVC containerView:(UIView *)containerView {
    ContentTransitionCreator* contentTransition = [ContentTransitionCreator createTransition:_contentTransitionOptions view:toVC.view fromVC:fromVC toVC:toVC containerView:containerView];
    
    return @[contentTransition];
}

- (void)prepareTransitionContext:(id<UIViewControllerContextTransitioning>)transitionContext {
    UIViewController* toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    toVC.view.alpha = 0;
    [transitionContext.containerView addSubview:toVC.view];
}

- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source {
    return self;
}

@end

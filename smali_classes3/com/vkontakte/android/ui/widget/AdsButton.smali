.class public Lcom/vkontakte/android/ui/widget/AdsButton;
.super Landroid/widget/FrameLayout;
.source "AdsButton.java"


# static fields
.field private static final ANIMATION_DELAY:I = 0xfa0

.field private static final interpolator:Landroid/view/animation/Interpolator;


# instance fields
.field private animator:Landroid/animation/AnimatorSet;

.field private final firstPhaseButton:Lcom/vk/attachpicker/widget/RobotoMediumTextView;

.field private final hasActivity:Z

.field private needStateReset:Z

.field private final secondPhaseButton:Lcom/vk/attachpicker/widget/RobotoMediumTextView;


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .prologue
    .line 26
    new-instance v0, Lcom/vkontakte/android/ui/CubicBezierInterpolator;

    const v1, 0x3ee8f5c3    # 0.455f

    const v2, 0x3cf5c28f    # 0.03f

    const v3, 0x3f03d70a    # 0.515f

    const v4, 0x3f747ae1    # 0.955f

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/vkontakte/android/ui/CubicBezierInterpolator;-><init>(FFFF)V

    sput-object v0, Lcom/vkontakte/android/ui/widget/AdsButton;->interpolator:Landroid/view/animation/Interpolator;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 36
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/vkontakte/android/ui/widget/AdsButton;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 37
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 40
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/vkontakte/android/ui/widget/AdsButton;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 41
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 9
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyleAttr"    # I

    .prologue
    .line 44
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 45
    new-instance v0, Lcom/vk/attachpicker/widget/RobotoMediumTextView;

    new-instance v1, Landroid/view/ContextThemeWrapper;

    const v8, 0x7f0b026e

    invoke-direct {v1, p1, v8}, Landroid/view/ContextThemeWrapper;-><init>(Landroid/content/Context;I)V

    invoke-direct {v0, v1}, Lcom/vk/attachpicker/widget/RobotoMediumTextView;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/vkontakte/android/ui/widget/AdsButton;->firstPhaseButton:Lcom/vk/attachpicker/widget/RobotoMediumTextView;

    .line 46
    new-instance v0, Lcom/vk/attachpicker/widget/RobotoMediumTextView;

    new-instance v1, Landroid/view/ContextThemeWrapper;

    const v8, 0x7f0b026f

    invoke-direct {v1, p1, v8}, Landroid/view/ContextThemeWrapper;-><init>(Landroid/content/Context;I)V

    invoke-direct {v0, v1}, Lcom/vk/attachpicker/widget/RobotoMediumTextView;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/vkontakte/android/ui/widget/AdsButton;->secondPhaseButton:Lcom/vk/attachpicker/widget/RobotoMediumTextView;

    .line 47
    iget-object v0, p0, Lcom/vkontakte/android/ui/widget/AdsButton;->secondPhaseButton:Lcom/vk/attachpicker/widget/RobotoMediumTextView;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Lcom/vk/attachpicker/widget/RobotoMediumTextView;->setVisibility(I)V

    .line 48
    iget-object v0, p0, Lcom/vkontakte/android/ui/widget/AdsButton;->firstPhaseButton:Lcom/vk/attachpicker/widget/RobotoMediumTextView;

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/ui/widget/AdsButton;->addView(Landroid/view/View;)V

    .line 49
    iget-object v0, p0, Lcom/vkontakte/android/ui/widget/AdsButton;->secondPhaseButton:Lcom/vk/attachpicker/widget/RobotoMediumTextView;

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/ui/widget/AdsButton;->addView(Landroid/view/View;)V

    .line 51
    invoke-static {p1}, Lcom/vkontakte/android/utils/Utils;->castToActivity(Landroid/content/Context;)Landroid/app/Activity;

    move-result-object v6

    .line 52
    .local v6, "activity":Landroid/app/Activity;
    if-eqz v6, :cond_1

    .line 53
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/vkontakte/android/ui/widget/AdsButton;->hasActivity:Z

    .line 54
    new-instance v2, Landroid/graphics/Rect;

    invoke-direct {v2}, Landroid/graphics/Rect;-><init>()V

    .line 55
    .local v2, "rect":Landroid/graphics/Rect;
    new-instance v4, Landroid/graphics/Rect;

    invoke-direct {v4}, Landroid/graphics/Rect;-><init>()V

    .line 56
    .local v4, "rootRect":Landroid/graphics/Rect;
    const v0, 0x7f10018a

    invoke-virtual {v6, v0}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v7

    .line 57
    .local v7, "list":Landroid/view/View;
    if-nez v7, :cond_0

    invoke-virtual {v6}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v3

    .line 58
    .local v3, "rootView":Landroid/view/View;
    :goto_0
    invoke-static {p1}, Lcom/vkontakte/android/ViewUtils;->getNavigationBarHeight(Landroid/content/Context;)I

    move-result v5

    .line 59
    .local v5, "navigationHeight":I
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/widget/AdsButton;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v8

    new-instance v0, Lcom/vkontakte/android/ui/widget/AdsButton$1;

    move-object v1, p0

    invoke-direct/range {v0 .. v5}, Lcom/vkontakte/android/ui/widget/AdsButton$1;-><init>(Lcom/vkontakte/android/ui/widget/AdsButton;Landroid/graphics/Rect;Landroid/view/View;Landroid/graphics/Rect;I)V

    invoke-virtual {v8, v0}, Landroid/view/ViewTreeObserver;->addOnPreDrawListener(Landroid/view/ViewTreeObserver$OnPreDrawListener;)V

    .line 77
    .end local v2    # "rect":Landroid/graphics/Rect;
    .end local v3    # "rootView":Landroid/view/View;
    .end local v4    # "rootRect":Landroid/graphics/Rect;
    .end local v5    # "navigationHeight":I
    .end local v7    # "list":Landroid/view/View;
    :goto_1
    return-void

    .restart local v2    # "rect":Landroid/graphics/Rect;
    .restart local v4    # "rootRect":Landroid/graphics/Rect;
    .restart local v7    # "list":Landroid/view/View;
    :cond_0
    move-object v3, v7

    .line 57
    goto :goto_0

    .line 75
    .end local v2    # "rect":Landroid/graphics/Rect;
    .end local v4    # "rootRect":Landroid/graphics/Rect;
    .end local v7    # "list":Landroid/view/View;
    :cond_1
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/vkontakte/android/ui/widget/AdsButton;->hasActivity:Z

    goto :goto_1
.end method

.method static synthetic access$000(Lcom/vkontakte/android/ui/widget/AdsButton;)Z
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/ui/widget/AdsButton;

    .prologue
    .line 23
    iget-boolean v0, p0, Lcom/vkontakte/android/ui/widget/AdsButton;->needStateReset:Z

    return v0
.end method

.method static synthetic access$002(Lcom/vkontakte/android/ui/widget/AdsButton;Z)Z
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/ui/widget/AdsButton;
    .param p1, "x1"    # Z

    .prologue
    .line 23
    iput-boolean p1, p0, Lcom/vkontakte/android/ui/widget/AdsButton;->needStateReset:Z

    return p1
.end method

.method static synthetic access$100(Lcom/vkontakte/android/ui/widget/AdsButton;)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/ui/widget/AdsButton;

    .prologue
    .line 23
    invoke-direct {p0}, Lcom/vkontakte/android/ui/widget/AdsButton;->animateView()V

    return-void
.end method

.method static synthetic access$200(Lcom/vkontakte/android/ui/widget/AdsButton;)Lcom/vk/attachpicker/widget/RobotoMediumTextView;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/ui/widget/AdsButton;

    .prologue
    .line 23
    iget-object v0, p0, Lcom/vkontakte/android/ui/widget/AdsButton;->secondPhaseButton:Lcom/vk/attachpicker/widget/RobotoMediumTextView;

    return-object v0
.end method

.method static synthetic access$300(Lcom/vkontakte/android/ui/widget/AdsButton;)Lcom/vk/attachpicker/widget/RobotoMediumTextView;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/ui/widget/AdsButton;

    .prologue
    .line 23
    iget-object v0, p0, Lcom/vkontakte/android/ui/widget/AdsButton;->firstPhaseButton:Lcom/vk/attachpicker/widget/RobotoMediumTextView;

    return-object v0
.end method

.method private animateView()V
    .locals 6

    .prologue
    .line 98
    iget-object v0, p0, Lcom/vkontakte/android/ui/widget/AdsButton;->animator:Landroid/animation/AnimatorSet;

    if-eqz v0, :cond_0

    .line 99
    iget-object v0, p0, Lcom/vkontakte/android/ui/widget/AdsButton;->animator:Landroid/animation/AnimatorSet;

    invoke-virtual {v0}, Landroid/animation/AnimatorSet;->removeAllListeners()V

    .line 100
    iget-object v0, p0, Lcom/vkontakte/android/ui/widget/AdsButton;->animator:Landroid/animation/AnimatorSet;

    invoke-virtual {v0}, Landroid/animation/AnimatorSet;->cancel()V

    .line 102
    :cond_0
    new-instance v0, Landroid/animation/AnimatorSet;

    invoke-direct {v0}, Landroid/animation/AnimatorSet;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/ui/widget/AdsButton;->animator:Landroid/animation/AnimatorSet;

    .line 103
    iget-object v0, p0, Lcom/vkontakte/android/ui/widget/AdsButton;->animator:Landroid/animation/AnimatorSet;

    const/4 v1, 0x1

    new-array v1, v1, [Landroid/animation/Animator;

    const/4 v2, 0x0

    iget-object v3, p0, Lcom/vkontakte/android/ui/widget/AdsButton;->secondPhaseButton:Lcom/vk/attachpicker/widget/RobotoMediumTextView;

    sget-object v4, Landroid/view/View;->ALPHA:Landroid/util/Property;

    const/4 v5, 0x2

    new-array v5, v5, [F

    fill-array-data v5, :array_0

    invoke-static {v3, v4, v5}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    move-result-object v3

    aput-object v3, v1, v2

    invoke-virtual {v0, v1}, Landroid/animation/AnimatorSet;->playTogether([Landroid/animation/Animator;)V

    .line 104
    iget-object v0, p0, Lcom/vkontakte/android/ui/widget/AdsButton;->animator:Landroid/animation/AnimatorSet;

    new-instance v1, Lcom/vkontakte/android/ui/widget/AdsButton$2;

    invoke-direct {v1, p0}, Lcom/vkontakte/android/ui/widget/AdsButton$2;-><init>(Lcom/vkontakte/android/ui/widget/AdsButton;)V

    invoke-virtual {v0, v1}, Landroid/animation/AnimatorSet;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 121
    iget-object v0, p0, Lcom/vkontakte/android/ui/widget/AdsButton;->animator:Landroid/animation/AnimatorSet;

    const-wide/16 v2, 0x1f4

    invoke-virtual {v0, v2, v3}, Landroid/animation/AnimatorSet;->setDuration(J)Landroid/animation/AnimatorSet;

    .line 122
    iget-object v0, p0, Lcom/vkontakte/android/ui/widget/AdsButton;->animator:Landroid/animation/AnimatorSet;

    const-wide/16 v2, 0xfa0

    invoke-virtual {v0, v2, v3}, Landroid/animation/AnimatorSet;->setStartDelay(J)V

    .line 123
    iget-object v0, p0, Lcom/vkontakte/android/ui/widget/AdsButton;->animator:Landroid/animation/AnimatorSet;

    sget-object v1, Lcom/vkontakte/android/ui/widget/AdsButton;->interpolator:Landroid/view/animation/Interpolator;

    invoke-virtual {v0, v1}, Landroid/animation/AnimatorSet;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 124
    iget-object v0, p0, Lcom/vkontakte/android/ui/widget/AdsButton;->animator:Landroid/animation/AnimatorSet;

    invoke-virtual {v0}, Landroid/animation/AnimatorSet;->start()V

    .line 125
    return-void

    .line 103
    nop

    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method


# virtual methods
.method protected onAttachedToWindow()V
    .locals 2

    .prologue
    .line 81
    invoke-super {p0}, Landroid/widget/FrameLayout;->onAttachedToWindow()V

    .line 82
    iget-object v0, p0, Lcom/vkontakte/android/ui/widget/AdsButton;->firstPhaseButton:Lcom/vk/attachpicker/widget/RobotoMediumTextView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/vk/attachpicker/widget/RobotoMediumTextView;->setVisibility(I)V

    .line 83
    iget-object v0, p0, Lcom/vkontakte/android/ui/widget/AdsButton;->secondPhaseButton:Lcom/vk/attachpicker/widget/RobotoMediumTextView;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Lcom/vk/attachpicker/widget/RobotoMediumTextView;->setVisibility(I)V

    .line 85
    iget-boolean v0, p0, Lcom/vkontakte/android/ui/widget/AdsButton;->hasActivity:Z

    if-eqz v0, :cond_0

    .line 86
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/vkontakte/android/ui/widget/AdsButton;->needStateReset:Z

    .line 90
    :goto_0
    return-void

    .line 88
    :cond_0
    invoke-direct {p0}, Lcom/vkontakte/android/ui/widget/AdsButton;->animateView()V

    goto :goto_0
.end method

.method public setText(Ljava/lang/CharSequence;)V
    .locals 1
    .param p1, "text"    # Ljava/lang/CharSequence;

    .prologue
    .line 93
    iget-object v0, p0, Lcom/vkontakte/android/ui/widget/AdsButton;->firstPhaseButton:Lcom/vk/attachpicker/widget/RobotoMediumTextView;

    invoke-virtual {v0, p1}, Lcom/vk/attachpicker/widget/RobotoMediumTextView;->setText(Ljava/lang/CharSequence;)V

    .line 94
    iget-object v0, p0, Lcom/vkontakte/android/ui/widget/AdsButton;->secondPhaseButton:Lcom/vk/attachpicker/widget/RobotoMediumTextView;

    invoke-virtual {v0, p1}, Lcom/vk/attachpicker/widget/RobotoMediumTextView;->setText(Ljava/lang/CharSequence;)V

    .line 95
    return-void
.end method

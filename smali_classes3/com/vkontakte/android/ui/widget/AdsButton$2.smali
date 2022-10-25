.class Lcom/vkontakte/android/ui/widget/AdsButton$2;
.super Landroid/animation/AnimatorListenerAdapter;
.source "AdsButton.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/ui/widget/AdsButton;->animateView()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/ui/widget/AdsButton;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/ui/widget/AdsButton;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/ui/widget/AdsButton;

    .prologue
    .line 104
    iput-object p1, p0, Lcom/vkontakte/android/ui/widget/AdsButton$2;->this$0:Lcom/vkontakte/android/ui/widget/AdsButton;

    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 2
    .param p1, "animation"    # Landroid/animation/Animator;

    .prologue
    .line 118
    iget-object v0, p0, Lcom/vkontakte/android/ui/widget/AdsButton$2;->this$0:Lcom/vkontakte/android/ui/widget/AdsButton;

    invoke-static {v0}, Lcom/vkontakte/android/ui/widget/AdsButton;->access$300(Lcom/vkontakte/android/ui/widget/AdsButton;)Lcom/vk/attachpicker/widget/RobotoMediumTextView;

    move-result-object v0

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Lcom/vk/attachpicker/widget/RobotoMediumTextView;->setVisibility(I)V

    .line 119
    return-void
.end method

.method public onAnimationStart(Landroid/animation/Animator;)V
    .locals 4
    .param p1, "animation"    # Landroid/animation/Animator;

    .prologue
    .line 107
    iget-object v0, p0, Lcom/vkontakte/android/ui/widget/AdsButton$2;->this$0:Lcom/vkontakte/android/ui/widget/AdsButton;

    invoke-static {v0}, Lcom/vkontakte/android/ui/widget/AdsButton;->access$200(Lcom/vkontakte/android/ui/widget/AdsButton;)Lcom/vk/attachpicker/widget/RobotoMediumTextView;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/vk/attachpicker/widget/RobotoMediumTextView;->setAlpha(F)V

    .line 108
    iget-object v0, p0, Lcom/vkontakte/android/ui/widget/AdsButton$2;->this$0:Lcom/vkontakte/android/ui/widget/AdsButton;

    invoke-static {v0}, Lcom/vkontakte/android/ui/widget/AdsButton;->access$200(Lcom/vkontakte/android/ui/widget/AdsButton;)Lcom/vk/attachpicker/widget/RobotoMediumTextView;

    move-result-object v0

    new-instance v1, Lcom/vkontakte/android/ui/widget/AdsButton$2$1;

    invoke-direct {v1, p0}, Lcom/vkontakte/android/ui/widget/AdsButton$2$1;-><init>(Lcom/vkontakte/android/ui/widget/AdsButton$2;)V

    .line 113
    invoke-virtual {p1}, Landroid/animation/Animator;->getStartDelay()J

    move-result-wide v2

    .line 108
    invoke-virtual {v0, v1, v2, v3}, Lcom/vk/attachpicker/widget/RobotoMediumTextView;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 114
    return-void
.end method

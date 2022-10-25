.class Lcom/vkontakte/android/ui/widget/AdsButton$2$1;
.super Ljava/lang/Object;
.source "AdsButton.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/ui/widget/AdsButton$2;->onAnimationStart(Landroid/animation/Animator;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/vkontakte/android/ui/widget/AdsButton$2;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/ui/widget/AdsButton$2;)V
    .locals 0
    .param p1, "this$1"    # Lcom/vkontakte/android/ui/widget/AdsButton$2;

    .prologue
    .line 108
    iput-object p1, p0, Lcom/vkontakte/android/ui/widget/AdsButton$2$1;->this$1:Lcom/vkontakte/android/ui/widget/AdsButton$2;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 111
    iget-object v0, p0, Lcom/vkontakte/android/ui/widget/AdsButton$2$1;->this$1:Lcom/vkontakte/android/ui/widget/AdsButton$2;

    iget-object v0, v0, Lcom/vkontakte/android/ui/widget/AdsButton$2;->this$0:Lcom/vkontakte/android/ui/widget/AdsButton;

    invoke-static {v0}, Lcom/vkontakte/android/ui/widget/AdsButton;->access$200(Lcom/vkontakte/android/ui/widget/AdsButton;)Lcom/vk/attachpicker/widget/RobotoMediumTextView;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/vk/attachpicker/widget/RobotoMediumTextView;->setVisibility(I)V

    .line 112
    return-void
.end method

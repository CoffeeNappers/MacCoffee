.class Lcom/vkontakte/android/ui/PhotoView$5$1;
.super Landroid/animation/AnimatorListenerAdapter;
.source "PhotoView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/ui/PhotoView$5;->onPreDraw()Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/vkontakte/android/ui/PhotoView$5;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/ui/PhotoView$5;)V
    .locals 0
    .param p1, "this$1"    # Lcom/vkontakte/android/ui/PhotoView$5;

    .prologue
    .line 863
    iput-object p1, p0, Lcom/vkontakte/android/ui/PhotoView$5$1;->this$1:Lcom/vkontakte/android/ui/PhotoView$5;

    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 2
    .param p1, "a"    # Landroid/animation/Animator;

    .prologue
    .line 865
    iget-object v0, p0, Lcom/vkontakte/android/ui/PhotoView$5$1;->this$1:Lcom/vkontakte/android/ui/PhotoView$5;

    iget-object v0, v0, Lcom/vkontakte/android/ui/PhotoView$5;->this$0:Lcom/vkontakte/android/ui/PhotoView;

    new-instance v1, Lcom/vkontakte/android/ui/PhotoView$5$1$1;

    invoke-direct {v1, p0}, Lcom/vkontakte/android/ui/PhotoView$5$1$1;-><init>(Lcom/vkontakte/android/ui/PhotoView$5$1;)V

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/ui/PhotoView;->post(Ljava/lang/Runnable;)Z

    .line 876
    return-void
.end method

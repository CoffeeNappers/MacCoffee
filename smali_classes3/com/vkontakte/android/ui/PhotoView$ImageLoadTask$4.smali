.class Lcom/vkontakte/android/ui/PhotoView$ImageLoadTask$4;
.super Ljava/lang/Object;
.source "PhotoView.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/ui/PhotoView$ImageLoadTask;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/vkontakte/android/ui/PhotoView$ImageLoadTask;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/ui/PhotoView$ImageLoadTask;)V
    .locals 0
    .param p1, "this$1"    # Lcom/vkontakte/android/ui/PhotoView$ImageLoadTask;

    .prologue
    .line 1643
    iput-object p1, p0, Lcom/vkontakte/android/ui/PhotoView$ImageLoadTask$4;->this$1:Lcom/vkontakte/android/ui/PhotoView$ImageLoadTask;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    const/16 v2, 0x8

    .line 1645
    iget-object v0, p0, Lcom/vkontakte/android/ui/PhotoView$ImageLoadTask$4;->this$1:Lcom/vkontakte/android/ui/PhotoView$ImageLoadTask;

    iget-object v0, v0, Lcom/vkontakte/android/ui/PhotoView$ImageLoadTask;->this$0:Lcom/vkontakte/android/ui/PhotoView;

    invoke-static {v0}, Lcom/vkontakte/android/ui/PhotoView;->access$4000(Lcom/vkontakte/android/ui/PhotoView;)Ljava/lang/Runnable;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 1646
    iget-object v0, p0, Lcom/vkontakte/android/ui/PhotoView$ImageLoadTask$4;->this$1:Lcom/vkontakte/android/ui/PhotoView$ImageLoadTask;

    iget-object v0, v0, Lcom/vkontakte/android/ui/PhotoView$ImageLoadTask;->this$0:Lcom/vkontakte/android/ui/PhotoView;

    iget-object v1, p0, Lcom/vkontakte/android/ui/PhotoView$ImageLoadTask$4;->this$1:Lcom/vkontakte/android/ui/PhotoView$ImageLoadTask;

    iget-object v1, v1, Lcom/vkontakte/android/ui/PhotoView$ImageLoadTask;->this$0:Lcom/vkontakte/android/ui/PhotoView;

    invoke-static {v1}, Lcom/vkontakte/android/ui/PhotoView;->access$4000(Lcom/vkontakte/android/ui/PhotoView;)Ljava/lang/Runnable;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/ui/PhotoView;->removeCallbacks(Ljava/lang/Runnable;)Z

    .line 1648
    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/ui/PhotoView$ImageLoadTask$4;->this$1:Lcom/vkontakte/android/ui/PhotoView$ImageLoadTask;

    iget-object v0, v0, Lcom/vkontakte/android/ui/PhotoView$ImageLoadTask;->this$0:Lcom/vkontakte/android/ui/PhotoView;

    invoke-static {v0}, Lcom/vkontakte/android/ui/PhotoView;->access$1500(Lcom/vkontakte/android/ui/PhotoView;)Lcom/vkontakte/android/ui/CircularProgressBar;

    move-result-object v0

    invoke-static {v0}, Lme/grishka/appkit/utils/V;->cancelVisibilityAnimation(Landroid/view/View;)V

    .line 1649
    iget-object v0, p0, Lcom/vkontakte/android/ui/PhotoView$ImageLoadTask$4;->this$1:Lcom/vkontakte/android/ui/PhotoView$ImageLoadTask;

    iget-object v0, v0, Lcom/vkontakte/android/ui/PhotoView$ImageLoadTask;->this$0:Lcom/vkontakte/android/ui/PhotoView;

    invoke-static {v0}, Lcom/vkontakte/android/ui/PhotoView;->access$1500(Lcom/vkontakte/android/ui/PhotoView;)Lcom/vkontakte/android/ui/CircularProgressBar;

    move-result-object v0

    invoke-virtual {v0, v2}, Lcom/vkontakte/android/ui/CircularProgressBar;->setVisibility(I)V

    .line 1651
    iget-object v0, p0, Lcom/vkontakte/android/ui/PhotoView$ImageLoadTask$4;->this$1:Lcom/vkontakte/android/ui/PhotoView$ImageLoadTask;

    iget-object v0, v0, Lcom/vkontakte/android/ui/PhotoView$ImageLoadTask;->this$0:Lcom/vkontakte/android/ui/PhotoView;

    invoke-static {v0}, Lcom/vkontakte/android/ui/PhotoView;->access$2600(Lcom/vkontakte/android/ui/PhotoView;)Lcom/vkontakte/android/ui/ClippingImageView;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/ui/ClippingImageView;->setVisibility(I)V

    .line 1652
    iget-object v0, p0, Lcom/vkontakte/android/ui/PhotoView$ImageLoadTask$4;->this$1:Lcom/vkontakte/android/ui/PhotoView$ImageLoadTask;

    iget-object v0, v0, Lcom/vkontakte/android/ui/PhotoView$ImageLoadTask;->this$0:Lcom/vkontakte/android/ui/PhotoView;

    invoke-static {v0}, Lcom/vkontakte/android/ui/PhotoView;->access$2600(Lcom/vkontakte/android/ui/PhotoView;)Lcom/vkontakte/android/ui/ClippingImageView;

    move-result-object v0

    invoke-static {v0, v2}, Lme/grishka/appkit/utils/V;->setVisibilityAnimated(Landroid/view/View;I)V

    .line 1653
    return-void
.end method

.class Lcom/vkontakte/android/ui/PhotoView$ImageLoadTask$2;
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

.field final synthetic val$thumb:Landroid/graphics/Bitmap;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/ui/PhotoView$ImageLoadTask;Landroid/graphics/Bitmap;)V
    .locals 0
    .param p1, "this$1"    # Lcom/vkontakte/android/ui/PhotoView$ImageLoadTask;

    .prologue
    .line 1570
    iput-object p1, p0, Lcom/vkontakte/android/ui/PhotoView$ImageLoadTask$2;->this$1:Lcom/vkontakte/android/ui/PhotoView$ImageLoadTask;

    iput-object p2, p0, Lcom/vkontakte/android/ui/PhotoView$ImageLoadTask$2;->val$thumb:Landroid/graphics/Bitmap;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .prologue
    .line 1572
    iget-object v0, p0, Lcom/vkontakte/android/ui/PhotoView$ImageLoadTask$2;->this$1:Lcom/vkontakte/android/ui/PhotoView$ImageLoadTask;

    iget-object v0, v0, Lcom/vkontakte/android/ui/PhotoView$ImageLoadTask;->this$0:Lcom/vkontakte/android/ui/PhotoView;

    invoke-static {v0}, Lcom/vkontakte/android/ui/PhotoView;->access$3800(Lcom/vkontakte/android/ui/PhotoView;)Lcom/vkontakte/android/ui/PhotoView$PhotoViewerAdapter;

    move-result-object v0

    iget-object v1, p0, Lcom/vkontakte/android/ui/PhotoView$ImageLoadTask$2;->this$1:Lcom/vkontakte/android/ui/PhotoView$ImageLoadTask;

    iget v1, v1, Lcom/vkontakte/android/ui/PhotoView$ImageLoadTask;->index:I

    invoke-interface {v0, v1}, Lcom/vkontakte/android/ui/PhotoView$PhotoViewerAdapter;->isCached(I)Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/vkontakte/android/ui/PhotoView$ImageLoadTask$2;->val$thumb:Landroid/graphics/Bitmap;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/vkontakte/android/ui/PhotoView$ImageLoadTask$2;->val$thumb:Landroid/graphics/Bitmap;

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v0

    iget-object v1, p0, Lcom/vkontakte/android/ui/PhotoView$ImageLoadTask$2;->val$thumb:Landroid/graphics/Bitmap;

    invoke-virtual {v1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v1

    invoke-static {v0, v1}, Ljava/lang/Math;->max(II)I

    move-result v0

    const/16 v1, 0x1f4

    if-le v0, v1, :cond_1

    .line 1573
    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/ui/PhotoView$ImageLoadTask$2;->this$1:Lcom/vkontakte/android/ui/PhotoView$ImageLoadTask;

    iget-object v0, v0, Lcom/vkontakte/android/ui/PhotoView$ImageLoadTask;->this$0:Lcom/vkontakte/android/ui/PhotoView;

    invoke-static {v0}, Lcom/vkontakte/android/ui/PhotoView;->access$1500(Lcom/vkontakte/android/ui/PhotoView;)Lcom/vkontakte/android/ui/CircularProgressBar;

    move-result-object v0

    invoke-static {v0}, Lme/grishka/appkit/utils/V;->cancelVisibilityAnimation(Landroid/view/View;)V

    .line 1574
    iget-object v0, p0, Lcom/vkontakte/android/ui/PhotoView$ImageLoadTask$2;->this$1:Lcom/vkontakte/android/ui/PhotoView$ImageLoadTask;

    iget-object v0, v0, Lcom/vkontakte/android/ui/PhotoView$ImageLoadTask;->this$0:Lcom/vkontakte/android/ui/PhotoView;

    invoke-static {v0}, Lcom/vkontakte/android/ui/PhotoView;->access$1500(Lcom/vkontakte/android/ui/PhotoView;)Lcom/vkontakte/android/ui/CircularProgressBar;

    move-result-object v0

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/ui/CircularProgressBar;->setVisibility(I)V

    .line 1587
    :goto_0
    iget-object v0, p0, Lcom/vkontakte/android/ui/PhotoView$ImageLoadTask$2;->this$1:Lcom/vkontakte/android/ui/PhotoView$ImageLoadTask;

    iget-object v0, v0, Lcom/vkontakte/android/ui/PhotoView$ImageLoadTask;->this$0:Lcom/vkontakte/android/ui/PhotoView;

    iget-object v1, p0, Lcom/vkontakte/android/ui/PhotoView$ImageLoadTask$2;->this$1:Lcom/vkontakte/android/ui/PhotoView$ImageLoadTask;

    iget-object v1, v1, Lcom/vkontakte/android/ui/PhotoView$ImageLoadTask;->this$0:Lcom/vkontakte/android/ui/PhotoView;

    invoke-static {v1}, Lcom/vkontakte/android/ui/PhotoView;->access$4000(Lcom/vkontakte/android/ui/PhotoView;)Ljava/lang/Runnable;

    move-result-object v1

    const-wide/16 v2, 0x190

    invoke-virtual {v0, v1, v2, v3}, Lcom/vkontakte/android/ui/PhotoView;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 1589
    iget-object v0, p0, Lcom/vkontakte/android/ui/PhotoView$ImageLoadTask$2;->this$1:Lcom/vkontakte/android/ui/PhotoView$ImageLoadTask;

    iget-object v0, v0, Lcom/vkontakte/android/ui/PhotoView$ImageLoadTask;->this$0:Lcom/vkontakte/android/ui/PhotoView;

    invoke-static {v0}, Lcom/vkontakte/android/ui/PhotoView;->access$1500(Lcom/vkontakte/android/ui/PhotoView;)Lcom/vkontakte/android/ui/CircularProgressBar;

    move-result-object v0

    const-wide/16 v2, 0x0

    invoke-virtual {v0, v2, v3}, Lcom/vkontakte/android/ui/CircularProgressBar;->setProgress(D)V

    .line 1590
    iget-object v0, p0, Lcom/vkontakte/android/ui/PhotoView$ImageLoadTask$2;->val$thumb:Landroid/graphics/Bitmap;

    if-eqz v0, :cond_3

    .line 1591
    iget-object v0, p0, Lcom/vkontakte/android/ui/PhotoView$ImageLoadTask$2;->this$1:Lcom/vkontakte/android/ui/PhotoView$ImageLoadTask;

    iget-object v0, v0, Lcom/vkontakte/android/ui/PhotoView$ImageLoadTask;->this$0:Lcom/vkontakte/android/ui/PhotoView;

    invoke-static {v0}, Lcom/vkontakte/android/ui/PhotoView;->access$2600(Lcom/vkontakte/android/ui/PhotoView;)Lcom/vkontakte/android/ui/ClippingImageView;

    move-result-object v0

    iget-object v1, p0, Lcom/vkontakte/android/ui/PhotoView$ImageLoadTask$2;->val$thumb:Landroid/graphics/Bitmap;

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/ui/ClippingImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    .line 1592
    iget-object v0, p0, Lcom/vkontakte/android/ui/PhotoView$ImageLoadTask$2;->this$1:Lcom/vkontakte/android/ui/PhotoView$ImageLoadTask;

    iget-object v0, v0, Lcom/vkontakte/android/ui/PhotoView$ImageLoadTask;->this$0:Lcom/vkontakte/android/ui/PhotoView;

    invoke-static {v0}, Lcom/vkontakte/android/ui/PhotoView;->access$2600(Lcom/vkontakte/android/ui/PhotoView;)Lcom/vkontakte/android/ui/ClippingImageView;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/ui/ClippingImageView;->setVisibility(I)V

    .line 1593
    const-string/jumbo v0, "vk_photoview"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "Set thumb image "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/vkontakte/android/ui/PhotoView$ImageLoadTask$2;->this$1:Lcom/vkontakte/android/ui/PhotoView$ImageLoadTask;

    iget-object v2, v2, Lcom/vkontakte/android/ui/PhotoView$ImageLoadTask;->this$0:Lcom/vkontakte/android/ui/PhotoView;

    invoke-static {v2}, Lcom/vkontakte/android/ui/PhotoView;->access$3900(Lcom/vkontakte/android/ui/PhotoView;)I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1597
    :goto_1
    iget-object v0, p0, Lcom/vkontakte/android/ui/PhotoView$ImageLoadTask$2;->this$1:Lcom/vkontakte/android/ui/PhotoView$ImageLoadTask;

    iget-object v0, v0, Lcom/vkontakte/android/ui/PhotoView$ImageLoadTask;->this$0:Lcom/vkontakte/android/ui/PhotoView;

    invoke-static {v0}, Lcom/vkontakte/android/ui/PhotoView;->access$2800(Lcom/vkontakte/android/ui/PhotoView;)Landroid/widget/FrameLayout;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/FrameLayout;->requestLayout()V

    .line 1598
    return-void

    .line 1576
    :cond_1
    iget-object v0, p0, Lcom/vkontakte/android/ui/PhotoView$ImageLoadTask$2;->this$1:Lcom/vkontakte/android/ui/PhotoView$ImageLoadTask;

    iget-object v0, v0, Lcom/vkontakte/android/ui/PhotoView$ImageLoadTask;->this$0:Lcom/vkontakte/android/ui/PhotoView;

    invoke-static {v0}, Lcom/vkontakte/android/ui/PhotoView;->access$4000(Lcom/vkontakte/android/ui/PhotoView;)Ljava/lang/Runnable;

    move-result-object v0

    if-eqz v0, :cond_2

    .line 1577
    iget-object v0, p0, Lcom/vkontakte/android/ui/PhotoView$ImageLoadTask$2;->this$1:Lcom/vkontakte/android/ui/PhotoView$ImageLoadTask;

    iget-object v0, v0, Lcom/vkontakte/android/ui/PhotoView$ImageLoadTask;->this$0:Lcom/vkontakte/android/ui/PhotoView;

    iget-object v1, p0, Lcom/vkontakte/android/ui/PhotoView$ImageLoadTask$2;->this$1:Lcom/vkontakte/android/ui/PhotoView$ImageLoadTask;

    iget-object v1, v1, Lcom/vkontakte/android/ui/PhotoView$ImageLoadTask;->this$0:Lcom/vkontakte/android/ui/PhotoView;

    invoke-static {v1}, Lcom/vkontakte/android/ui/PhotoView;->access$4000(Lcom/vkontakte/android/ui/PhotoView;)Ljava/lang/Runnable;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/ui/PhotoView;->removeCallbacks(Ljava/lang/Runnable;)Z

    .line 1579
    :cond_2
    iget-object v0, p0, Lcom/vkontakte/android/ui/PhotoView$ImageLoadTask$2;->this$1:Lcom/vkontakte/android/ui/PhotoView$ImageLoadTask;

    iget-object v0, v0, Lcom/vkontakte/android/ui/PhotoView$ImageLoadTask;->this$0:Lcom/vkontakte/android/ui/PhotoView;

    new-instance v1, Lcom/vkontakte/android/ui/PhotoView$ImageLoadTask$2$1;

    invoke-direct {v1, p0}, Lcom/vkontakte/android/ui/PhotoView$ImageLoadTask$2$1;-><init>(Lcom/vkontakte/android/ui/PhotoView$ImageLoadTask$2;)V

    invoke-static {v0, v1}, Lcom/vkontakte/android/ui/PhotoView;->access$4002(Lcom/vkontakte/android/ui/PhotoView;Ljava/lang/Runnable;)Ljava/lang/Runnable;

    goto/16 :goto_0

    .line 1595
    :cond_3
    iget-object v0, p0, Lcom/vkontakte/android/ui/PhotoView$ImageLoadTask$2;->this$1:Lcom/vkontakte/android/ui/PhotoView$ImageLoadTask;

    iget-object v0, v0, Lcom/vkontakte/android/ui/PhotoView$ImageLoadTask;->this$0:Lcom/vkontakte/android/ui/PhotoView;

    invoke-static {v0}, Lcom/vkontakte/android/ui/PhotoView;->access$2600(Lcom/vkontakte/android/ui/PhotoView;)Lcom/vkontakte/android/ui/ClippingImageView;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/ui/ClippingImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    goto :goto_1
.end method

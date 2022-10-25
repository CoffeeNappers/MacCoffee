.class Lcom/vkontakte/android/ui/PhotoView$ImageLoadTask$3;
.super Ljava/lang/Object;
.source "PhotoView.java"

# interfaces
.implements Lcom/vk/imageloader/VKImageRequestProgress;


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
    .line 1608
    iput-object p1, p0, Lcom/vkontakte/android/ui/PhotoView$ImageLoadTask$3;->this$1:Lcom/vkontakte/android/ui/PhotoView$ImageLoadTask;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onProgressUpdate(F)V
    .locals 2
    .param p1, "progress"    # F

    .prologue
    .line 1611
    iget-object v0, p0, Lcom/vkontakte/android/ui/PhotoView$ImageLoadTask$3;->this$1:Lcom/vkontakte/android/ui/PhotoView$ImageLoadTask;

    iget v0, v0, Lcom/vkontakte/android/ui/PhotoView$ImageLoadTask;->index:I

    iget-object v1, p0, Lcom/vkontakte/android/ui/PhotoView$ImageLoadTask$3;->this$1:Lcom/vkontakte/android/ui/PhotoView$ImageLoadTask;

    iget-object v1, v1, Lcom/vkontakte/android/ui/PhotoView$ImageLoadTask;->this$0:Lcom/vkontakte/android/ui/PhotoView;

    invoke-static {v1}, Lcom/vkontakte/android/ui/PhotoView;->access$3900(Lcom/vkontakte/android/ui/PhotoView;)I

    move-result v1

    if-ne v0, v1, :cond_0

    .line 1612
    iget-object v0, p0, Lcom/vkontakte/android/ui/PhotoView$ImageLoadTask$3;->this$1:Lcom/vkontakte/android/ui/PhotoView$ImageLoadTask;

    iget-object v0, v0, Lcom/vkontakte/android/ui/PhotoView$ImageLoadTask;->this$0:Lcom/vkontakte/android/ui/PhotoView;

    invoke-virtual {v0}, Lcom/vkontakte/android/ui/PhotoView;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/vkontakte/android/utils/Utils;->castToActivity(Landroid/content/Context;)Landroid/app/Activity;

    move-result-object v0

    new-instance v1, Lcom/vkontakte/android/ui/PhotoView$ImageLoadTask$3$1;

    invoke-direct {v1, p0, p1}, Lcom/vkontakte/android/ui/PhotoView$ImageLoadTask$3$1;-><init>(Lcom/vkontakte/android/ui/PhotoView$ImageLoadTask$3;F)V

    invoke-virtual {v0, v1}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 1619
    :cond_0
    return-void
.end method

.class Lcom/vkontakte/android/ui/PhotoView$ImageLoadTask$3$1;
.super Ljava/lang/Object;
.source "PhotoView.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/ui/PhotoView$ImageLoadTask$3;->onProgressUpdate(F)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$2:Lcom/vkontakte/android/ui/PhotoView$ImageLoadTask$3;

.field final synthetic val$progress:F


# direct methods
.method constructor <init>(Lcom/vkontakte/android/ui/PhotoView$ImageLoadTask$3;F)V
    .locals 0
    .param p1, "this$2"    # Lcom/vkontakte/android/ui/PhotoView$ImageLoadTask$3;

    .prologue
    .line 1612
    iput-object p1, p0, Lcom/vkontakte/android/ui/PhotoView$ImageLoadTask$3$1;->this$2:Lcom/vkontakte/android/ui/PhotoView$ImageLoadTask$3;

    iput p2, p0, Lcom/vkontakte/android/ui/PhotoView$ImageLoadTask$3$1;->val$progress:F

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .prologue
    .line 1614
    iget-object v0, p0, Lcom/vkontakte/android/ui/PhotoView$ImageLoadTask$3$1;->this$2:Lcom/vkontakte/android/ui/PhotoView$ImageLoadTask$3;

    iget-object v0, v0, Lcom/vkontakte/android/ui/PhotoView$ImageLoadTask$3;->this$1:Lcom/vkontakte/android/ui/PhotoView$ImageLoadTask;

    iget-object v0, v0, Lcom/vkontakte/android/ui/PhotoView$ImageLoadTask;->this$0:Lcom/vkontakte/android/ui/PhotoView;

    invoke-static {v0}, Lcom/vkontakte/android/ui/PhotoView;->access$1500(Lcom/vkontakte/android/ui/PhotoView;)Lcom/vkontakte/android/ui/CircularProgressBar;

    move-result-object v0

    iget v1, p0, Lcom/vkontakte/android/ui/PhotoView$ImageLoadTask$3$1;->val$progress:F

    float-to-double v2, v1

    invoke-virtual {v0, v2, v3}, Lcom/vkontakte/android/ui/CircularProgressBar;->setProgress(D)V

    .line 1615
    iget-object v0, p0, Lcom/vkontakte/android/ui/PhotoView$ImageLoadTask$3$1;->this$2:Lcom/vkontakte/android/ui/PhotoView$ImageLoadTask$3;

    iget-object v0, v0, Lcom/vkontakte/android/ui/PhotoView$ImageLoadTask$3;->this$1:Lcom/vkontakte/android/ui/PhotoView$ImageLoadTask;

    iget-object v0, v0, Lcom/vkontakte/android/ui/PhotoView$ImageLoadTask;->this$0:Lcom/vkontakte/android/ui/PhotoView;

    invoke-static {v0}, Lcom/vkontakte/android/ui/PhotoView;->access$1600(Lcom/vkontakte/android/ui/PhotoView;)Landroid/view/View;

    move-result-object v0

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 1616
    return-void
.end method

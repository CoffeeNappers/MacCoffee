.class Lcom/vkontakte/android/ui/PhotoView$ImageLoadTask$2$1;
.super Ljava/lang/Object;
.source "PhotoView.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/ui/PhotoView$ImageLoadTask$2;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$2:Lcom/vkontakte/android/ui/PhotoView$ImageLoadTask$2;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/ui/PhotoView$ImageLoadTask$2;)V
    .locals 0
    .param p1, "this$2"    # Lcom/vkontakte/android/ui/PhotoView$ImageLoadTask$2;

    .prologue
    .line 1579
    iput-object p1, p0, Lcom/vkontakte/android/ui/PhotoView$ImageLoadTask$2$1;->this$2:Lcom/vkontakte/android/ui/PhotoView$ImageLoadTask$2;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 1581
    iget-object v0, p0, Lcom/vkontakte/android/ui/PhotoView$ImageLoadTask$2$1;->this$2:Lcom/vkontakte/android/ui/PhotoView$ImageLoadTask$2;

    iget-object v0, v0, Lcom/vkontakte/android/ui/PhotoView$ImageLoadTask$2;->this$1:Lcom/vkontakte/android/ui/PhotoView$ImageLoadTask;

    iget-object v0, v0, Lcom/vkontakte/android/ui/PhotoView$ImageLoadTask;->this$0:Lcom/vkontakte/android/ui/PhotoView;

    invoke-static {v0}, Lcom/vkontakte/android/ui/PhotoView;->access$1500(Lcom/vkontakte/android/ui/PhotoView;)Lcom/vkontakte/android/ui/CircularProgressBar;

    move-result-object v0

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lme/grishka/appkit/utils/V;->setVisibilityAnimated(Landroid/view/View;I)V

    .line 1583
    iget-object v0, p0, Lcom/vkontakte/android/ui/PhotoView$ImageLoadTask$2$1;->this$2:Lcom/vkontakte/android/ui/PhotoView$ImageLoadTask$2;

    iget-object v0, v0, Lcom/vkontakte/android/ui/PhotoView$ImageLoadTask$2;->this$1:Lcom/vkontakte/android/ui/PhotoView$ImageLoadTask;

    iget-object v0, v0, Lcom/vkontakte/android/ui/PhotoView$ImageLoadTask;->this$0:Lcom/vkontakte/android/ui/PhotoView;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/vkontakte/android/ui/PhotoView;->access$4002(Lcom/vkontakte/android/ui/PhotoView;Ljava/lang/Runnable;)Ljava/lang/Runnable;

    .line 1584
    return-void
.end method

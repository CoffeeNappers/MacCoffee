.class Lcom/vkontakte/android/ui/animation/MovieDrawable$1;
.super Ljava/lang/Object;
.source "MovieDrawable.java"

# interfaces
.implements Lcom/vk/medianative/MediaAnimationPlayer$Listener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/ui/animation/MovieDrawable;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/ui/animation/MovieDrawable;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/ui/animation/MovieDrawable;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/ui/animation/MovieDrawable;

    .prologue
    .line 19
    iput-object p1, p0, Lcom/vkontakte/android/ui/animation/MovieDrawable$1;->this$0:Lcom/vkontakte/android/ui/animation/MovieDrawable;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onComplete()V
    .locals 1

    .prologue
    .line 37
    iget-object v0, p0, Lcom/vkontakte/android/ui/animation/MovieDrawable$1;->this$0:Lcom/vkontakte/android/ui/animation/MovieDrawable;

    invoke-static {v0}, Lcom/vkontakte/android/ui/animation/MovieDrawable;->access$200(Lcom/vkontakte/android/ui/animation/MovieDrawable;)Lcom/vkontakte/android/background/WorkerThread;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 38
    iget-object v0, p0, Lcom/vkontakte/android/ui/animation/MovieDrawable$1;->this$0:Lcom/vkontakte/android/ui/animation/MovieDrawable;

    invoke-static {v0}, Lcom/vkontakte/android/ui/animation/MovieDrawable;->access$200(Lcom/vkontakte/android/ui/animation/MovieDrawable;)Lcom/vkontakte/android/background/WorkerThread;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vkontakte/android/background/WorkerThread;->interrupt()V

    .line 40
    :cond_0
    return-void
.end method

.method public onDraw(J)V
    .locals 3
    .param p1, "delay"    # J

    .prologue
    .line 27
    iget-object v0, p0, Lcom/vkontakte/android/ui/animation/MovieDrawable$1;->this$0:Lcom/vkontakte/android/ui/animation/MovieDrawable;

    invoke-static {v0}, Lcom/vkontakte/android/ui/animation/MovieDrawable;->access$200(Lcom/vkontakte/android/ui/animation/MovieDrawable;)Lcom/vkontakte/android/background/WorkerThread;

    move-result-object v0

    iget-object v1, p0, Lcom/vkontakte/android/ui/animation/MovieDrawable$1;->this$0:Lcom/vkontakte/android/ui/animation/MovieDrawable;

    invoke-static {v1}, Lcom/vkontakte/android/ui/animation/MovieDrawable;->access$100(Lcom/vkontakte/android/ui/animation/MovieDrawable;)Lcom/vk/medianative/MediaAnimationPlayer;

    move-result-object v1

    invoke-virtual {v0, v1, p1, p2}, Lcom/vkontakte/android/background/WorkerThread;->postRunnable(Ljava/lang/Runnable;J)V

    .line 28
    return-void
.end method

.method public onPrepared()V
    .locals 1

    .prologue
    .line 22
    iget-object v0, p0, Lcom/vkontakte/android/ui/animation/MovieDrawable$1;->this$0:Lcom/vkontakte/android/ui/animation/MovieDrawable;

    invoke-static {v0}, Lcom/vkontakte/android/ui/animation/MovieDrawable;->access$000(Lcom/vkontakte/android/ui/animation/MovieDrawable;)Ljava/lang/Runnable;

    move-result-object v0

    invoke-static {v0}, Lcom/vkontakte/android/ViewUtils;->post(Ljava/lang/Runnable;)V

    .line 23
    return-void
.end method

.method public onRedraw()V
    .locals 1

    .prologue
    .line 32
    iget-object v0, p0, Lcom/vkontakte/android/ui/animation/MovieDrawable$1;->this$0:Lcom/vkontakte/android/ui/animation/MovieDrawable;

    invoke-static {v0}, Lcom/vkontakte/android/ui/animation/MovieDrawable;->access$300(Lcom/vkontakte/android/ui/animation/MovieDrawable;)Ljava/lang/Runnable;

    move-result-object v0

    invoke-static {v0}, Lcom/vkontakte/android/ViewUtils;->post(Ljava/lang/Runnable;)V

    .line 33
    return-void
.end method

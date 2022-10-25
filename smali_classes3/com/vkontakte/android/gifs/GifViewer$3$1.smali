.class Lcom/vkontakte/android/gifs/GifViewer$3$1;
.super Landroid/animation/AnimatorListenerAdapter;
.source "GifViewer.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/gifs/GifViewer$3;->onPreDraw()Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/vkontakte/android/gifs/GifViewer$3;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/gifs/GifViewer$3;)V
    .locals 0
    .param p1, "this$1"    # Lcom/vkontakte/android/gifs/GifViewer$3;

    .prologue
    .line 420
    iput-object p1, p0, Lcom/vkontakte/android/gifs/GifViewer$3$1;->this$1:Lcom/vkontakte/android/gifs/GifViewer$3;

    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 1
    .param p1, "a"    # Landroid/animation/Animator;

    .prologue
    .line 422
    iget-object v0, p0, Lcom/vkontakte/android/gifs/GifViewer$3$1;->this$1:Lcom/vkontakte/android/gifs/GifViewer$3;

    iget-object v0, v0, Lcom/vkontakte/android/gifs/GifViewer$3;->val$after:Ljava/lang/Runnable;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {v0}, Lcom/vkontakte/android/gifs/GifViewer$3$1$$Lambda$1;->lambdaFactory$(Ljava/lang/Runnable;)Ljava/lang/Runnable;

    move-result-object v0

    invoke-static {v0}, Lcom/vkontakte/android/ViewUtils;->post(Ljava/lang/Runnable;)V

    .line 423
    return-void
.end method

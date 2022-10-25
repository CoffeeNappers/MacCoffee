.class Lcom/vkontakte/android/gifs/GifViewer$1;
.super Lcom/vk/core/widget/LifecycleListener;
.source "GifViewer.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/gifs/GifViewer;-><init>(Landroid/app/Activity;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/gifs/GifViewer;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/gifs/GifViewer;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/gifs/GifViewer;

    .prologue
    .line 138
    iput-object p1, p0, Lcom/vkontakte/android/gifs/GifViewer$1;->this$0:Lcom/vkontakte/android/gifs/GifViewer;

    invoke-direct {p0}, Lcom/vk/core/widget/LifecycleListener;-><init>()V

    return-void
.end method


# virtual methods
.method public onActivityPaused(Landroid/app/Activity;)V
    .locals 1
    .param p1, "activity"    # Landroid/app/Activity;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 148
    iget-object v0, p0, Lcom/vkontakte/android/gifs/GifViewer$1;->this$0:Lcom/vkontakte/android/gifs/GifViewer;

    iget-object v0, v0, Lcom/vkontakte/android/gifs/GifViewer;->mDrawable:Lcom/vkontakte/android/ui/animation/MovieDrawable;

    if-eqz v0, :cond_0

    .line 149
    iget-object v0, p0, Lcom/vkontakte/android/gifs/GifViewer$1;->this$0:Lcom/vkontakte/android/gifs/GifViewer;

    iget-object v0, v0, Lcom/vkontakte/android/gifs/GifViewer;->mDrawable:Lcom/vkontakte/android/ui/animation/MovieDrawable;

    invoke-virtual {v0}, Lcom/vkontakte/android/ui/animation/MovieDrawable;->stop()V

    .line 151
    :cond_0
    return-void
.end method

.method public onActivityResumed(Landroid/app/Activity;)V
    .locals 1
    .param p1, "activity"    # Landroid/app/Activity;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 141
    iget-object v0, p0, Lcom/vkontakte/android/gifs/GifViewer$1;->this$0:Lcom/vkontakte/android/gifs/GifViewer;

    iget-object v0, v0, Lcom/vkontakte/android/gifs/GifViewer;->mDrawable:Lcom/vkontakte/android/ui/animation/MovieDrawable;

    if-eqz v0, :cond_0

    .line 142
    iget-object v0, p0, Lcom/vkontakte/android/gifs/GifViewer$1;->this$0:Lcom/vkontakte/android/gifs/GifViewer;

    iget-object v0, v0, Lcom/vkontakte/android/gifs/GifViewer;->mDrawable:Lcom/vkontakte/android/ui/animation/MovieDrawable;

    invoke-virtual {v0}, Lcom/vkontakte/android/ui/animation/MovieDrawable;->start()V

    .line 144
    :cond_0
    return-void
.end method

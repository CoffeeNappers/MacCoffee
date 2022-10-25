.class Lcom/vkontakte/android/activities/VideoPlayerActivity$5;
.super Ljava/lang/Object;
.source "VideoPlayerActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/activities/VideoPlayerActivity;->createUI(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/activities/VideoPlayerActivity;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/activities/VideoPlayerActivity;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/activities/VideoPlayerActivity;

    .prologue
    .line 216
    iput-object p1, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity$5;->this$0:Lcom/vkontakte/android/activities/VideoPlayerActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 219
    iget-object v0, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity$5;->this$0:Lcom/vkontakte/android/activities/VideoPlayerActivity;

    iget-object v1, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity$5;->this$0:Lcom/vkontakte/android/activities/VideoPlayerActivity;

    invoke-virtual {v1}, Lcom/vkontakte/android/activities/VideoPlayerActivity;->getHideDelay()I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/activities/VideoPlayerActivity;->hideUIDelayed(I)V

    .line 220
    iget-object v0, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity$5;->this$0:Lcom/vkontakte/android/activities/VideoPlayerActivity;

    iget-object v1, v0, Lcom/vkontakte/android/activities/VideoPlayerActivity;->mOrientier:Lcom/vkontakte/android/activities/VideoPlayerActivity$Orientier;

    iget-object v0, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity$5;->this$0:Lcom/vkontakte/android/activities/VideoPlayerActivity;

    iget-boolean v0, v0, Lcom/vkontakte/android/activities/VideoPlayerActivity;->landscape:Z

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    invoke-virtual {v1, v0}, Lcom/vkontakte/android/activities/VideoPlayerActivity$Orientier;->force(I)V

    .line 222
    return-void

    .line 220
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

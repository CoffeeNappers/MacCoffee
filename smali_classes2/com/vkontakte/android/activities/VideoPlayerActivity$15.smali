.class Lcom/vkontakte/android/activities/VideoPlayerActivity$15;
.super Ljava/lang/Object;
.source "VideoPlayerActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/activities/VideoPlayerActivity;->hideUIDelayed(I)V
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
    .line 608
    iput-object p1, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity$15;->this$0:Lcom/vkontakte/android/activities/VideoPlayerActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 611
    iget-object v0, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity$15;->this$0:Lcom/vkontakte/android/activities/VideoPlayerActivity;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/activities/VideoPlayerActivity;->setUIVisibility(Z)V

    .line 612
    iget-object v0, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity$15;->this$0:Lcom/vkontakte/android/activities/VideoPlayerActivity;

    const/4 v1, 0x0

    iput-object v1, v0, Lcom/vkontakte/android/activities/VideoPlayerActivity;->mHideUiAction:Ljava/lang/Runnable;

    .line 613
    return-void
.end method

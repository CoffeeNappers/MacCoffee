.class Lcom/vkontakte/android/activities/VideoPlayerActivity$Orientier$1;
.super Ljava/lang/Object;
.source "VideoPlayerActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/activities/VideoPlayerActivity$Orientier;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/vkontakte/android/activities/VideoPlayerActivity$Orientier;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/activities/VideoPlayerActivity$Orientier;)V
    .locals 0
    .param p1, "this$1"    # Lcom/vkontakte/android/activities/VideoPlayerActivity$Orientier;

    .prologue
    .line 1108
    iput-object p1, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity$Orientier$1;->this$1:Lcom/vkontakte/android/activities/VideoPlayerActivity$Orientier;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 1111
    iget-object v0, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity$Orientier$1;->this$1:Lcom/vkontakte/android/activities/VideoPlayerActivity$Orientier;

    iget-object v0, v0, Lcom/vkontakte/android/activities/VideoPlayerActivity$Orientier;->this$0:Lcom/vkontakte/android/activities/VideoPlayerActivity;

    iget-object v1, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity$Orientier$1;->this$1:Lcom/vkontakte/android/activities/VideoPlayerActivity$Orientier;

    iget v1, v1, Lcom/vkontakte/android/activities/VideoPlayerActivity$Orientier;->mLastOrientation:I

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/activities/VideoPlayerActivity;->setRequestedOrientation(I)V

    .line 1112
    return-void
.end method

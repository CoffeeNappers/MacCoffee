.class Lcom/vkontakte/android/activities/VideoPlayerActivity$10;
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
    .line 272
    iput-object p1, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity$10;->this$0:Lcom/vkontakte/android/activities/VideoPlayerActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 275
    iget-object v0, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity$10;->this$0:Lcom/vkontakte/android/activities/VideoPlayerActivity;

    const/16 v1, 0xbb8

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/activities/VideoPlayerActivity;->hideUIDelayed(I)V

    .line 276
    iget-object v0, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity$10;->this$0:Lcom/vkontakte/android/activities/VideoPlayerActivity;

    invoke-virtual {v0}, Lcom/vkontakte/android/activities/VideoPlayerActivity;->resize()V

    .line 277
    return-void
.end method

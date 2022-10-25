.class Lcom/vkontakte/android/activities/VideoPlayerActivity$3;
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
    .line 186
    iput-object p1, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity$3;->this$0:Lcom/vkontakte/android/activities/VideoPlayerActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 189
    iget-object v0, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity$3;->this$0:Lcom/vkontakte/android/activities/VideoPlayerActivity;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/activities/VideoPlayerActivity;->replay(I)V

    .line 190
    return-void
.end method

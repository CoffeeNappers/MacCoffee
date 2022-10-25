.class Lcom/vkontakte/android/activities/VideoEmbedPlayerActivity$1;
.super Lcom/vkontakte/android/api/SimpleCallback;
.source "VideoEmbedPlayerActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/activities/VideoEmbedPlayerActivity;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/api/SimpleCallback",
        "<",
        "Lcom/vkontakte/android/api/VideoFile;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/activities/VideoEmbedPlayerActivity;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/activities/VideoEmbedPlayerActivity;Landroid/content/Context;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/activities/VideoEmbedPlayerActivity;
    .param p2, "context"    # Landroid/content/Context;

    .prologue
    .line 68
    iput-object p1, p0, Lcom/vkontakte/android/activities/VideoEmbedPlayerActivity$1;->this$0:Lcom/vkontakte/android/activities/VideoEmbedPlayerActivity;

    invoke-direct {p0, p2}, Lcom/vkontakte/android/api/SimpleCallback;-><init>(Landroid/content/Context;)V

    return-void
.end method


# virtual methods
.method public success(Lcom/vkontakte/android/api/VideoFile;)V
    .locals 1
    .param p1, "result"    # Lcom/vkontakte/android/api/VideoFile;

    .prologue
    .line 71
    iget-object v0, p0, Lcom/vkontakte/android/activities/VideoEmbedPlayerActivity$1;->this$0:Lcom/vkontakte/android/activities/VideoEmbedPlayerActivity;

    iput-object p1, v0, Lcom/vkontakte/android/activities/VideoEmbedPlayerActivity;->file:Lcom/vkontakte/android/api/VideoFile;

    .line 72
    iget-object v0, p0, Lcom/vkontakte/android/activities/VideoEmbedPlayerActivity$1;->this$0:Lcom/vkontakte/android/activities/VideoEmbedPlayerActivity;

    invoke-virtual {v0}, Lcom/vkontakte/android/activities/VideoEmbedPlayerActivity;->startLoading()V

    .line 73
    return-void
.end method

.method public bridge synthetic success(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 68
    check-cast p1, Lcom/vkontakte/android/api/VideoFile;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/activities/VideoEmbedPlayerActivity$1;->success(Lcom/vkontakte/android/api/VideoFile;)V

    return-void
.end method

.class Lcom/vkontakte/android/activities/BaseVideoActivity$3;
.super Ljava/lang/Object;
.source "BaseVideoActivity.java"

# interfaces
.implements Lcom/vkontakte/android/api/Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/activities/BaseVideoActivity;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/vkontakte/android/api/Callback",
        "<",
        "Lcom/vkontakte/android/api/VideoFile;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/activities/BaseVideoActivity;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/activities/BaseVideoActivity;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/activities/BaseVideoActivity;

    .prologue
    .line 193
    iput-object p1, p0, Lcom/vkontakte/android/activities/BaseVideoActivity$3;->this$0:Lcom/vkontakte/android/activities/BaseVideoActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public fail(Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;)V
    .locals 0
    .param p1, "error"    # Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;

    .prologue
    .line 203
    return-void
.end method

.method public success(Lcom/vkontakte/android/api/VideoFile;)V
    .locals 1
    .param p1, "video"    # Lcom/vkontakte/android/api/VideoFile;

    .prologue
    .line 196
    iget-object v0, p0, Lcom/vkontakte/android/activities/BaseVideoActivity$3;->this$0:Lcom/vkontakte/android/activities/BaseVideoActivity;

    invoke-static {v0, p1}, Lcom/vkontakte/android/activities/BaseVideoActivity;->access$300(Lcom/vkontakte/android/activities/BaseVideoActivity;Lcom/vkontakte/android/api/VideoFile;)V

    .line 197
    iget-object v0, p0, Lcom/vkontakte/android/activities/BaseVideoActivity$3;->this$0:Lcom/vkontakte/android/activities/BaseVideoActivity;

    invoke-virtual {v0, p1}, Lcom/vkontakte/android/activities/BaseVideoActivity;->bindInfo(Lcom/vkontakte/android/api/VideoFile;)V

    .line 198
    iget-object v0, p0, Lcom/vkontakte/android/activities/BaseVideoActivity$3;->this$0:Lcom/vkontakte/android/activities/BaseVideoActivity;

    invoke-virtual {v0}, Lcom/vkontakte/android/activities/BaseVideoActivity;->invalidateOptionsMenu()V

    .line 199
    return-void
.end method

.method public bridge synthetic success(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 193
    check-cast p1, Lcom/vkontakte/android/api/VideoFile;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/activities/BaseVideoActivity$3;->success(Lcom/vkontakte/android/api/VideoFile;)V

    return-void
.end method

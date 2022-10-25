.class Lcom/vkontakte/android/activities/BaseVideoActivity$2;
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
    .line 164
    iput-object p1, p0, Lcom/vkontakte/android/activities/BaseVideoActivity$2;->this$0:Lcom/vkontakte/android/activities/BaseVideoActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public fail(Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;)V
    .locals 2
    .param p1, "error"    # Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;

    .prologue
    .line 185
    iget-object v0, p0, Lcom/vkontakte/android/activities/BaseVideoActivity$2;->this$0:Lcom/vkontakte/android/activities/BaseVideoActivity;

    const/4 v1, -0x1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/activities/BaseVideoActivity;->displayError(I)V

    .line 186
    return-void
.end method

.method public success(Lcom/vkontakte/android/api/VideoFile;)V
    .locals 3
    .param p1, "video"    # Lcom/vkontakte/android/api/VideoFile;

    .prologue
    .line 167
    if-nez p1, :cond_0

    .line 168
    iget-object v0, p0, Lcom/vkontakte/android/activities/BaseVideoActivity$2;->this$0:Lcom/vkontakte/android/activities/BaseVideoActivity;

    const v1, 0x7f080516

    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 169
    iget-object v0, p0, Lcom/vkontakte/android/activities/BaseVideoActivity$2;->this$0:Lcom/vkontakte/android/activities/BaseVideoActivity;

    invoke-virtual {v0}, Lcom/vkontakte/android/activities/BaseVideoActivity;->finish()V

    .line 181
    :goto_0
    return-void

    .line 172
    :cond_0
    iget-boolean v0, p1, Lcom/vkontakte/android/api/VideoFile;->processing:Z

    if-eqz v0, :cond_1

    iget-object v0, p1, Lcom/vkontakte/android/api/VideoFile;->url240:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 173
    iget-object v0, p0, Lcom/vkontakte/android/activities/BaseVideoActivity$2;->this$0:Lcom/vkontakte/android/activities/BaseVideoActivity;

    const/4 v1, 0x4

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/activities/BaseVideoActivity;->displayError(I)V

    goto :goto_0

    .line 176
    :cond_1
    iget-object v0, p0, Lcom/vkontakte/android/activities/BaseVideoActivity$2;->this$0:Lcom/vkontakte/android/activities/BaseVideoActivity;

    invoke-static {v0, p1}, Lcom/vkontakte/android/activities/BaseVideoActivity;->access$300(Lcom/vkontakte/android/activities/BaseVideoActivity;Lcom/vkontakte/android/api/VideoFile;)V

    .line 177
    iget-object v0, p0, Lcom/vkontakte/android/activities/BaseVideoActivity$2;->this$0:Lcom/vkontakte/android/activities/BaseVideoActivity;

    invoke-virtual {v0, p1}, Lcom/vkontakte/android/activities/BaseVideoActivity;->bindInfo(Lcom/vkontakte/android/api/VideoFile;)V

    .line 178
    iget-object v0, p0, Lcom/vkontakte/android/activities/BaseVideoActivity$2;->this$0:Lcom/vkontakte/android/activities/BaseVideoActivity;

    invoke-virtual {v0}, Lcom/vkontakte/android/activities/BaseVideoActivity;->invalidateOptionsMenu()V

    .line 179
    iget-object v0, p0, Lcom/vkontakte/android/activities/BaseVideoActivity$2;->this$0:Lcom/vkontakte/android/activities/BaseVideoActivity;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/activities/BaseVideoActivity;->blockingSetUIVisibility(Z)V

    .line 180
    iget-object v0, p0, Lcom/vkontakte/android/activities/BaseVideoActivity$2;->this$0:Lcom/vkontakte/android/activities/BaseVideoActivity;

    invoke-virtual {v0, p1}, Lcom/vkontakte/android/activities/BaseVideoActivity;->startFile(Lcom/vkontakte/android/api/VideoFile;)V

    goto :goto_0
.end method

.method public bridge synthetic success(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 164
    check-cast p1, Lcom/vkontakte/android/api/VideoFile;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/activities/BaseVideoActivity$2;->success(Lcom/vkontakte/android/api/VideoFile;)V

    return-void
.end method

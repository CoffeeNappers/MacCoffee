.class Lcom/vkontakte/android/LinkRedirActivity$6;
.super Ljava/lang/Object;
.source "LinkRedirActivity.java"

# interfaces
.implements Lcom/vkontakte/android/api/Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/LinkRedirActivity;->onCreate(Landroid/os/Bundle;)V
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
.field final synthetic this$0:Lcom/vkontakte/android/LinkRedirActivity;

.field final synthetic val$uri:Landroid/net/Uri;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/LinkRedirActivity;Landroid/net/Uri;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/LinkRedirActivity;

    .prologue
    .line 953
    iput-object p1, p0, Lcom/vkontakte/android/LinkRedirActivity$6;->this$0:Lcom/vkontakte/android/LinkRedirActivity;

    iput-object p2, p0, Lcom/vkontakte/android/LinkRedirActivity$6;->val$uri:Landroid/net/Uri;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public fail(Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;)V
    .locals 2
    .param p1, "error"    # Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;

    .prologue
    .line 972
    iget-object v0, p0, Lcom/vkontakte/android/LinkRedirActivity$6;->this$0:Lcom/vkontakte/android/LinkRedirActivity;

    invoke-virtual {v0}, Lcom/vkontakte/android/LinkRedirActivity;->finish()V

    .line 973
    iget-object v0, p0, Lcom/vkontakte/android/LinkRedirActivity$6;->this$0:Lcom/vkontakte/android/LinkRedirActivity;

    iget-object v1, p0, Lcom/vkontakte/android/LinkRedirActivity$6;->val$uri:Landroid/net/Uri;

    invoke-static {v0, v1}, Lcom/vkontakte/android/LinkRedirActivity;->access$000(Lcom/vkontakte/android/LinkRedirActivity;Landroid/net/Uri;)V

    .line 974
    return-void
.end method

.method public success(Lcom/vkontakte/android/api/VideoFile;)V
    .locals 5
    .param p1, "video"    # Lcom/vkontakte/android/api/VideoFile;

    .prologue
    .line 956
    iget-object v1, p0, Lcom/vkontakte/android/LinkRedirActivity$6;->this$0:Lcom/vkontakte/android/LinkRedirActivity;

    const/4 v2, -0x1

    invoke-virtual {v1, v2}, Lcom/vkontakte/android/LinkRedirActivity;->setResult(I)V

    .line 957
    iget-object v1, p0, Lcom/vkontakte/android/LinkRedirActivity$6;->this$0:Lcom/vkontakte/android/LinkRedirActivity;

    invoke-virtual {v1}, Lcom/vkontakte/android/LinkRedirActivity;->finish()V

    .line 959
    iget-object v1, p0, Lcom/vkontakte/android/LinkRedirActivity$6;->val$uri:Landroid/net/Uri;

    const-string/jumbo v2, "reply"

    invoke-virtual {v1, v2}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 960
    new-instance v1, Lcom/vkontakte/android/fragments/PostViewFragment$Builder;

    invoke-virtual {p1}, Lcom/vkontakte/android/api/VideoFile;->convertToPost()Lcom/vkontakte/android/NewsEntry;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/vkontakte/android/fragments/PostViewFragment$Builder;-><init>(Lcom/vkontakte/android/NewsEntry;)V

    iget-object v2, p0, Lcom/vkontakte/android/LinkRedirActivity$6;->this$0:Lcom/vkontakte/android/LinkRedirActivity;

    iget-object v3, p0, Lcom/vkontakte/android/LinkRedirActivity$6;->val$uri:Landroid/net/Uri;

    const-string/jumbo v4, "reply"

    .line 961
    invoke-virtual {v3, v4}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/vkontakte/android/LinkRedirActivity;->access$300(Lcom/vkontakte/android/LinkRedirActivity;Ljava/lang/String;)I

    move-result v2

    invoke-virtual {v1, v2}, Lcom/vkontakte/android/fragments/PostViewFragment$Builder;->setComment(I)Lcom/vkontakte/android/fragments/PostViewFragment$Builder;

    move-result-object v1

    iget-object v2, p0, Lcom/vkontakte/android/LinkRedirActivity$6;->this$0:Lcom/vkontakte/android/LinkRedirActivity;

    .line 962
    invoke-virtual {v1, v2}, Lcom/vkontakte/android/fragments/PostViewFragment$Builder;->go(Landroid/content/Context;)Z

    .line 968
    :goto_0
    return-void

    .line 964
    :cond_0
    new-instance v0, Landroid/content/Intent;

    iget-object v1, p0, Lcom/vkontakte/android/LinkRedirActivity$6;->this$0:Lcom/vkontakte/android/LinkRedirActivity;

    const-class v2, Lcom/vkontakte/android/activities/VideoPlayerActivity;

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 965
    .local v0, "intent":Landroid/content/Intent;
    const-string/jumbo v1, "file"

    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 966
    iget-object v1, p0, Lcom/vkontakte/android/LinkRedirActivity$6;->this$0:Lcom/vkontakte/android/LinkRedirActivity;

    invoke-virtual {v1, v0}, Lcom/vkontakte/android/LinkRedirActivity;->startActivity(Landroid/content/Intent;)V

    goto :goto_0
.end method

.method public bridge synthetic success(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 953
    check-cast p1, Lcom/vkontakte/android/api/VideoFile;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/LinkRedirActivity$6;->success(Lcom/vkontakte/android/api/VideoFile;)V

    return-void
.end method

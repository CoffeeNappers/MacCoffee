.class Lcom/vkontakte/android/LinkRedirActivity$9;
.super Lcom/vkontakte/android/api/SimpleCallback;
.source "LinkRedirActivity.java"


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
        "Lcom/vkontakte/android/api/SimpleCallback",
        "<[",
        "Lcom/vkontakte/android/NewsEntry;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/LinkRedirActivity;

.field final synthetic val$uri:Landroid/net/Uri;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/LinkRedirActivity;Landroid/content/Context;Landroid/net/Uri;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/LinkRedirActivity;
    .param p2, "context"    # Landroid/content/Context;

    .prologue
    .line 1118
    iput-object p1, p0, Lcom/vkontakte/android/LinkRedirActivity$9;->this$0:Lcom/vkontakte/android/LinkRedirActivity;

    iput-object p3, p0, Lcom/vkontakte/android/LinkRedirActivity$9;->val$uri:Landroid/net/Uri;

    invoke-direct {p0, p2}, Lcom/vkontakte/android/api/SimpleCallback;-><init>(Landroid/content/Context;)V

    return-void
.end method


# virtual methods
.method public fail(Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;)V
    .locals 2
    .param p1, "err"    # Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;

    .prologue
    .line 1136
    iget-object v0, p0, Lcom/vkontakte/android/LinkRedirActivity$9;->this$0:Lcom/vkontakte/android/LinkRedirActivity;

    invoke-virtual {v0}, Lcom/vkontakte/android/LinkRedirActivity;->finish()V

    .line 1137
    invoke-virtual {p1}, Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;->getCodeValue()I

    move-result v0

    const/4 v1, -0x1

    if-ne v0, v1, :cond_0

    .line 1138
    invoke-super {p0, p1}, Lcom/vkontakte/android/api/SimpleCallback;->fail(Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;)V

    .line 1142
    :goto_0
    return-void

    .line 1140
    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/LinkRedirActivity$9;->this$0:Lcom/vkontakte/android/LinkRedirActivity;

    iget-object v1, p0, Lcom/vkontakte/android/LinkRedirActivity$9;->val$uri:Landroid/net/Uri;

    invoke-static {v0, v1}, Lcom/vkontakte/android/LinkRedirActivity;->access$000(Lcom/vkontakte/android/LinkRedirActivity;Landroid/net/Uri;)V

    goto :goto_0
.end method

.method public bridge synthetic success(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 1118
    check-cast p1, [Lcom/vkontakte/android/NewsEntry;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/LinkRedirActivity$9;->success([Lcom/vkontakte/android/NewsEntry;)V

    return-void
.end method

.method public success([Lcom/vkontakte/android/NewsEntry;)V
    .locals 4
    .param p1, "news"    # [Lcom/vkontakte/android/NewsEntry;

    .prologue
    .line 1121
    iget-object v1, p0, Lcom/vkontakte/android/LinkRedirActivity$9;->this$0:Lcom/vkontakte/android/LinkRedirActivity;

    const/4 v2, -0x1

    invoke-virtual {v1, v2}, Lcom/vkontakte/android/LinkRedirActivity;->setResult(I)V

    .line 1122
    iget-object v1, p0, Lcom/vkontakte/android/LinkRedirActivity$9;->this$0:Lcom/vkontakte/android/LinkRedirActivity;

    invoke-virtual {v1}, Lcom/vkontakte/android/LinkRedirActivity;->finish()V

    .line 1123
    array-length v1, p1

    if-nez v1, :cond_0

    .line 1124
    iget-object v1, p0, Lcom/vkontakte/android/LinkRedirActivity$9;->this$0:Lcom/vkontakte/android/LinkRedirActivity;

    const v2, 0x7f080516

    invoke-static {v1, v2}, Lcom/vkontakte/android/LinkRedirActivity;->access$200(Lcom/vkontakte/android/LinkRedirActivity;I)V

    .line 1132
    :goto_0
    return-void

    .line 1127
    :cond_0
    new-instance v0, Lcom/vkontakte/android/fragments/PostViewFragment$Builder;

    const/4 v1, 0x0

    aget-object v1, p1, v1

    invoke-direct {v0, v1}, Lcom/vkontakte/android/fragments/PostViewFragment$Builder;-><init>(Lcom/vkontakte/android/NewsEntry;)V

    .line 1128
    .local v0, "builder":Lcom/vkontakte/android/fragments/PostViewFragment$Builder;
    iget-object v1, p0, Lcom/vkontakte/android/LinkRedirActivity$9;->val$uri:Landroid/net/Uri;

    const-string/jumbo v2, "reply"

    invoke-virtual {v1, v2}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_1

    .line 1129
    iget-object v1, p0, Lcom/vkontakte/android/LinkRedirActivity$9;->this$0:Lcom/vkontakte/android/LinkRedirActivity;

    iget-object v2, p0, Lcom/vkontakte/android/LinkRedirActivity$9;->val$uri:Landroid/net/Uri;

    const-string/jumbo v3, "reply"

    invoke-virtual {v2, v3}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/vkontakte/android/LinkRedirActivity;->access$300(Lcom/vkontakte/android/LinkRedirActivity;Ljava/lang/String;)I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/fragments/PostViewFragment$Builder;->setComment(I)Lcom/vkontakte/android/fragments/PostViewFragment$Builder;

    .line 1131
    :cond_1
    iget-object v1, p0, Lcom/vkontakte/android/LinkRedirActivity$9;->this$0:Lcom/vkontakte/android/LinkRedirActivity;

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/fragments/PostViewFragment$Builder;->go(Landroid/content/Context;)Z

    goto :goto_0
.end method

.class Lcom/vkontakte/android/LinkRedirActivity$7;
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
        "Lcom/vkontakte/android/api/board/BoardGetTopics$Result;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/LinkRedirActivity;

.field final synthetic val$oid:I

.field final synthetic val$tid:I

.field final synthetic val$uri:Landroid/net/Uri;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/LinkRedirActivity;IILandroid/net/Uri;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/LinkRedirActivity;

    .prologue
    .line 990
    iput-object p1, p0, Lcom/vkontakte/android/LinkRedirActivity$7;->this$0:Lcom/vkontakte/android/LinkRedirActivity;

    iput p2, p0, Lcom/vkontakte/android/LinkRedirActivity$7;->val$tid:I

    iput p3, p0, Lcom/vkontakte/android/LinkRedirActivity$7;->val$oid:I

    iput-object p4, p0, Lcom/vkontakte/android/LinkRedirActivity$7;->val$uri:Landroid/net/Uri;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public fail(Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;)V
    .locals 2
    .param p1, "error"    # Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;

    .prologue
    .line 1002
    iget-object v0, p0, Lcom/vkontakte/android/LinkRedirActivity$7;->this$0:Lcom/vkontakte/android/LinkRedirActivity;

    invoke-virtual {v0}, Lcom/vkontakte/android/LinkRedirActivity;->finish()V

    .line 1003
    iget-object v0, p0, Lcom/vkontakte/android/LinkRedirActivity$7;->this$0:Lcom/vkontakte/android/LinkRedirActivity;

    iget-object v1, p0, Lcom/vkontakte/android/LinkRedirActivity$7;->val$uri:Landroid/net/Uri;

    invoke-static {v0, v1}, Lcom/vkontakte/android/LinkRedirActivity;->access$000(Lcom/vkontakte/android/LinkRedirActivity;Landroid/net/Uri;)V

    .line 1004
    return-void
.end method

.method public success(Lcom/vkontakte/android/api/board/BoardGetTopics$Result;)V
    .locals 6
    .param p1, "res"    # Lcom/vkontakte/android/api/board/BoardGetTopics$Result;

    .prologue
    const/4 v1, 0x0

    .line 993
    iget-object v2, p0, Lcom/vkontakte/android/LinkRedirActivity$7;->this$0:Lcom/vkontakte/android/LinkRedirActivity;

    const/4 v3, -0x1

    invoke-virtual {v2, v3}, Lcom/vkontakte/android/LinkRedirActivity;->setResult(I)V

    .line 994
    iget-object v2, p0, Lcom/vkontakte/android/LinkRedirActivity$7;->this$0:Lcom/vkontakte/android/LinkRedirActivity;

    invoke-virtual {v2}, Lcom/vkontakte/android/LinkRedirActivity;->finish()V

    .line 995
    iget-object v2, p1, Lcom/vkontakte/android/api/board/BoardGetTopics$Result;->topics:Lcom/vkontakte/android/data/VKList;

    invoke-virtual {v2, v1}, Lcom/vkontakte/android/data/VKList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/api/BoardTopic;

    .line 996
    .local v0, "topic":Lcom/vkontakte/android/api/BoardTopic;
    new-instance v2, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment$Builder;

    iget v3, p0, Lcom/vkontakte/android/LinkRedirActivity$7;->val$tid:I

    iget v4, p0, Lcom/vkontakte/android/LinkRedirActivity$7;->val$oid:I

    iget-object v5, v0, Lcom/vkontakte/android/api/BoardTopic;->title:Ljava/lang/String;

    invoke-direct {v2, v3, v4, v5}, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment$Builder;-><init>(IILjava/lang/String;)V

    iget v3, v0, Lcom/vkontakte/android/api/BoardTopic;->flags:I

    and-int/lit8 v3, v3, 0x1

    if-lez v3, :cond_0

    const/4 v1, 0x1

    .line 997
    :cond_0
    invoke-virtual {v2, v1}, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment$Builder;->setIsClosed(Z)Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment$Builder;

    move-result-object v1

    iget-object v2, p0, Lcom/vkontakte/android/LinkRedirActivity$7;->this$0:Lcom/vkontakte/android/LinkRedirActivity;

    invoke-virtual {v1, v2}, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment$Builder;->go(Landroid/content/Context;)Z

    .line 998
    return-void
.end method

.method public bridge synthetic success(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 990
    check-cast p1, Lcom/vkontakte/android/api/board/BoardGetTopics$Result;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/LinkRedirActivity$7;->success(Lcom/vkontakte/android/api/board/BoardGetTopics$Result;)V

    return-void
.end method

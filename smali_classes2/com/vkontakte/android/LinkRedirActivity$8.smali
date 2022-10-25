.class Lcom/vkontakte/android/LinkRedirActivity$8;
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
        "Lorg/json/JSONObject;",
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
    .line 1047
    iput-object p1, p0, Lcom/vkontakte/android/LinkRedirActivity$8;->this$0:Lcom/vkontakte/android/LinkRedirActivity;

    iput-object p2, p0, Lcom/vkontakte/android/LinkRedirActivity$8;->val$uri:Landroid/net/Uri;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public fail(Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;)V
    .locals 2
    .param p1, "error"    # Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;

    .prologue
    .line 1105
    iget-object v0, p0, Lcom/vkontakte/android/LinkRedirActivity$8;->this$0:Lcom/vkontakte/android/LinkRedirActivity;

    invoke-virtual {v0}, Lcom/vkontakte/android/LinkRedirActivity;->finish()V

    .line 1106
    iget-object v0, p0, Lcom/vkontakte/android/LinkRedirActivity$8;->this$0:Lcom/vkontakte/android/LinkRedirActivity;

    iget-object v1, p0, Lcom/vkontakte/android/LinkRedirActivity$8;->val$uri:Landroid/net/Uri;

    invoke-static {v0, v1}, Lcom/vkontakte/android/LinkRedirActivity;->access$000(Lcom/vkontakte/android/LinkRedirActivity;Landroid/net/Uri;)V

    .line 1107
    return-void
.end method

.method public bridge synthetic success(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 1047
    check-cast p1, Lorg/json/JSONObject;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/LinkRedirActivity$8;->success(Lorg/json/JSONObject;)V

    return-void
.end method

.method public success(Lorg/json/JSONObject;)V
    .locals 10
    .param p1, "o"    # Lorg/json/JSONObject;

    .prologue
    .line 1050
    :try_start_0
    const-string/jumbo v6, "response"

    invoke-virtual {p1, v6}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v6

    const/4 v7, 0x0

    invoke-virtual {v6, v7}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v0

    .line 1051
    .local v0, "jp":Lorg/json/JSONObject;
    iget-object v6, p0, Lcom/vkontakte/android/LinkRedirActivity$8;->this$0:Lcom/vkontakte/android/LinkRedirActivity;

    const/4 v7, -0x1

    invoke-virtual {v6, v7}, Lcom/vkontakte/android/LinkRedirActivity;->setResult(I)V

    .line 1052
    new-instance v1, Lcom/vkontakte/android/Photo;

    invoke-direct {v1, v0}, Lcom/vkontakte/android/Photo;-><init>(Lorg/json/JSONObject;)V

    .line 1054
    .local v1, "photo":Lcom/vkontakte/android/Photo;
    iget-object v6, p0, Lcom/vkontakte/android/LinkRedirActivity$8;->val$uri:Landroid/net/Uri;

    const-string/jumbo v7, "reply"

    invoke-virtual {v6, v7}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    if-eqz v6, :cond_1

    .line 1056
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 1057
    .local v2, "userIds":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Integer;>;"
    iget v6, v1, Lcom/vkontakte/android/Photo;->userID:I

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v2, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1059
    invoke-static {v2}, Lcom/vkontakte/android/data/Friends;->getUsersBlocking(Ljava/util/List;)Ljava/util/ArrayList;

    move-result-object v3

    .line 1061
    .local v3, "users":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/UserProfile;>;"
    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v6

    if-lez v6, :cond_0

    .line 1063
    iget-object v6, p0, Lcom/vkontakte/android/LinkRedirActivity$8;->this$0:Lcom/vkontakte/android/LinkRedirActivity;

    const/4 v7, -0x1

    invoke-virtual {v6, v7}, Lcom/vkontakte/android/LinkRedirActivity;->setResult(I)V

    .line 1064
    iget-object v6, p0, Lcom/vkontakte/android/LinkRedirActivity$8;->this$0:Lcom/vkontakte/android/LinkRedirActivity;

    invoke-virtual {v6}, Lcom/vkontakte/android/LinkRedirActivity;->finish()V

    .line 1066
    const/4 v6, 0x0

    invoke-virtual {v3, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/vkontakte/android/UserProfile;

    iput-object v6, v1, Lcom/vkontakte/android/Photo;->user:Lcom/vkontakte/android/UserProfile;

    .line 1068
    new-instance v6, Lcom/vkontakte/android/fragments/PostViewFragment$Builder;

    new-instance v7, Lcom/vkontakte/android/NewsEntry;

    invoke-direct {v7, v1}, Lcom/vkontakte/android/NewsEntry;-><init>(Lcom/vkontakte/android/Photo;)V

    invoke-direct {v6, v7}, Lcom/vkontakte/android/fragments/PostViewFragment$Builder;-><init>(Lcom/vkontakte/android/NewsEntry;)V

    iget-object v7, p0, Lcom/vkontakte/android/LinkRedirActivity$8;->this$0:Lcom/vkontakte/android/LinkRedirActivity;

    iget-object v8, p0, Lcom/vkontakte/android/LinkRedirActivity$8;->val$uri:Landroid/net/Uri;

    const-string/jumbo v9, "reply"

    .line 1069
    invoke-virtual {v8, v9}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Lcom/vkontakte/android/LinkRedirActivity;->access$300(Lcom/vkontakte/android/LinkRedirActivity;Ljava/lang/String;)I

    move-result v7

    invoke-virtual {v6, v7}, Lcom/vkontakte/android/fragments/PostViewFragment$Builder;->setComment(I)Lcom/vkontakte/android/fragments/PostViewFragment$Builder;

    move-result-object v6

    iget-object v7, p0, Lcom/vkontakte/android/LinkRedirActivity$8;->this$0:Lcom/vkontakte/android/LinkRedirActivity;

    .line 1070
    invoke-virtual {v6, v7}, Lcom/vkontakte/android/fragments/PostViewFragment$Builder;->go(Landroid/content/Context;)Z

    .line 1102
    .end local v0    # "jp":Lorg/json/JSONObject;
    .end local v1    # "photo":Lcom/vkontakte/android/Photo;
    .end local v2    # "userIds":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Integer;>;"
    .end local v3    # "users":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/UserProfile;>;"
    :goto_0
    return-void

    .line 1072
    .restart local v0    # "jp":Lorg/json/JSONObject;
    .restart local v1    # "photo":Lcom/vkontakte/android/Photo;
    .restart local v2    # "userIds":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Integer;>;"
    .restart local v3    # "users":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/UserProfile;>;"
    :cond_0
    iget-object v6, p0, Lcom/vkontakte/android/LinkRedirActivity$8;->this$0:Lcom/vkontakte/android/LinkRedirActivity;

    invoke-virtual {v6}, Lcom/vkontakte/android/LinkRedirActivity;->finish()V

    .line 1073
    iget-object v6, p0, Lcom/vkontakte/android/LinkRedirActivity$8;->this$0:Lcom/vkontakte/android/LinkRedirActivity;

    iget-object v7, p0, Lcom/vkontakte/android/LinkRedirActivity$8;->val$uri:Landroid/net/Uri;

    invoke-static {v6, v7}, Lcom/vkontakte/android/LinkRedirActivity;->access$000(Lcom/vkontakte/android/LinkRedirActivity;Landroid/net/Uri;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 1099
    .end local v0    # "jp":Lorg/json/JSONObject;
    .end local v1    # "photo":Lcom/vkontakte/android/Photo;
    .end local v2    # "userIds":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Integer;>;"
    .end local v3    # "users":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/UserProfile;>;"
    :catch_0
    move-exception v5

    .line 1100
    .local v5, "x":Ljava/lang/Exception;
    iget-object v6, p0, Lcom/vkontakte/android/LinkRedirActivity$8;->this$0:Lcom/vkontakte/android/LinkRedirActivity;

    invoke-static {v6}, Lcom/vkontakte/android/LinkRedirActivity;->access$400(Lcom/vkontakte/android/LinkRedirActivity;)V

    goto :goto_0

    .line 1076
    .end local v5    # "x":Ljava/lang/Exception;
    .restart local v0    # "jp":Lorg/json/JSONObject;
    .restart local v1    # "photo":Lcom/vkontakte/android/Photo;
    :cond_1
    :try_start_1
    new-instance v4, Lcom/vkontakte/android/PhotoViewer;

    iget-object v6, p0, Lcom/vkontakte/android/LinkRedirActivity$8;->this$0:Lcom/vkontakte/android/LinkRedirActivity;

    invoke-static {v1}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v7

    const/4 v8, 0x0

    new-instance v9, Lcom/vkontakte/android/LinkRedirActivity$8$1;

    invoke-direct {v9, p0}, Lcom/vkontakte/android/LinkRedirActivity$8$1;-><init>(Lcom/vkontakte/android/LinkRedirActivity$8;)V

    invoke-direct {v4, v6, v7, v8, v9}, Lcom/vkontakte/android/PhotoViewer;-><init>(Landroid/app/Activity;Ljava/util/List;ILcom/vkontakte/android/PhotoViewer$PhotoViewerCallback;)V

    .line 1096
    .local v4, "viewer":Lcom/vkontakte/android/PhotoViewer;
    iget-object v6, p0, Lcom/vkontakte/android/LinkRedirActivity$8;->this$0:Lcom/vkontakte/android/LinkRedirActivity;

    const v7, 0x7f0804a2

    invoke-virtual {v6, v7}, Lcom/vkontakte/android/LinkRedirActivity;->getString(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v6}, Lcom/vkontakte/android/PhotoViewer;->setTitle(Ljava/lang/String;)V

    .line 1097
    invoke-virtual {v4}, Lcom/vkontakte/android/PhotoViewer;->show()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0
.end method

.class Lcom/vkontakte/android/LinkRedirActivity$16;
.super Ljava/lang/Object;
.source "LinkRedirActivity.java"

# interfaces
.implements Lcom/vkontakte/android/api/Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/LinkRedirActivity;->resolveScreenName(Ljava/lang/String;Landroid/net/Uri;I)V
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

.field final synthetic val$ownerId:I

.field final synthetic val$uri:Landroid/net/Uri;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/LinkRedirActivity;Landroid/net/Uri;I)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/LinkRedirActivity;

    .prologue
    .line 1704
    iput-object p1, p0, Lcom/vkontakte/android/LinkRedirActivity$16;->this$0:Lcom/vkontakte/android/LinkRedirActivity;

    iput-object p2, p0, Lcom/vkontakte/android/LinkRedirActivity$16;->val$uri:Landroid/net/Uri;

    iput p3, p0, Lcom/vkontakte/android/LinkRedirActivity$16;->val$ownerId:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public fail(Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;)V
    .locals 2
    .param p1, "error"    # Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;

    .prologue
    .line 1752
    iget-object v0, p0, Lcom/vkontakte/android/LinkRedirActivity$16;->this$0:Lcom/vkontakte/android/LinkRedirActivity;

    iget-object v1, p0, Lcom/vkontakte/android/LinkRedirActivity$16;->val$uri:Landroid/net/Uri;

    invoke-static {v0, v1}, Lcom/vkontakte/android/LinkRedirActivity;->access$000(Lcom/vkontakte/android/LinkRedirActivity;Landroid/net/Uri;)V

    .line 1753
    iget-object v0, p0, Lcom/vkontakte/android/LinkRedirActivity$16;->this$0:Lcom/vkontakte/android/LinkRedirActivity;

    invoke-virtual {v0}, Lcom/vkontakte/android/LinkRedirActivity;->finish()V

    .line 1754
    return-void
.end method

.method public bridge synthetic success(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 1704
    check-cast p1, Lorg/json/JSONObject;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/LinkRedirActivity$16;->success(Lorg/json/JSONObject;)V

    return-void
.end method

.method public success(Lorg/json/JSONObject;)V
    .locals 23
    .param p1, "o"    # Lorg/json/JSONObject;

    .prologue
    .line 1707
    :try_start_0
    const-string/jumbo v1, "response"

    move-object/from16 v0, p1

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v20

    .line 1708
    .local v20, "r":Lorg/json/JSONObject;
    if-eqz v20, :cond_0

    const-string/jumbo v1, "type"

    move-object/from16 v0, v20

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_1

    .line 1709
    :cond_0
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/vkontakte/android/LinkRedirActivity$16;->this$0:Lcom/vkontakte/android/LinkRedirActivity;

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/vkontakte/android/LinkRedirActivity$16;->val$uri:Landroid/net/Uri;

    invoke-static {v1, v2}, Lcom/vkontakte/android/LinkRedirActivity;->access$000(Lcom/vkontakte/android/LinkRedirActivity;Landroid/net/Uri;)V

    .line 1710
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/vkontakte/android/LinkRedirActivity$16;->this$0:Lcom/vkontakte/android/LinkRedirActivity;

    invoke-virtual {v1}, Lcom/vkontakte/android/LinkRedirActivity;->finish()V

    .line 1749
    .end local v20    # "r":Lorg/json/JSONObject;
    :goto_0
    return-void

    .line 1713
    .restart local v20    # "r":Lorg/json/JSONObject;
    :cond_1
    const-string/jumbo v1, "type"

    move-object/from16 v0, v20

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v21

    .line 1714
    .local v21, "type":Ljava/lang/String;
    const-string/jumbo v1, "user"

    move-object/from16 v0, v21

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 1715
    new-instance v1, Lcom/vkontakte/android/fragments/ProfileFragment$Builder;

    const-string/jumbo v2, "object_id"

    move-object/from16 v0, v20

    invoke-virtual {v0, v2}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v2

    invoke-direct {v1, v2}, Lcom/vkontakte/android/fragments/ProfileFragment$Builder;-><init>(I)V

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/vkontakte/android/LinkRedirActivity$16;->this$0:Lcom/vkontakte/android/LinkRedirActivity;

    invoke-virtual {v1, v2}, Lcom/vkontakte/android/fragments/ProfileFragment$Builder;->go(Landroid/content/Context;)Z

    .line 1716
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/vkontakte/android/LinkRedirActivity$16;->this$0:Lcom/vkontakte/android/LinkRedirActivity;

    const/4 v2, -0x1

    invoke-virtual {v1, v2}, Lcom/vkontakte/android/LinkRedirActivity;->setResult(I)V

    .line 1717
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/vkontakte/android/LinkRedirActivity$16;->this$0:Lcom/vkontakte/android/LinkRedirActivity;

    invoke-virtual {v1}, Lcom/vkontakte/android/LinkRedirActivity;->finish()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 1746
    .end local v20    # "r":Lorg/json/JSONObject;
    .end local v21    # "type":Ljava/lang/String;
    :catch_0
    move-exception v22

    .line 1747
    .local v22, "x":Ljava/lang/Exception;
    const-string/jumbo v1, "vk"

    move-object/from16 v0, v22

    invoke-static {v1, v0}, Lcom/vkontakte/android/Log;->w(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0

    .line 1718
    .end local v22    # "x":Ljava/lang/Exception;
    .restart local v20    # "r":Lorg/json/JSONObject;
    .restart local v21    # "type":Ljava/lang/String;
    :cond_2
    :try_start_1
    const-string/jumbo v1, "group"

    move-object/from16 v0, v21

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 1719
    new-instance v1, Lcom/vkontakte/android/fragments/ProfileFragment$Builder;

    const-string/jumbo v2, "object_id"

    move-object/from16 v0, v20

    invoke-virtual {v0, v2}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v2

    neg-int v2, v2

    invoke-direct {v1, v2}, Lcom/vkontakte/android/fragments/ProfileFragment$Builder;-><init>(I)V

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/vkontakte/android/LinkRedirActivity$16;->this$0:Lcom/vkontakte/android/LinkRedirActivity;

    invoke-virtual {v1, v2}, Lcom/vkontakte/android/fragments/ProfileFragment$Builder;->go(Landroid/content/Context;)Z

    .line 1720
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/vkontakte/android/LinkRedirActivity$16;->this$0:Lcom/vkontakte/android/LinkRedirActivity;

    const/4 v2, -0x1

    invoke-virtual {v1, v2}, Lcom/vkontakte/android/LinkRedirActivity;->setResult(I)V

    .line 1721
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/vkontakte/android/LinkRedirActivity$16;->this$0:Lcom/vkontakte/android/LinkRedirActivity;

    invoke-virtual {v1}, Lcom/vkontakte/android/LinkRedirActivity;->finish()V

    goto :goto_0

    .line 1722
    :cond_3
    const-string/jumbo v1, "application"

    move-object/from16 v0, v21

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_7

    .line 1723
    const-string/jumbo v1, "object"

    move-object/from16 v0, v20

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_6

    .line 1724
    new-instance v18, Lcom/vkontakte/android/data/ApiApplication;

    const-string/jumbo v1, "object"

    move-object/from16 v0, v20

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v1

    move-object/from16 v0, v18

    invoke-direct {v0, v1}, Lcom/vkontakte/android/data/ApiApplication;-><init>(Lorg/json/JSONObject;)V

    .line 1725
    .local v18, "app":Lcom/vkontakte/android/data/ApiApplication;
    move-object/from16 v0, v18

    iget-boolean v1, v0, Lcom/vkontakte/android/data/ApiApplication;->isInCatalog:Z

    if-eqz v1, :cond_5

    move-object/from16 v0, v18

    iget-boolean v1, v0, Lcom/vkontakte/android/data/ApiApplication;->isHtml5App:Z

    if-nez v1, :cond_5

    .line 1726
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/vkontakte/android/LinkRedirActivity$16;->this$0:Lcom/vkontakte/android/LinkRedirActivity;

    const-string/jumbo v2, "direct"

    const-string/jumbo v3, "activity"

    move-object/from16 v0, v18

    invoke-static {v1, v2, v3, v0}, Lcom/vkontakte/android/GameCardActivity;->openApp(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Lcom/vkontakte/android/data/ApiApplication;)V

    .line 1741
    .end local v18    # "app":Lcom/vkontakte/android/data/ApiApplication;
    :cond_4
    :goto_1
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/vkontakte/android/LinkRedirActivity$16;->this$0:Lcom/vkontakte/android/LinkRedirActivity;

    invoke-virtual {v1}, Lcom/vkontakte/android/LinkRedirActivity;->finish()V

    goto/16 :goto_0

    .line 1729
    .restart local v18    # "app":Lcom/vkontakte/android/data/ApiApplication;
    :cond_5
    const-string/jumbo v1, "embedded_uri"

    move-object/from16 v0, v20

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_4

    const-string/jumbo v1, "embedded_uri"

    move-object/from16 v0, v20

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v1

    const-string/jumbo v2, "screen_title"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_4

    .line 1730
    const-string/jumbo v1, "embedded_uri"

    move-object/from16 v0, v20

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v19

    .line 1731
    .local v19, "embUri":Lorg/json/JSONObject;
    const-string/jumbo v1, "screen_title"

    move-object/from16 v0, v19

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 1732
    .local v6, "title":Ljava/lang/String;
    const-string/jumbo v1, "original_url"

    move-object/from16 v0, v19

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 1733
    .local v7, "origUrl":Ljava/lang/String;
    const-string/jumbo v1, "view_url"

    move-object/from16 v0, v19

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    .line 1734
    .local v8, "viewUrl":Ljava/lang/String;
    move-object/from16 v0, v18

    iget v9, v0, Lcom/vkontakte/android/data/ApiApplication;->screenOrientation:I

    .line 1735
    .local v9, "orientation":I
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/vkontakte/android/LinkRedirActivity$16;->this$0:Lcom/vkontakte/android/LinkRedirActivity;

    move-object/from16 v0, v18

    iget v2, v0, Lcom/vkontakte/android/data/ApiApplication;->id:I

    move-object/from16 v0, p0

    iget v3, v0, Lcom/vkontakte/android/LinkRedirActivity$16;->val$ownerId:I

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/LinkRedirActivity$16;->val$uri:Landroid/net/Uri;

    invoke-virtual {v4}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v4

    move-object/from16 v0, v18

    iget-boolean v5, v0, Lcom/vkontakte/android/data/ApiApplication;->isHtml5App:Z

    invoke-static/range {v1 .. v9}, Lcom/vkontakte/android/LinkRedirActivity;->access$500(Lcom/vkontakte/android/LinkRedirActivity;IILjava/lang/String;ZLjava/lang/String;Ljava/lang/String;Ljava/lang/String;I)V

    goto :goto_1

    .line 1739
    .end local v6    # "title":Ljava/lang/String;
    .end local v7    # "origUrl":Ljava/lang/String;
    .end local v8    # "viewUrl":Ljava/lang/String;
    .end local v9    # "orientation":I
    .end local v18    # "app":Lcom/vkontakte/android/data/ApiApplication;
    .end local v19    # "embUri":Lorg/json/JSONObject;
    :cond_6
    move-object/from16 v0, p0

    iget-object v10, v0, Lcom/vkontakte/android/LinkRedirActivity$16;->this$0:Lcom/vkontakte/android/LinkRedirActivity;

    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/vkontakte/android/LinkRedirActivity$16;->val$uri:Landroid/net/Uri;

    invoke-virtual {v1}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v11

    const/4 v12, 0x0

    const/4 v13, 0x0

    const/4 v14, 0x0

    const/4 v15, 0x0

    const/16 v16, 0x0

    const/16 v17, 0x0

    invoke-static/range {v10 .. v17}, Lcom/vkontakte/android/LinkRedirActivity;->openLink(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;IIZI)V

    goto/16 :goto_1

    .line 1743
    :cond_7
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/vkontakte/android/LinkRedirActivity$16;->this$0:Lcom/vkontakte/android/LinkRedirActivity;

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/vkontakte/android/LinkRedirActivity$16;->val$uri:Landroid/net/Uri;

    invoke-static {v1, v2}, Lcom/vkontakte/android/LinkRedirActivity;->access$000(Lcom/vkontakte/android/LinkRedirActivity;Landroid/net/Uri;)V

    .line 1744
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/vkontakte/android/LinkRedirActivity$16;->this$0:Lcom/vkontakte/android/LinkRedirActivity;

    invoke-virtual {v1}, Lcom/vkontakte/android/LinkRedirActivity;->finish()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto/16 :goto_0
.end method

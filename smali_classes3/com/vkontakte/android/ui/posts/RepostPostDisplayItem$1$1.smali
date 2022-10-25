.class Lcom/vkontakte/android/ui/posts/RepostPostDisplayItem$1$1;
.super Ljava/lang/Object;
.source "RepostPostDisplayItem.java"

# interfaces
.implements Lcom/vkontakte/android/api/Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/ui/posts/RepostPostDisplayItem$1;->onClick(Landroid/view/View;)V
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
.field final synthetic this$1:Lcom/vkontakte/android/ui/posts/RepostPostDisplayItem$1;

.field final synthetic val$v:Landroid/view/View;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/ui/posts/RepostPostDisplayItem$1;Landroid/view/View;)V
    .locals 0
    .param p1, "this$1"    # Lcom/vkontakte/android/ui/posts/RepostPostDisplayItem$1;

    .prologue
    .line 38
    iput-object p1, p0, Lcom/vkontakte/android/ui/posts/RepostPostDisplayItem$1$1;->this$1:Lcom/vkontakte/android/ui/posts/RepostPostDisplayItem$1;

    iput-object p2, p0, Lcom/vkontakte/android/ui/posts/RepostPostDisplayItem$1$1;->val$v:Landroid/view/View;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public fail(Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;)V
    .locals 5
    .param p1, "error"    # Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;

    .prologue
    .line 53
    iget-object v0, p0, Lcom/vkontakte/android/ui/posts/RepostPostDisplayItem$1$1;->this$1:Lcom/vkontakte/android/ui/posts/RepostPostDisplayItem$1;

    iget-object v1, p0, Lcom/vkontakte/android/ui/posts/RepostPostDisplayItem$1$1;->val$v:Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    const-string/jumbo v2, "photo"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v4, p0, Lcom/vkontakte/android/ui/posts/RepostPostDisplayItem$1$1;->this$1:Lcom/vkontakte/android/ui/posts/RepostPostDisplayItem$1;

    iget-object v4, v4, Lcom/vkontakte/android/ui/posts/RepostPostDisplayItem$1;->this$0:Lcom/vkontakte/android/ui/posts/RepostPostDisplayItem;

    iget v4, v4, Lcom/vkontakte/android/ui/posts/RepostPostDisplayItem;->uid:I

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, "_"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/vkontakte/android/ui/posts/RepostPostDisplayItem$1$1;->this$1:Lcom/vkontakte/android/ui/posts/RepostPostDisplayItem$1;

    iget-object v4, v4, Lcom/vkontakte/android/ui/posts/RepostPostDisplayItem$1;->this$0:Lcom/vkontakte/android/ui/posts/RepostPostDisplayItem;

    iget v4, v4, Lcom/vkontakte/android/ui/posts/RepostPostDisplayItem;->origID:I

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v0, v1, v2, v3}, Lcom/vkontakte/android/ui/posts/RepostPostDisplayItem$1;->access$100(Lcom/vkontakte/android/ui/posts/RepostPostDisplayItem$1;Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    .line 54
    return-void
.end method

.method public bridge synthetic success(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 38
    check-cast p1, Lorg/json/JSONObject;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/ui/posts/RepostPostDisplayItem$1$1;->success(Lorg/json/JSONObject;)V

    return-void
.end method

.method public success(Lorg/json/JSONObject;)V
    .locals 7
    .param p1, "result"    # Lorg/json/JSONObject;

    .prologue
    .line 42
    :try_start_0
    const-string/jumbo v2, "response"

    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v2

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v1

    .line 43
    .local v1, "jp":Lorg/json/JSONObject;
    new-instance v2, Lcom/vkontakte/android/fragments/PostViewFragment$Builder;

    new-instance v3, Lcom/vkontakte/android/Photo;

    invoke-direct {v3, v1}, Lcom/vkontakte/android/Photo;-><init>(Lorg/json/JSONObject;)V

    iget-object v4, p0, Lcom/vkontakte/android/ui/posts/RepostPostDisplayItem$1$1;->this$1:Lcom/vkontakte/android/ui/posts/RepostPostDisplayItem$1;

    iget-object v4, v4, Lcom/vkontakte/android/ui/posts/RepostPostDisplayItem$1;->this$0:Lcom/vkontakte/android/ui/posts/RepostPostDisplayItem;

    iget-object v4, v4, Lcom/vkontakte/android/ui/posts/RepostPostDisplayItem;->userName:Ljava/lang/String;

    iget-object v5, p0, Lcom/vkontakte/android/ui/posts/RepostPostDisplayItem$1$1;->this$1:Lcom/vkontakte/android/ui/posts/RepostPostDisplayItem$1;

    iget-object v5, v5, Lcom/vkontakte/android/ui/posts/RepostPostDisplayItem$1;->this$0:Lcom/vkontakte/android/ui/posts/RepostPostDisplayItem;

    iget-object v5, v5, Lcom/vkontakte/android/ui/posts/RepostPostDisplayItem;->userPhoto:Ljava/lang/String;

    invoke-static {v3, v4, v5}, Lcom/vkontakte/android/ui/posts/RepostPostDisplayItem;->access$000(Lcom/vkontakte/android/Photo;Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/NewsEntry;

    move-result-object v3

    invoke-direct {v2, v3}, Lcom/vkontakte/android/fragments/PostViewFragment$Builder;-><init>(Lcom/vkontakte/android/NewsEntry;)V

    .line 44
    invoke-virtual {v2}, Lcom/vkontakte/android/fragments/PostViewFragment$Builder;->scrollToFirstComment()Lcom/vkontakte/android/fragments/PostViewFragment$Builder;

    move-result-object v2

    invoke-virtual {v2}, Lcom/vkontakte/android/fragments/PostViewFragment$Builder;->loadFromBeginning()Lcom/vkontakte/android/fragments/PostViewFragment$Builder;

    move-result-object v2

    iget-object v3, p0, Lcom/vkontakte/android/ui/posts/RepostPostDisplayItem$1$1;->val$v:Landroid/view/View;

    invoke-virtual {v3}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/vkontakte/android/fragments/PostViewFragment$Builder;->go(Landroid/content/Context;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 49
    .end local v1    # "jp":Lorg/json/JSONObject;
    :goto_0
    return-void

    .line 45
    :catch_0
    move-exception v0

    .line 46
    .local v0, "e":Ljava/lang/Exception;
    const-string/jumbo v2, "vk"

    const-string/jumbo v3, "parse photo error"

    invoke-static {v2, v3, v0}, Lcom/vkontakte/android/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 47
    iget-object v2, p0, Lcom/vkontakte/android/ui/posts/RepostPostDisplayItem$1$1;->this$1:Lcom/vkontakte/android/ui/posts/RepostPostDisplayItem$1;

    iget-object v3, p0, Lcom/vkontakte/android/ui/posts/RepostPostDisplayItem$1$1;->val$v:Landroid/view/View;

    invoke-virtual {v3}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v3

    const-string/jumbo v4, "photo"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v6, p0, Lcom/vkontakte/android/ui/posts/RepostPostDisplayItem$1$1;->this$1:Lcom/vkontakte/android/ui/posts/RepostPostDisplayItem$1;

    iget-object v6, v6, Lcom/vkontakte/android/ui/posts/RepostPostDisplayItem$1;->this$0:Lcom/vkontakte/android/ui/posts/RepostPostDisplayItem;

    iget v6, v6, Lcom/vkontakte/android/ui/posts/RepostPostDisplayItem;->uid:I

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string/jumbo v6, "_"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget-object v6, p0, Lcom/vkontakte/android/ui/posts/RepostPostDisplayItem$1$1;->this$1:Lcom/vkontakte/android/ui/posts/RepostPostDisplayItem$1;

    iget-object v6, v6, Lcom/vkontakte/android/ui/posts/RepostPostDisplayItem$1;->this$0:Lcom/vkontakte/android/ui/posts/RepostPostDisplayItem;

    iget v6, v6, Lcom/vkontakte/android/ui/posts/RepostPostDisplayItem;->origID:I

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v2, v3, v4, v5}, Lcom/vkontakte/android/ui/posts/RepostPostDisplayItem$1;->access$100(Lcom/vkontakte/android/ui/posts/RepostPostDisplayItem$1;Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method

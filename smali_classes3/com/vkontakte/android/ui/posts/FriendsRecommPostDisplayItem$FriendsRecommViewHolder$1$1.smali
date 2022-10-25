.class Lcom/vkontakte/android/ui/posts/FriendsRecommPostDisplayItem$FriendsRecommViewHolder$1$1;
.super Lcom/vkontakte/android/api/SimpleCallback;
.source "FriendsRecommPostDisplayItem.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/ui/posts/FriendsRecommPostDisplayItem$FriendsRecommViewHolder$1;->onClick(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/api/SimpleCallback",
        "<",
        "Ljava/lang/Integer;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$2:Lcom/vkontakte/android/ui/posts/FriendsRecommPostDisplayItem$FriendsRecommViewHolder$1;

.field final synthetic val$needSubscribe:Z


# direct methods
.method constructor <init>(Lcom/vkontakte/android/ui/posts/FriendsRecommPostDisplayItem$FriendsRecommViewHolder$1;Landroid/content/Context;Z)V
    .locals 0
    .param p1, "this$2"    # Lcom/vkontakte/android/ui/posts/FriendsRecommPostDisplayItem$FriendsRecommViewHolder$1;
    .param p2, "context"    # Landroid/content/Context;

    .prologue
    .line 155
    iput-object p1, p0, Lcom/vkontakte/android/ui/posts/FriendsRecommPostDisplayItem$FriendsRecommViewHolder$1$1;->this$2:Lcom/vkontakte/android/ui/posts/FriendsRecommPostDisplayItem$FriendsRecommViewHolder$1;

    iput-boolean p3, p0, Lcom/vkontakte/android/ui/posts/FriendsRecommPostDisplayItem$FriendsRecommViewHolder$1$1;->val$needSubscribe:Z

    invoke-direct {p0, p2}, Lcom/vkontakte/android/api/SimpleCallback;-><init>(Landroid/content/Context;)V

    return-void
.end method


# virtual methods
.method public fail(Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;)V
    .locals 2
    .param p1, "err"    # Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;

    .prologue
    .line 165
    iget-object v0, p0, Lcom/vkontakte/android/ui/posts/FriendsRecommPostDisplayItem$FriendsRecommViewHolder$1$1;->this$2:Lcom/vkontakte/android/ui/posts/FriendsRecommPostDisplayItem$FriendsRecommViewHolder$1;

    iget-object v0, v0, Lcom/vkontakte/android/ui/posts/FriendsRecommPostDisplayItem$FriendsRecommViewHolder$1;->this$1:Lcom/vkontakte/android/ui/posts/FriendsRecommPostDisplayItem$FriendsRecommViewHolder;

    invoke-static {v0}, Lcom/vkontakte/android/ui/posts/FriendsRecommPostDisplayItem$FriendsRecommViewHolder;->access$1200(Lcom/vkontakte/android/ui/posts/FriendsRecommPostDisplayItem$FriendsRecommViewHolder;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/UserProfile;

    iget-boolean v1, p0, Lcom/vkontakte/android/ui/posts/FriendsRecommPostDisplayItem$FriendsRecommViewHolder$1$1;->val$needSubscribe:Z

    if-eqz v1, :cond_0

    const/4 v1, 0x0

    :goto_0
    iput v1, v0, Lcom/vkontakte/android/UserProfile;->online:I

    .line 166
    iget-object v0, p0, Lcom/vkontakte/android/ui/posts/FriendsRecommPostDisplayItem$FriendsRecommViewHolder$1$1;->this$2:Lcom/vkontakte/android/ui/posts/FriendsRecommPostDisplayItem$FriendsRecommViewHolder$1;

    iget-object v0, v0, Lcom/vkontakte/android/ui/posts/FriendsRecommPostDisplayItem$FriendsRecommViewHolder$1;->this$1:Lcom/vkontakte/android/ui/posts/FriendsRecommPostDisplayItem$FriendsRecommViewHolder;

    iget-object v1, p0, Lcom/vkontakte/android/ui/posts/FriendsRecommPostDisplayItem$FriendsRecommViewHolder$1$1;->this$2:Lcom/vkontakte/android/ui/posts/FriendsRecommPostDisplayItem$FriendsRecommViewHolder$1;

    iget-object v1, v1, Lcom/vkontakte/android/ui/posts/FriendsRecommPostDisplayItem$FriendsRecommViewHolder$1;->this$1:Lcom/vkontakte/android/ui/posts/FriendsRecommPostDisplayItem$FriendsRecommViewHolder;

    invoke-static {v1}, Lcom/vkontakte/android/ui/posts/FriendsRecommPostDisplayItem$FriendsRecommViewHolder;->access$1300(Lcom/vkontakte/android/ui/posts/FriendsRecommPostDisplayItem$FriendsRecommViewHolder;)Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/ui/posts/FriendsRecommPostDisplayItem$FriendsRecommViewHolder;->bind(Ljava/lang/Object;)V

    .line 167
    invoke-super {p0, p1}, Lcom/vkontakte/android/api/SimpleCallback;->fail(Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;)V

    .line 168
    return-void

    .line 165
    :cond_0
    const/4 v1, 0x1

    goto :goto_0
.end method

.method public success(Ljava/lang/Integer;)V
    .locals 2
    .param p1, "result"    # Ljava/lang/Integer;

    .prologue
    .line 158
    iget-object v0, p0, Lcom/vkontakte/android/ui/posts/FriendsRecommPostDisplayItem$FriendsRecommViewHolder$1$1;->this$2:Lcom/vkontakte/android/ui/posts/FriendsRecommPostDisplayItem$FriendsRecommViewHolder$1;

    iget-object v0, v0, Lcom/vkontakte/android/ui/posts/FriendsRecommPostDisplayItem$FriendsRecommViewHolder$1;->this$1:Lcom/vkontakte/android/ui/posts/FriendsRecommPostDisplayItem$FriendsRecommViewHolder;

    invoke-static {v0}, Lcom/vkontakte/android/ui/posts/FriendsRecommPostDisplayItem$FriendsRecommViewHolder;->access$900(Lcom/vkontakte/android/ui/posts/FriendsRecommPostDisplayItem$FriendsRecommViewHolder;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/UserProfile;

    iget-boolean v1, p0, Lcom/vkontakte/android/ui/posts/FriendsRecommPostDisplayItem$FriendsRecommViewHolder$1$1;->val$needSubscribe:Z

    if-eqz v1, :cond_0

    const/4 v1, 0x1

    :goto_0
    iput v1, v0, Lcom/vkontakte/android/UserProfile;->online:I

    .line 159
    iget-object v0, p0, Lcom/vkontakte/android/ui/posts/FriendsRecommPostDisplayItem$FriendsRecommViewHolder$1$1;->this$2:Lcom/vkontakte/android/ui/posts/FriendsRecommPostDisplayItem$FriendsRecommViewHolder$1;

    iget-object v0, v0, Lcom/vkontakte/android/ui/posts/FriendsRecommPostDisplayItem$FriendsRecommViewHolder$1;->this$1:Lcom/vkontakte/android/ui/posts/FriendsRecommPostDisplayItem$FriendsRecommViewHolder;

    iget-object v1, p0, Lcom/vkontakte/android/ui/posts/FriendsRecommPostDisplayItem$FriendsRecommViewHolder$1$1;->this$2:Lcom/vkontakte/android/ui/posts/FriendsRecommPostDisplayItem$FriendsRecommViewHolder$1;

    iget-object v1, v1, Lcom/vkontakte/android/ui/posts/FriendsRecommPostDisplayItem$FriendsRecommViewHolder$1;->this$1:Lcom/vkontakte/android/ui/posts/FriendsRecommPostDisplayItem$FriendsRecommViewHolder;

    invoke-static {v1}, Lcom/vkontakte/android/ui/posts/FriendsRecommPostDisplayItem$FriendsRecommViewHolder;->access$1000(Lcom/vkontakte/android/ui/posts/FriendsRecommPostDisplayItem$FriendsRecommViewHolder;)Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/ui/posts/FriendsRecommPostDisplayItem$FriendsRecommViewHolder;->bind(Ljava/lang/Object;)V

    .line 160
    iget-object v0, p0, Lcom/vkontakte/android/ui/posts/FriendsRecommPostDisplayItem$FriendsRecommViewHolder$1$1;->this$2:Lcom/vkontakte/android/ui/posts/FriendsRecommPostDisplayItem$FriendsRecommViewHolder$1;

    iget-object v0, v0, Lcom/vkontakte/android/ui/posts/FriendsRecommPostDisplayItem$FriendsRecommViewHolder$1;->this$1:Lcom/vkontakte/android/ui/posts/FriendsRecommPostDisplayItem$FriendsRecommViewHolder;

    iget-object v0, v0, Lcom/vkontakte/android/ui/posts/FriendsRecommPostDisplayItem$FriendsRecommViewHolder;->this$0:Lcom/vkontakte/android/ui/posts/FriendsRecommPostDisplayItem;

    invoke-static {v0}, Lcom/vkontakte/android/ui/posts/FriendsRecommPostDisplayItem;->access$1100(Lcom/vkontakte/android/ui/posts/FriendsRecommPostDisplayItem;)Lcom/vkontakte/android/NewsEntry;

    move-result-object v0

    invoke-static {v0}, Lcom/vkontakte/android/cache/NewsfeedCache;->replaceOne(Lcom/vkontakte/android/NewsEntry;)V

    .line 161
    return-void

    .line 158
    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public bridge synthetic success(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 155
    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/ui/posts/FriendsRecommPostDisplayItem$FriendsRecommViewHolder$1$1;->success(Ljava/lang/Integer;)V

    return-void
.end method

.class Lcom/vkontakte/android/fragments/PostViewFragment$17;
.super Lcom/vkontakte/android/api/ResultlessCallback;
.source "PostViewFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/fragments/PostViewFragment;->deletePost()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/fragments/PostViewFragment;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/PostViewFragment;Landroid/content/Context;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/fragments/PostViewFragment;
    .param p2, "context"    # Landroid/content/Context;

    .prologue
    .line 1163
    iput-object p1, p0, Lcom/vkontakte/android/fragments/PostViewFragment$17;->this$0:Lcom/vkontakte/android/fragments/PostViewFragment;

    invoke-direct {p0, p2}, Lcom/vkontakte/android/api/ResultlessCallback;-><init>(Landroid/content/Context;)V

    return-void
.end method


# virtual methods
.method public success()V
    .locals 4

    .prologue
    .line 1165
    new-instance v0, Landroid/content/Intent;

    const-string/jumbo v2, "com.vkontakte.android.POST_DELETED"

    invoke-direct {v0, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 1166
    .local v0, "intent":Landroid/content/Intent;
    const-string/jumbo v2, "owner_id"

    iget-object v3, p0, Lcom/vkontakte/android/fragments/PostViewFragment$17;->this$0:Lcom/vkontakte/android/fragments/PostViewFragment;

    invoke-static {v3}, Lcom/vkontakte/android/fragments/PostViewFragment;->access$000(Lcom/vkontakte/android/fragments/PostViewFragment;)Lcom/vkontakte/android/NewsEntry;

    move-result-object v3

    iget v3, v3, Lcom/vkontakte/android/NewsEntry;->ownerID:I

    invoke-virtual {v0, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 1167
    const-string/jumbo v2, "post_id"

    iget-object v3, p0, Lcom/vkontakte/android/fragments/PostViewFragment$17;->this$0:Lcom/vkontakte/android/fragments/PostViewFragment;

    invoke-static {v3}, Lcom/vkontakte/android/fragments/PostViewFragment;->access$000(Lcom/vkontakte/android/fragments/PostViewFragment;)Lcom/vkontakte/android/NewsEntry;

    move-result-object v3

    iget v3, v3, Lcom/vkontakte/android/NewsEntry;->postID:I

    invoke-virtual {v0, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 1168
    const-string/jumbo v2, "type"

    iget-object v3, p0, Lcom/vkontakte/android/fragments/PostViewFragment$17;->this$0:Lcom/vkontakte/android/fragments/PostViewFragment;

    invoke-static {v3}, Lcom/vkontakte/android/fragments/PostViewFragment;->access$000(Lcom/vkontakte/android/fragments/PostViewFragment;)Lcom/vkontakte/android/NewsEntry;

    move-result-object v3

    iget v3, v3, Lcom/vkontakte/android/NewsEntry;->type:I

    invoke-virtual {v0, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 1169
    const-string/jumbo v2, "post"

    iget-object v3, p0, Lcom/vkontakte/android/fragments/PostViewFragment$17;->this$0:Lcom/vkontakte/android/fragments/PostViewFragment;

    invoke-static {v3}, Lcom/vkontakte/android/fragments/PostViewFragment;->access$000(Lcom/vkontakte/android/fragments/PostViewFragment;)Lcom/vkontakte/android/NewsEntry;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 1170
    iget-object v2, p0, Lcom/vkontakte/android/fragments/PostViewFragment$17;->this$0:Lcom/vkontakte/android/fragments/PostViewFragment;

    invoke-virtual {v2}, Lcom/vkontakte/android/fragments/PostViewFragment;->getActivity()Landroid/app/Activity;

    move-result-object v2

    const-string/jumbo v3, "com.vkontakte.android.permission.ACCESS_DATA"

    invoke-virtual {v2, v0, v3}, Landroid/app/Activity;->sendBroadcast(Landroid/content/Intent;Ljava/lang/String;)V

    .line 1171
    iget-object v2, p0, Lcom/vkontakte/android/fragments/PostViewFragment$17;->this$0:Lcom/vkontakte/android/fragments/PostViewFragment;

    invoke-static {v2}, Lcom/vkontakte/android/fragments/PostViewFragment;->access$000(Lcom/vkontakte/android/fragments/PostViewFragment;)Lcom/vkontakte/android/NewsEntry;

    move-result-object v2

    iget v2, v2, Lcom/vkontakte/android/NewsEntry;->ownerID:I

    iget-object v3, p0, Lcom/vkontakte/android/fragments/PostViewFragment$17;->this$0:Lcom/vkontakte/android/fragments/PostViewFragment;

    invoke-static {v3}, Lcom/vkontakte/android/fragments/PostViewFragment;->access$000(Lcom/vkontakte/android/fragments/PostViewFragment;)Lcom/vkontakte/android/NewsEntry;

    move-result-object v3

    iget v3, v3, Lcom/vkontakte/android/NewsEntry;->postID:I

    invoke-static {v2, v3}, Lcom/vkontakte/android/cache/NewsfeedCache;->remove(II)V

    .line 1172
    iget-object v2, p0, Lcom/vkontakte/android/fragments/PostViewFragment$17;->this$0:Lcom/vkontakte/android/fragments/PostViewFragment;

    invoke-virtual {v2}, Lcom/vkontakte/android/fragments/PostViewFragment;->getActivity()Landroid/app/Activity;

    move-result-object v2

    instance-of v2, v2, Lcom/vkontakte/android/FragmentWrapperActivity;

    if-eqz v2, :cond_0

    .line 1173
    new-instance v1, Landroid/content/Intent;

    invoke-direct {v1}, Landroid/content/Intent;-><init>()V

    .line 1174
    .local v1, "intent1":Landroid/content/Intent;
    const-string/jumbo v2, "oid"

    iget-object v3, p0, Lcom/vkontakte/android/fragments/PostViewFragment$17;->this$0:Lcom/vkontakte/android/fragments/PostViewFragment;

    invoke-static {v3}, Lcom/vkontakte/android/fragments/PostViewFragment;->access$000(Lcom/vkontakte/android/fragments/PostViewFragment;)Lcom/vkontakte/android/NewsEntry;

    move-result-object v3

    iget v3, v3, Lcom/vkontakte/android/NewsEntry;->ownerID:I

    invoke-virtual {v1, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 1175
    const-string/jumbo v2, "pid"

    iget-object v3, p0, Lcom/vkontakte/android/fragments/PostViewFragment$17;->this$0:Lcom/vkontakte/android/fragments/PostViewFragment;

    invoke-static {v3}, Lcom/vkontakte/android/fragments/PostViewFragment;->access$000(Lcom/vkontakte/android/fragments/PostViewFragment;)Lcom/vkontakte/android/NewsEntry;

    move-result-object v3

    iget v3, v3, Lcom/vkontakte/android/NewsEntry;->postID:I

    invoke-virtual {v1, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 1176
    iget-object v2, p0, Lcom/vkontakte/android/fragments/PostViewFragment$17;->this$0:Lcom/vkontakte/android/fragments/PostViewFragment;

    invoke-virtual {v2}, Lcom/vkontakte/android/fragments/PostViewFragment;->getActivity()Landroid/app/Activity;

    move-result-object v2

    const/4 v3, 0x2

    invoke-virtual {v2, v3, v1}, Landroid/app/Activity;->setResult(ILandroid/content/Intent;)V

    .line 1177
    iget-object v2, p0, Lcom/vkontakte/android/fragments/PostViewFragment$17;->this$0:Lcom/vkontakte/android/fragments/PostViewFragment;

    invoke-virtual {v2}, Lcom/vkontakte/android/fragments/PostViewFragment;->getActivity()Landroid/app/Activity;

    move-result-object v2

    invoke-virtual {v2}, Landroid/app/Activity;->finish()V

    .line 1179
    .end local v1    # "intent1":Landroid/content/Intent;
    :cond_0
    return-void
.end method

.class Lcom/vkontakte/android/fragments/PostViewFragment$19;
.super Lcom/vkontakte/android/api/ResultlessCallback;
.source "PostViewFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/fragments/PostViewFragment;->saveRepostComment(Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/fragments/PostViewFragment;

.field final synthetic val$newComment:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/PostViewFragment;Landroid/content/Context;Ljava/lang/String;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/fragments/PostViewFragment;
    .param p2, "context"    # Landroid/content/Context;

    .prologue
    .line 1203
    iput-object p1, p0, Lcom/vkontakte/android/fragments/PostViewFragment$19;->this$0:Lcom/vkontakte/android/fragments/PostViewFragment;

    iput-object p3, p0, Lcom/vkontakte/android/fragments/PostViewFragment$19;->val$newComment:Ljava/lang/String;

    invoke-direct {p0, p2}, Lcom/vkontakte/android/api/ResultlessCallback;-><init>(Landroid/content/Context;)V

    return-void
.end method


# virtual methods
.method public fail(Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;)V
    .locals 2
    .param p1, "error"    # Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;

    .prologue
    .line 1222
    invoke-super {p0, p1}, Lcom/vkontakte/android/api/ResultlessCallback;->fail(Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;)V

    .line 1223
    iget-object v0, p0, Lcom/vkontakte/android/fragments/PostViewFragment$19;->this$0:Lcom/vkontakte/android/fragments/PostViewFragment;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/PostViewFragment$19;->val$newComment:Ljava/lang/String;

    invoke-static {v0, v1}, Lcom/vkontakte/android/fragments/PostViewFragment;->access$2500(Lcom/vkontakte/android/fragments/PostViewFragment;Ljava/lang/String;)V

    .line 1224
    return-void
.end method

.method public success()V
    .locals 5

    .prologue
    const/4 v3, 0x0

    .line 1206
    iget-object v1, p0, Lcom/vkontakte/android/fragments/PostViewFragment$19;->this$0:Lcom/vkontakte/android/fragments/PostViewFragment;

    invoke-virtual {v1}, Lcom/vkontakte/android/fragments/PostViewFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    const v2, 0x7f08050b

    invoke-static {v1, v2, v3}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/Toast;->show()V

    .line 1207
    iget-object v1, p0, Lcom/vkontakte/android/fragments/PostViewFragment$19;->this$0:Lcom/vkontakte/android/fragments/PostViewFragment;

    invoke-static {v1}, Lcom/vkontakte/android/fragments/PostViewFragment;->access$000(Lcom/vkontakte/android/fragments/PostViewFragment;)Lcom/vkontakte/android/NewsEntry;

    move-result-object v1

    iget-object v2, p0, Lcom/vkontakte/android/fragments/PostViewFragment$19;->val$newComment:Ljava/lang/String;

    iput-object v2, v1, Lcom/vkontakte/android/NewsEntry;->retweetText:Ljava/lang/String;

    .line 1208
    iget-object v1, p0, Lcom/vkontakte/android/fragments/PostViewFragment$19;->this$0:Lcom/vkontakte/android/fragments/PostViewFragment;

    invoke-static {v1}, Lcom/vkontakte/android/fragments/PostViewFragment;->access$000(Lcom/vkontakte/android/fragments/PostViewFragment;)Lcom/vkontakte/android/NewsEntry;

    move-result-object v1

    iget v1, v1, Lcom/vkontakte/android/NewsEntry;->ownerID:I

    iget-object v2, p0, Lcom/vkontakte/android/fragments/PostViewFragment$19;->this$0:Lcom/vkontakte/android/fragments/PostViewFragment;

    invoke-static {v2}, Lcom/vkontakte/android/fragments/PostViewFragment;->access$000(Lcom/vkontakte/android/fragments/PostViewFragment;)Lcom/vkontakte/android/NewsEntry;

    move-result-object v2

    iget v2, v2, Lcom/vkontakte/android/NewsEntry;->userID:I

    if-ne v1, v2, :cond_0

    .line 1209
    iget-object v1, p0, Lcom/vkontakte/android/fragments/PostViewFragment$19;->this$0:Lcom/vkontakte/android/fragments/PostViewFragment;

    invoke-static {v1}, Lcom/vkontakte/android/fragments/PostViewFragment;->access$000(Lcom/vkontakte/android/fragments/PostViewFragment;)Lcom/vkontakte/android/NewsEntry;

    move-result-object v1

    invoke-static {v1, v3}, Lcom/vkontakte/android/cache/NewsfeedCache;->replaceOne(Lcom/vkontakte/android/NewsEntry;Z)V

    .line 1211
    :cond_0
    new-instance v0, Landroid/content/Intent;

    const-string/jumbo v1, "com.vkontakte.android.POST_REPLACED"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 1212
    .local v0, "intent":Landroid/content/Intent;
    const-string/jumbo v1, "entry"

    iget-object v2, p0, Lcom/vkontakte/android/fragments/PostViewFragment$19;->this$0:Lcom/vkontakte/android/fragments/PostViewFragment;

    invoke-static {v2}, Lcom/vkontakte/android/fragments/PostViewFragment;->access$000(Lcom/vkontakte/android/fragments/PostViewFragment;)Lcom/vkontakte/android/NewsEntry;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 1213
    iget-object v1, p0, Lcom/vkontakte/android/fragments/PostViewFragment$19;->this$0:Lcom/vkontakte/android/fragments/PostViewFragment;

    invoke-virtual {v1}, Lcom/vkontakte/android/fragments/PostViewFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    const-string/jumbo v2, "com.vkontakte.android.permission.ACCESS_DATA"

    invoke-virtual {v1, v0, v2}, Landroid/app/Activity;->sendBroadcast(Landroid/content/Intent;Ljava/lang/String;)V

    .line 1216
    iget-object v1, p0, Lcom/vkontakte/android/fragments/PostViewFragment$19;->this$0:Lcom/vkontakte/android/fragments/PostViewFragment;

    invoke-static {v1}, Lcom/vkontakte/android/fragments/PostViewFragment;->access$2400(Lcom/vkontakte/android/fragments/PostViewFragment;)Landroid/view/ViewGroup;

    move-result-object v1

    const v2, 0x7f10008d

    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/vkontakte/android/ExTextView;

    iget-object v2, p0, Lcom/vkontakte/android/fragments/PostViewFragment$19;->this$0:Lcom/vkontakte/android/fragments/PostViewFragment;

    .line 1217
    invoke-static {v2}, Lcom/vkontakte/android/fragments/PostViewFragment;->access$000(Lcom/vkontakte/android/fragments/PostViewFragment;)Lcom/vkontakte/android/NewsEntry;

    move-result-object v2

    iget-object v2, v2, Lcom/vkontakte/android/NewsEntry;->retweetText:Ljava/lang/String;

    const/4 v3, 0x7

    iget-object v4, p0, Lcom/vkontakte/android/fragments/PostViewFragment$19;->this$0:Lcom/vkontakte/android/fragments/PostViewFragment;

    invoke-static {v4}, Lcom/vkontakte/android/fragments/PostViewFragment;->access$2300(Lcom/vkontakte/android/fragments/PostViewFragment;)Lcom/vkontakte/android/data/PostInteract;

    move-result-object v4

    invoke-static {v2, v3, v4}, Lcom/vkontakte/android/LinkParser;->parseLinks(Ljava/lang/CharSequence;ILcom/vkontakte/android/data/PostInteract;)Ljava/lang/CharSequence;

    move-result-object v2

    invoke-static {v2}, Lcom/vkontakte/android/Global;->replaceEmoji(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/vkontakte/android/ExTextView;->setText(Ljava/lang/CharSequence;)V

    .line 1218
    return-void
.end method

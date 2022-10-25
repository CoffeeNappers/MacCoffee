.class Lcom/vkontakte/android/fragments/PostViewFragment$20;
.super Ljava/lang/Object;
.source "PostViewFragment.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/fragments/PostViewFragment;->showCommentActions(Lcom/vkontakte/android/NewsComment;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/fragments/PostViewFragment;

.field final synthetic val$acts:Ljava/util/ArrayList;

.field final synthetic val$comm:Lcom/vkontakte/android/NewsComment;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/PostViewFragment;Ljava/util/ArrayList;Lcom/vkontakte/android/NewsComment;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/fragments/PostViewFragment;

    .prologue
    .line 1278
    iput-object p1, p0, Lcom/vkontakte/android/fragments/PostViewFragment$20;->this$0:Lcom/vkontakte/android/fragments/PostViewFragment;

    iput-object p2, p0, Lcom/vkontakte/android/fragments/PostViewFragment$20;->val$acts:Ljava/util/ArrayList;

    iput-object p3, p0, Lcom/vkontakte/android/fragments/PostViewFragment$20;->val$comm:Lcom/vkontakte/android/NewsComment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 8
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "which"    # I

    .prologue
    const/4 v7, 0x0

    .line 1281
    iget-object v4, p0, Lcom/vkontakte/android/fragments/PostViewFragment$20;->val$acts:Ljava/util/ArrayList;

    invoke-virtual {v4, p2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 1282
    .local v0, "act":Ljava/lang/String;
    const-string/jumbo v4, "profile"

    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 1283
    new-instance v4, Lcom/vkontakte/android/fragments/ProfileFragment$Builder;

    iget-object v5, p0, Lcom/vkontakte/android/fragments/PostViewFragment$20;->val$comm:Lcom/vkontakte/android/NewsComment;

    iget v5, v5, Lcom/vkontakte/android/NewsComment;->uid:I

    invoke-direct {v4, v5}, Lcom/vkontakte/android/fragments/ProfileFragment$Builder;-><init>(I)V

    iget-object v5, p0, Lcom/vkontakte/android/fragments/PostViewFragment$20;->this$0:Lcom/vkontakte/android/fragments/PostViewFragment;

    invoke-virtual {v5}, Lcom/vkontakte/android/fragments/PostViewFragment;->getActivity()Landroid/app/Activity;

    move-result-object v5

    invoke-virtual {v4, v5}, Lcom/vkontakte/android/fragments/ProfileFragment$Builder;->go(Landroid/content/Context;)Z

    .line 1314
    :cond_0
    :goto_0
    return-void

    .line 1284
    :cond_1
    const-string/jumbo v4, "reply"

    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_2

    const-string/jumbo v4, "reply_group"

    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_3

    .line 1285
    :cond_2
    iget-object v4, p0, Lcom/vkontakte/android/fragments/PostViewFragment$20;->this$0:Lcom/vkontakte/android/fragments/PostViewFragment;

    iget-object v5, p0, Lcom/vkontakte/android/fragments/PostViewFragment$20;->val$comm:Lcom/vkontakte/android/NewsComment;

    const-string/jumbo v6, "reply_group"

    invoke-virtual {v6, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    invoke-static {v4, v5, v6}, Lcom/vkontakte/android/fragments/PostViewFragment;->access$2600(Lcom/vkontakte/android/fragments/PostViewFragment;Lcom/vkontakte/android/NewsComment;Z)V

    goto :goto_0

    .line 1286
    :cond_3
    const-string/jumbo v4, "copy"

    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_4

    .line 1287
    iget-object v4, p0, Lcom/vkontakte/android/fragments/PostViewFragment$20;->this$0:Lcom/vkontakte/android/fragments/PostViewFragment;

    .line 1288
    invoke-virtual {v4}, Lcom/vkontakte/android/fragments/PostViewFragment;->getActivity()Landroid/app/Activity;

    move-result-object v4

    const-string/jumbo v5, "clipboard"

    invoke-virtual {v4, v5}, Landroid/app/Activity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/text/ClipboardManager;

    .line 1289
    .local v2, "clipboard":Landroid/text/ClipboardManager;
    iget-object v4, p0, Lcom/vkontakte/android/fragments/PostViewFragment$20;->val$comm:Lcom/vkontakte/android/NewsComment;

    iget-object v4, v4, Lcom/vkontakte/android/NewsComment;->text:Ljava/lang/String;

    invoke-static {v4}, Lcom/vkontakte/android/Global;->replaceHTML(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    const-string/jumbo v5, "<br/>"

    const-string/jumbo v6, "\n"

    invoke-virtual {v4, v5, v6}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Landroid/text/ClipboardManager;->setText(Ljava/lang/CharSequence;)V

    .line 1290
    iget-object v4, p0, Lcom/vkontakte/android/fragments/PostViewFragment$20;->this$0:Lcom/vkontakte/android/fragments/PostViewFragment;

    invoke-virtual {v4}, Lcom/vkontakte/android/fragments/PostViewFragment;->getActivity()Landroid/app/Activity;

    move-result-object v4

    const v5, 0x7f080703

    invoke-static {v4, v5, v7}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v4

    invoke-virtual {v4}, Landroid/widget/Toast;->show()V

    goto :goto_0

    .line 1291
    .end local v2    # "clipboard":Landroid/text/ClipboardManager;
    :cond_4
    const-string/jumbo v4, "copy_link"

    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_5

    .line 1292
    iget-object v4, p0, Lcom/vkontakte/android/fragments/PostViewFragment$20;->this$0:Lcom/vkontakte/android/fragments/PostViewFragment;

    invoke-virtual {v4}, Lcom/vkontakte/android/fragments/PostViewFragment;->getActivity()Landroid/app/Activity;

    move-result-object v4

    const-string/jumbo v5, "clipboard"

    invoke-virtual {v4, v5}, Landroid/app/Activity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/text/ClipboardManager;

    .line 1293
    .local v3, "cm":Landroid/text/ClipboardManager;
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v5, p0, Lcom/vkontakte/android/fragments/PostViewFragment$20;->this$0:Lcom/vkontakte/android/fragments/PostViewFragment;

    invoke-virtual {v5}, Lcom/vkontakte/android/fragments/PostViewFragment;->getLink()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string/jumbo v5, "?reply="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lcom/vkontakte/android/fragments/PostViewFragment$20;->val$comm:Lcom/vkontakte/android/NewsComment;

    invoke-virtual {v5}, Lcom/vkontakte/android/NewsComment;->getId()I

    move-result v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/text/ClipboardManager;->setText(Ljava/lang/CharSequence;)V

    .line 1294
    iget-object v4, p0, Lcom/vkontakte/android/fragments/PostViewFragment$20;->this$0:Lcom/vkontakte/android/fragments/PostViewFragment;

    invoke-virtual {v4}, Lcom/vkontakte/android/fragments/PostViewFragment;->getActivity()Landroid/app/Activity;

    move-result-object v4

    const v5, 0x7f080339

    invoke-static {v4, v5, v7}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v4

    invoke-virtual {v4}, Landroid/widget/Toast;->show()V

    goto/16 :goto_0

    .line 1295
    .end local v3    # "cm":Landroid/text/ClipboardManager;
    :cond_5
    const-string/jumbo v4, "like"

    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_6

    .line 1296
    iget-object v4, p0, Lcom/vkontakte/android/fragments/PostViewFragment$20;->this$0:Lcom/vkontakte/android/fragments/PostViewFragment;

    iget-object v5, p0, Lcom/vkontakte/android/fragments/PostViewFragment$20;->val$comm:Lcom/vkontakte/android/NewsComment;

    invoke-virtual {v4, v5}, Lcom/vkontakte/android/fragments/PostViewFragment;->likeComment(Lcom/vkontakte/android/NewsComment;)V

    goto/16 :goto_0

    .line 1297
    :cond_6
    const-string/jumbo v4, "liked"

    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_7

    .line 1298
    new-instance v1, Landroid/os/Bundle;

    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    .line 1299
    .local v1, "args":Landroid/os/Bundle;
    const-string/jumbo v4, "title"

    iget-object v5, p0, Lcom/vkontakte/android/fragments/PostViewFragment$20;->this$0:Lcom/vkontakte/android/fragments/PostViewFragment;

    const v6, 0x7f080337

    invoke-virtual {v5, v6}, Lcom/vkontakte/android/fragments/PostViewFragment;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v1, v4, v5}, Landroid/os/Bundle;->putCharSequence(Ljava/lang/String;Ljava/lang/CharSequence;)V

    .line 1300
    const-string/jumbo v4, "ltype"

    const/4 v5, 0x5

    invoke-virtual {v1, v4, v5}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 1301
    const-string/jumbo v4, "lptype"

    iget-object v5, p0, Lcom/vkontakte/android/fragments/PostViewFragment$20;->this$0:Lcom/vkontakte/android/fragments/PostViewFragment;

    invoke-static {v5}, Lcom/vkontakte/android/fragments/PostViewFragment;->access$000(Lcom/vkontakte/android/fragments/PostViewFragment;)Lcom/vkontakte/android/NewsEntry;

    move-result-object v5

    iget v5, v5, Lcom/vkontakte/android/NewsEntry;->type:I

    invoke-virtual {v1, v4, v5}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 1302
    const-string/jumbo v4, "oid"

    iget-object v5, p0, Lcom/vkontakte/android/fragments/PostViewFragment$20;->this$0:Lcom/vkontakte/android/fragments/PostViewFragment;

    invoke-static {v5}, Lcom/vkontakte/android/fragments/PostViewFragment;->access$000(Lcom/vkontakte/android/fragments/PostViewFragment;)Lcom/vkontakte/android/NewsEntry;

    move-result-object v5

    iget v5, v5, Lcom/vkontakte/android/NewsEntry;->ownerID:I

    invoke-virtual {v1, v4, v5}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 1303
    const-string/jumbo v4, "item_id"

    iget-object v5, p0, Lcom/vkontakte/android/fragments/PostViewFragment$20;->val$comm:Lcom/vkontakte/android/NewsComment;

    iget v5, v5, Lcom/vkontakte/android/NewsComment;->cid:I

    invoke-virtual {v1, v4, v5}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 1304
    const-class v4, Lcom/vkontakte/android/fragments/LikesListFragment;

    iget-object v5, p0, Lcom/vkontakte/android/fragments/PostViewFragment$20;->this$0:Lcom/vkontakte/android/fragments/PostViewFragment;

    invoke-virtual {v5}, Lcom/vkontakte/android/fragments/PostViewFragment;->getActivity()Landroid/app/Activity;

    move-result-object v5

    invoke-static {v4, v1, v5}, Lcom/vkontakte/android/navigation/Navigate;->to(Ljava/lang/Class;Landroid/os/Bundle;Landroid/content/Context;)V

    goto/16 :goto_0

    .line 1305
    .end local v1    # "args":Landroid/os/Bundle;
    :cond_7
    const-string/jumbo v4, "delete"

    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_8

    .line 1306
    iget-object v4, p0, Lcom/vkontakte/android/fragments/PostViewFragment$20;->this$0:Lcom/vkontakte/android/fragments/PostViewFragment;

    iget-object v5, p0, Lcom/vkontakte/android/fragments/PostViewFragment$20;->val$comm:Lcom/vkontakte/android/NewsComment;

    iget v5, v5, Lcom/vkontakte/android/NewsComment;->cid:I

    invoke-static {v4, v5}, Lcom/vkontakte/android/fragments/PostViewFragment;->access$2700(Lcom/vkontakte/android/fragments/PostViewFragment;I)V

    goto/16 :goto_0

    .line 1307
    :cond_8
    const-string/jumbo v4, "edit"

    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_9

    .line 1308
    iget-object v4, p0, Lcom/vkontakte/android/fragments/PostViewFragment$20;->this$0:Lcom/vkontakte/android/fragments/PostViewFragment;

    iget-object v5, p0, Lcom/vkontakte/android/fragments/PostViewFragment$20;->val$comm:Lcom/vkontakte/android/NewsComment;

    invoke-static {v4, v5}, Lcom/vkontakte/android/fragments/PostViewFragment;->access$2800(Lcom/vkontakte/android/fragments/PostViewFragment;Lcom/vkontakte/android/NewsComment;)V

    goto/16 :goto_0

    .line 1309
    :cond_9
    const-string/jumbo v4, "report"

    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_a

    .line 1310
    iget-object v4, p0, Lcom/vkontakte/android/fragments/PostViewFragment$20;->this$0:Lcom/vkontakte/android/fragments/PostViewFragment;

    iget-object v5, p0, Lcom/vkontakte/android/fragments/PostViewFragment$20;->val$comm:Lcom/vkontakte/android/NewsComment;

    invoke-virtual {v4, v5}, Lcom/vkontakte/android/fragments/PostViewFragment;->reportComment(Lcom/vkontakte/android/NewsComment;)V

    goto/16 :goto_0

    .line 1311
    :cond_a
    const-string/jumbo v4, "repost"

    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 1312
    iget-object v4, p0, Lcom/vkontakte/android/fragments/PostViewFragment$20;->this$0:Lcom/vkontakte/android/fragments/PostViewFragment;

    iget-object v5, p0, Lcom/vkontakte/android/fragments/PostViewFragment$20;->val$comm:Lcom/vkontakte/android/NewsComment;

    invoke-static {v4, v5}, Lcom/vkontakte/android/fragments/PostViewFragment;->access$2900(Lcom/vkontakte/android/fragments/PostViewFragment;Lcom/vkontakte/android/NewsComment;)V

    goto/16 :goto_0
.end method

.class Lcom/vkontakte/android/ui/WriteBar$3;
.super Ljava/lang/Object;
.source "WriteBar.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/ui/WriteBar;->init()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field private final lock:Lcom/vk/core/util/TimeoutLock;

.field final synthetic this$0:Lcom/vkontakte/android/ui/WriteBar;

.field final synthetic val$context:Landroid/content/Context;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/ui/WriteBar;Landroid/content/Context;)V
    .locals 4
    .param p1, "this$0"    # Lcom/vkontakte/android/ui/WriteBar;

    .prologue
    .line 362
    iput-object p1, p0, Lcom/vkontakte/android/ui/WriteBar$3;->this$0:Lcom/vkontakte/android/ui/WriteBar;

    iput-object p2, p0, Lcom/vkontakte/android/ui/WriteBar$3;->val$context:Landroid/content/Context;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 364
    new-instance v0, Lcom/vk/core/util/TimeoutLock;

    const-wide/16 v2, 0x1f4

    invoke-direct {v0, v2, v3}, Lcom/vk/core/util/TimeoutLock;-><init>(J)V

    iput-object v0, p0, Lcom/vkontakte/android/ui/WriteBar$3;->lock:Lcom/vk/core/util/TimeoutLock;

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 8
    .param p1, "v"    # Landroid/view/View;

    .prologue
    const/4 v3, 0x1

    const/4 v4, 0x0

    .line 368
    iget-object v2, p0, Lcom/vkontakte/android/ui/WriteBar$3;->lock:Lcom/vk/core/util/TimeoutLock;

    invoke-virtual {v2}, Lcom/vk/core/util/TimeoutLock;->isLocked()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 411
    :goto_0
    return-void

    .line 371
    :cond_0
    iget-object v2, p0, Lcom/vkontakte/android/ui/WriteBar$3;->lock:Lcom/vk/core/util/TimeoutLock;

    invoke-virtual {v2}, Lcom/vk/core/util/TimeoutLock;->lock()V

    .line 373
    iget-object v2, p0, Lcom/vkontakte/android/ui/WriteBar$3;->this$0:Lcom/vkontakte/android/ui/WriteBar;

    invoke-static {v2}, Lcom/vkontakte/android/ui/WriteBar;->access$1900(Lcom/vkontakte/android/ui/WriteBar;)Landroid/view/View;

    move-result-object v2

    invoke-virtual {v2, v4}, Landroid/view/View;->setEnabled(Z)V

    .line 374
    iget-object v2, p0, Lcom/vkontakte/android/ui/WriteBar$3;->this$0:Lcom/vkontakte/android/ui/WriteBar;

    invoke-static {v2}, Lcom/vkontakte/android/ui/WriteBar;->access$300(Lcom/vkontakte/android/ui/WriteBar;)Lcom/vkontakte/android/ui/AttachmentsEditorView;

    move-result-object v2

    invoke-virtual {v2}, Lcom/vkontakte/android/ui/AttachmentsEditorView;->getCount()I

    move-result v2

    iget-object v5, p0, Lcom/vkontakte/android/ui/WriteBar$3;->this$0:Lcom/vkontakte/android/ui/WriteBar;

    invoke-static {v5}, Lcom/vkontakte/android/ui/WriteBar;->access$2000(Lcom/vkontakte/android/ui/WriteBar;)I

    move-result v5

    if-lt v2, v5, :cond_1

    .line 375
    iget-object v2, p0, Lcom/vkontakte/android/ui/WriteBar$3;->val$context:Landroid/content/Context;

    iget-object v5, p0, Lcom/vkontakte/android/ui/WriteBar$3;->this$0:Lcom/vkontakte/android/ui/WriteBar;

    invoke-virtual {v5}, Lcom/vkontakte/android/ui/WriteBar;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    const v6, 0x7f0800e0

    new-array v3, v3, [Ljava/lang/Object;

    iget-object v7, p0, Lcom/vkontakte/android/ui/WriteBar$3;->this$0:Lcom/vkontakte/android/ui/WriteBar;

    invoke-static {v7}, Lcom/vkontakte/android/ui/WriteBar;->access$2000(Lcom/vkontakte/android/ui/WriteBar;)I

    move-result v7

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v3, v4

    invoke-virtual {v5, v6, v3}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3, v4}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v2

    invoke-virtual {v2}, Landroid/widget/Toast;->show()V

    goto :goto_0

    .line 379
    :cond_1
    new-instance v0, Landroid/content/Intent;

    iget-object v2, p0, Lcom/vkontakte/android/ui/WriteBar$3;->val$context:Landroid/content/Context;

    const-class v5, Lcom/vk/attachpicker/AttachActivity;

    invoke-direct {v0, v2, v5}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 380
    .local v0, "intent":Landroid/content/Intent;
    const-string/jumbo v2, "selection_limit"

    iget-object v5, p0, Lcom/vkontakte/android/ui/WriteBar$3;->this$0:Lcom/vkontakte/android/ui/WriteBar;

    invoke-static {v5}, Lcom/vkontakte/android/ui/WriteBar;->access$2000(Lcom/vkontakte/android/ui/WriteBar;)I

    move-result v5

    iget-object v6, p0, Lcom/vkontakte/android/ui/WriteBar$3;->this$0:Lcom/vkontakte/android/ui/WriteBar;

    invoke-static {v6}, Lcom/vkontakte/android/ui/WriteBar;->access$300(Lcom/vkontakte/android/ui/WriteBar;)Lcom/vkontakte/android/ui/AttachmentsEditorView;

    move-result-object v6

    invoke-virtual {v6}, Lcom/vkontakte/android/ui/AttachmentsEditorView;->getCount()I

    move-result v6

    sub-int/2addr v5, v6

    invoke-virtual {v0, v2, v5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 382
    const-string/jumbo v2, "enable_graffiti_att"

    iget-object v5, p0, Lcom/vkontakte/android/ui/WriteBar$3;->this$0:Lcom/vkontakte/android/ui/WriteBar;

    invoke-static {v5}, Lcom/vkontakte/android/ui/WriteBar;->access$2100(Lcom/vkontakte/android/ui/WriteBar;)Z

    move-result v5

    invoke-virtual {v0, v2, v5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 383
    const-string/jumbo v5, "enable_map_attachment"

    iget-object v2, p0, Lcom/vkontakte/android/ui/WriteBar$3;->this$0:Lcom/vkontakte/android/ui/WriteBar;

    invoke-static {v2}, Lcom/vkontakte/android/ui/WriteBar;->access$2200(Lcom/vkontakte/android/ui/WriteBar;)Z

    move-result v2

    if-eqz v2, :cond_6

    iget-object v2, p0, Lcom/vkontakte/android/ui/WriteBar$3;->this$0:Lcom/vkontakte/android/ui/WriteBar;

    invoke-static {v2}, Lcom/vkontakte/android/ui/WriteBar;->access$300(Lcom/vkontakte/android/ui/WriteBar;)Lcom/vkontakte/android/ui/AttachmentsEditorView;

    move-result-object v2

    invoke-virtual {v2}, Lcom/vkontakte/android/ui/AttachmentsEditorView;->containsGeoAttachment()Z

    move-result v2

    if-nez v2, :cond_6

    move v2, v3

    :goto_1
    invoke-virtual {v0, v5, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 384
    const-string/jumbo v2, "enable_gift_attachment"

    iget-object v5, p0, Lcom/vkontakte/android/ui/WriteBar$3;->this$0:Lcom/vkontakte/android/ui/WriteBar;

    invoke-static {v5}, Lcom/vkontakte/android/ui/WriteBar;->access$2300(Lcom/vkontakte/android/ui/WriteBar;)Z

    move-result v5

    if-eqz v5, :cond_7

    iget-object v5, p0, Lcom/vkontakte/android/ui/WriteBar$3;->this$0:Lcom/vkontakte/android/ui/WriteBar;

    iget-boolean v5, v5, Lcom/vkontakte/android/ui/WriteBar;->giftAllowed:Z

    if-eqz v5, :cond_7

    :goto_2
    invoke-virtual {v0, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 386
    const-string/jumbo v2, "enable_money_attachment"

    iget-object v3, p0, Lcom/vkontakte/android/ui/WriteBar$3;->this$0:Lcom/vkontakte/android/ui/WriteBar;

    iget-boolean v3, v3, Lcom/vkontakte/android/ui/WriteBar;->moneyTransferAllowed:Z

    invoke-virtual {v0, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 388
    const-string/jumbo v2, "money_peer_id"

    iget-object v3, p0, Lcom/vkontakte/android/ui/WriteBar$3;->this$0:Lcom/vkontakte/android/ui/WriteBar;

    iget v3, v3, Lcom/vkontakte/android/ui/WriteBar;->peerId:I

    invoke-virtual {v0, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 390
    iget-object v2, p0, Lcom/vkontakte/android/ui/WriteBar$3;->this$0:Lcom/vkontakte/android/ui/WriteBar;

    iget-object v2, v2, Lcom/vkontakte/android/ui/WriteBar;->giftUser:Lcom/vkontakte/android/UserProfile;

    if-eqz v2, :cond_2

    .line 391
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 392
    .local v1, "users":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/UserProfile;>;"
    iget-object v2, p0, Lcom/vkontakte/android/ui/WriteBar$3;->this$0:Lcom/vkontakte/android/ui/WriteBar;

    iget-object v2, v2, Lcom/vkontakte/android/ui/WriteBar;->giftUser:Lcom/vkontakte/android/UserProfile;

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 394
    const-string/jumbo v2, "gift_users"

    invoke-virtual {v0, v2, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    .line 397
    .end local v1    # "users":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/UserProfile;>;"
    :cond_2
    iget-object v2, p0, Lcom/vkontakte/android/ui/WriteBar$3;->this$0:Lcom/vkontakte/android/ui/WriteBar;

    iget-object v2, v2, Lcom/vkontakte/android/ui/WriteBar;->giftUsers:Landroid/util/SparseArray;

    if-eqz v2, :cond_3

    iget-object v2, p0, Lcom/vkontakte/android/ui/WriteBar$3;->this$0:Lcom/vkontakte/android/ui/WriteBar;

    iget-object v2, v2, Lcom/vkontakte/android/ui/WriteBar;->giftUsers:Landroid/util/SparseArray;

    invoke-virtual {v2}, Landroid/util/SparseArray;->size()I

    move-result v2

    if-lez v2, :cond_3

    .line 398
    const-string/jumbo v2, "gift_users"

    iget-object v3, p0, Lcom/vkontakte/android/ui/WriteBar$3;->this$0:Lcom/vkontakte/android/ui/WriteBar;

    iget-object v3, v3, Lcom/vkontakte/android/ui/WriteBar;->giftUsers:Landroid/util/SparseArray;

    invoke-static {v3}, Lcom/vkontakte/android/utils/Utils;->asList(Landroid/util/SparseArray;)Ljava/util/ArrayList;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    .line 401
    :cond_3
    iget-object v2, p0, Lcom/vkontakte/android/ui/WriteBar$3;->this$0:Lcom/vkontakte/android/ui/WriteBar;

    invoke-static {v2}, Lcom/vkontakte/android/ui/WriteBar;->access$2100(Lcom/vkontakte/android/ui/WriteBar;)Z

    move-result v2

    if-eqz v2, :cond_5

    .line 402
    iget-object v2, p0, Lcom/vkontakte/android/ui/WriteBar$3;->this$0:Lcom/vkontakte/android/ui/WriteBar;

    invoke-static {v2}, Lcom/vkontakte/android/ui/WriteBar;->access$2400(Lcom/vkontakte/android/ui/WriteBar;)Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_4

    .line 403
    const-string/jumbo v2, "graffiti_avatar"

    iget-object v3, p0, Lcom/vkontakte/android/ui/WriteBar$3;->this$0:Lcom/vkontakte/android/ui/WriteBar;

    invoke-static {v3}, Lcom/vkontakte/android/ui/WriteBar;->access$2400(Lcom/vkontakte/android/ui/WriteBar;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 405
    :cond_4
    iget-object v2, p0, Lcom/vkontakte/android/ui/WriteBar$3;->this$0:Lcom/vkontakte/android/ui/WriteBar;

    invoke-static {v2}, Lcom/vkontakte/android/ui/WriteBar;->access$2500(Lcom/vkontakte/android/ui/WriteBar;)Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_5

    .line 406
    const-string/jumbo v2, "graffiti_title"

    iget-object v3, p0, Lcom/vkontakte/android/ui/WriteBar$3;->this$0:Lcom/vkontakte/android/ui/WriteBar;

    invoke-static {v3}, Lcom/vkontakte/android/ui/WriteBar;->access$2500(Lcom/vkontakte/android/ui/WriteBar;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 410
    :cond_5
    iget-object v2, p0, Lcom/vkontakte/android/ui/WriteBar$3;->this$0:Lcom/vkontakte/android/ui/WriteBar;

    invoke-static {v2}, Lcom/vkontakte/android/ui/WriteBar;->access$2600(Lcom/vkontakte/android/ui/WriteBar;)Landroid/app/Fragment;

    move-result-object v2

    const/16 v3, 0x271a

    invoke-virtual {v2, v0, v3}, Landroid/app/Fragment;->startActivityForResult(Landroid/content/Intent;I)V

    goto/16 :goto_0

    :cond_6
    move v2, v4

    .line 383
    goto/16 :goto_1

    :cond_7
    move v3, v4

    .line 384
    goto/16 :goto_2
.end method

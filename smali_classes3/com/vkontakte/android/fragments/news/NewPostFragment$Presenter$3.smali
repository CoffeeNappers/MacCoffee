.class Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter$3;
.super Ljava/lang/Object;
.source "NewPostFragment.java"

# interfaces
.implements Lcom/vkontakte/android/api/Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->post()V
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
.field final synthetic this$1:Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;

.field final synthetic val$edit:Lcom/vkontakte/android/NewsEntry;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;Lcom/vkontakte/android/NewsEntry;)V
    .locals 0
    .param p1, "this$1"    # Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;

    .prologue
    .line 1379
    iput-object p1, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter$3;->this$1:Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;

    iput-object p2, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter$3;->val$edit:Lcom/vkontakte/android/NewsEntry;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public fail(Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;)V
    .locals 5
    .param p1, "error"    # Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;

    .prologue
    const/4 v4, 0x0

    .line 1475
    iget-object v1, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter$3;->this$1:Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;

    iget-object v1, v1, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->postponeTo:Ljava/util/Calendar;

    if-eqz v1, :cond_4

    invoke-virtual {p1}, Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;->getCodeValue()I

    move-result v1

    const/16 v2, 0xd6

    if-ne v1, v2, :cond_4

    .line 1476
    const/4 v0, 0x0

    .line 1477
    .local v0, "err":Ljava/lang/String;
    iget-object v1, p1, Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;->message:Ljava/lang/String;

    const-string/jumbo v2, "already scheduled for this time"

    invoke-virtual {v1, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 1478
    iget-object v1, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter$3;->this$1:Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;

    iget-object v1, v1, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->this$0:Lcom/vkontakte/android/fragments/news/NewPostFragment;

    const v2, 0x7f080520

    invoke-virtual {v1, v2}, Lcom/vkontakte/android/fragments/news/NewPostFragment;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 1480
    :cond_0
    iget-object v1, p1, Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;->message:Ljava/lang/String;

    const-string/jumbo v2, "posts on a day"

    invoke-virtual {v1, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 1481
    iget-object v1, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter$3;->this$1:Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;

    iget-object v1, v1, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->this$0:Lcom/vkontakte/android/fragments/news/NewPostFragment;

    const v2, 0x7f080521

    invoke-virtual {v1, v2}, Lcom/vkontakte/android/fragments/news/NewPostFragment;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 1483
    :cond_1
    iget-object v1, p1, Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;->message:Ljava/lang/String;

    const-string/jumbo v2, "schedule more than"

    invoke-virtual {v1, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 1484
    iget-object v1, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter$3;->this$1:Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;

    iget-object v1, v1, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->this$0:Lcom/vkontakte/android/fragments/news/NewPostFragment;

    const v2, 0x7f080522

    invoke-virtual {v1, v2}, Lcom/vkontakte/android/fragments/news/NewPostFragment;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 1486
    :cond_2
    if-eqz v0, :cond_3

    .line 1487
    iget-object v1, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter$3;->this$1:Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;

    iget-object v1, v1, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->this$0:Lcom/vkontakte/android/fragments/news/NewPostFragment;

    invoke-virtual {v1}, Lcom/vkontakte/android/fragments/news/NewPostFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-static {v1, v0, v4}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/Toast;->show()V

    .line 1496
    .end local v0    # "err":Ljava/lang/String;
    :cond_3
    :goto_0
    return-void

    .line 1491
    :cond_4
    iget-object v1, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter$3;->this$1:Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;

    iget-object v1, v1, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->postponeTo:Ljava/util/Calendar;

    if-eqz v1, :cond_5

    invoke-virtual {p1}, Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;->getCodeValue()I

    move-result v1

    const/16 v2, 0x64

    if-ne v1, v2, :cond_5

    iget-object v1, p1, Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;->message:Ljava/lang/String;

    const-string/jumbo v2, "publish_date"

    invoke-virtual {v1, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_5

    .line 1492
    iget-object v1, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter$3;->this$1:Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;

    iget-object v1, v1, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->this$0:Lcom/vkontakte/android/fragments/news/NewPostFragment;

    invoke-virtual {v1}, Lcom/vkontakte/android/fragments/news/NewPostFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    iget-object v2, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter$3;->this$1:Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;

    iget-object v2, v2, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->this$0:Lcom/vkontakte/android/fragments/news/NewPostFragment;

    invoke-virtual {v2}, Lcom/vkontakte/android/fragments/news/NewPostFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f08031b

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2, v4}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/Toast;->show()V

    goto :goto_0

    .line 1495
    :cond_5
    iget-object v1, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter$3;->this$1:Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;

    iget-object v1, v1, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->this$0:Lcom/vkontakte/android/fragments/news/NewPostFragment;

    invoke-virtual {v1}, Lcom/vkontakte/android/fragments/news/NewPostFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {p1}, Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;->getCode()I

    move-result v2

    iget-object v3, p1, Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;->message:Ljava/lang/String;

    invoke-static {v1, v2, v3}, Lcom/vkontakte/android/api/APIUtils;->showErrorToast(Landroid/content/Context;ILjava/lang/String;)V

    goto :goto_0
.end method

.method public bridge synthetic success(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 1379
    check-cast p1, Lorg/json/JSONObject;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter$3;->success(Lorg/json/JSONObject;)V

    return-void
.end method

.method public success(Lorg/json/JSONObject;)V
    .locals 18
    .param p1, "r"    # Lorg/json/JSONObject;

    .prologue
    .line 1382
    :try_start_0
    new-instance v5, Landroid/util/SparseArray;

    invoke-direct {v5}, Landroid/util/SparseArray;-><init>()V

    .local v5, "names":Landroid/util/SparseArray;, "Landroid/util/SparseArray<Ljava/lang/String;>;"
    new-instance v6, Landroid/util/SparseArray;

    invoke-direct {v6}, Landroid/util/SparseArray;-><init>()V

    .line 1384
    .local v6, "photos":Landroid/util/SparseArray;, "Landroid/util/SparseArray<Ljava/lang/String;>;"
    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v2

    .line 1386
    .local v2, "account":Lcom/vkontakte/android/auth/VKAccount;
    move-object/from16 v0, p0

    iget-object v8, v0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter$3;->this$1:Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;

    iget-boolean v8, v8, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->fromGroup:Z

    if-eqz v8, :cond_4

    move-object/from16 v0, p0

    iget-object v8, v0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter$3;->this$1:Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;

    iget-object v8, v8, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->this$0:Lcom/vkontakte/android/fragments/news/NewPostFragment;

    iget v8, v8, Lcom/vkontakte/android/fragments/news/NewPostFragment;->uid:I

    move v9, v8

    :goto_0
    move-object/from16 v0, p0

    iget-object v8, v0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter$3;->this$1:Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;

    iget-boolean v8, v8, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->fromGroup:Z

    if-eqz v8, :cond_5

    move-object/from16 v0, p0

    iget-object v8, v0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter$3;->this$1:Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;

    iget-object v8, v8, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->this$0:Lcom/vkontakte/android/fragments/news/NewPostFragment;

    iget-object v8, v8, Lcom/vkontakte/android/fragments/news/NewPostFragment;->mGroupTitle:Ljava/lang/String;

    :goto_1
    invoke-virtual {v5, v9, v8}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 1387
    move-object/from16 v0, p0

    iget-object v8, v0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter$3;->this$1:Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;

    iget-boolean v8, v8, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->fromGroup:Z

    if-eqz v8, :cond_6

    move-object/from16 v0, p0

    iget-object v8, v0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter$3;->this$1:Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;

    iget-object v8, v8, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->this$0:Lcom/vkontakte/android/fragments/news/NewPostFragment;

    iget v8, v8, Lcom/vkontakte/android/fragments/news/NewPostFragment;->uid:I

    move v9, v8

    :goto_2
    move-object/from16 v0, p0

    iget-object v8, v0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter$3;->this$1:Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;

    iget-boolean v8, v8, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->fromGroup:Z

    if-eqz v8, :cond_7

    move-object/from16 v0, p0

    iget-object v8, v0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter$3;->this$1:Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;

    iget-object v8, v8, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->this$0:Lcom/vkontakte/android/fragments/news/NewPostFragment;

    iget-object v8, v8, Lcom/vkontakte/android/fragments/news/NewPostFragment;->mGroupPhoto:Ljava/lang/String;

    :goto_3
    invoke-virtual {v6, v9, v8}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 1388
    new-instance v3, Lcom/vkontakte/android/NewsEntry;

    const-string/jumbo v8, "response"

    move-object/from16 v0, p1

    invoke-virtual {v0, v8}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v8

    const/4 v9, 0x0

    invoke-virtual {v8, v9}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v8

    const/4 v9, 0x0

    invoke-direct {v3, v8, v9, v5, v6}, Lcom/vkontakte/android/NewsEntry;-><init>(Lorg/json/JSONObject;Ljava/lang/String;Landroid/util/SparseArray;Landroid/util/SparseArray;)V

    .line 1390
    .local v3, "e":Lcom/vkontakte/android/NewsEntry;
    move-object/from16 v0, p0

    iget-object v8, v0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter$3;->val$edit:Lcom/vkontakte/android/NewsEntry;

    if-eqz v8, :cond_1

    .line 1391
    iget-object v8, v3, Lcom/vkontakte/android/NewsEntry;->userName:Ljava/lang/String;

    invoke-static {v8}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v8

    if-eqz v8, :cond_0

    .line 1392
    move-object/from16 v0, p0

    iget-object v8, v0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter$3;->val$edit:Lcom/vkontakte/android/NewsEntry;

    iget-object v8, v8, Lcom/vkontakte/android/NewsEntry;->userName:Ljava/lang/String;

    iput-object v8, v3, Lcom/vkontakte/android/NewsEntry;->userName:Ljava/lang/String;

    .line 1394
    :cond_0
    iget-object v8, v3, Lcom/vkontakte/android/NewsEntry;->userPhotoURL:Ljava/lang/String;

    invoke-static {v8}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v8

    if-eqz v8, :cond_1

    .line 1395
    move-object/from16 v0, p0

    iget-object v8, v0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter$3;->val$edit:Lcom/vkontakte/android/NewsEntry;

    iget-object v8, v8, Lcom/vkontakte/android/NewsEntry;->userPhotoURL:Ljava/lang/String;

    iput-object v8, v3, Lcom/vkontakte/android/NewsEntry;->userPhotoURL:Ljava/lang/String;

    .line 1399
    :cond_1
    move-object/from16 v0, p0

    iget-object v8, v0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter$3;->val$edit:Lcom/vkontakte/android/NewsEntry;

    if-eqz v8, :cond_9

    move-object/from16 v0, p0

    iget-object v8, v0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter$3;->this$1:Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;

    iget-boolean v8, v8, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->isSuggest:Z

    if-nez v8, :cond_9

    .line 1400
    move-object/from16 v0, p0

    iget-object v8, v0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter$3;->this$1:Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;

    iget-object v8, v8, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->this$0:Lcom/vkontakte/android/fragments/news/NewPostFragment;

    invoke-virtual {v8}, Lcom/vkontakte/android/fragments/news/NewPostFragment;->getActivity()Landroid/app/Activity;

    move-result-object v8

    const v9, 0x7f08050b

    const/4 v10, 0x0

    invoke-static {v8, v9, v10}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v8

    invoke-virtual {v8}, Landroid/widget/Toast;->show()V

    .line 1401
    move-object/from16 v0, p0

    iget-object v8, v0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter$3;->val$edit:Lcom/vkontakte/android/NewsEntry;

    const/16 v9, 0x800

    invoke-virtual {v8, v9}, Lcom/vkontakte/android/NewsEntry;->flag(I)Z

    move-result v8

    if-eqz v8, :cond_2

    move-object/from16 v0, p0

    iget-object v8, v0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter$3;->this$1:Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;

    iget-object v8, v8, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->postponeTo:Ljava/util/Calendar;

    if-nez v8, :cond_2

    .line 1402
    new-instance v4, Landroid/content/Intent;

    const-string/jumbo v8, "com.vkontakte.android.POST_DELETED"

    invoke-direct {v4, v8}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 1403
    .local v4, "intent":Landroid/content/Intent;
    const-string/jumbo v8, "owner_id"

    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter$3;->val$edit:Lcom/vkontakte/android/NewsEntry;

    iget v9, v9, Lcom/vkontakte/android/NewsEntry;->ownerID:I

    invoke-virtual {v4, v8, v9}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 1404
    const-string/jumbo v8, "post_id"

    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter$3;->val$edit:Lcom/vkontakte/android/NewsEntry;

    iget v9, v9, Lcom/vkontakte/android/NewsEntry;->postID:I

    invoke-virtual {v4, v8, v9}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 1405
    const-string/jumbo v8, "post"

    invoke-virtual {v4, v8, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 1406
    move-object/from16 v0, p0

    iget-object v8, v0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter$3;->this$1:Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;

    iget-object v8, v8, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->this$0:Lcom/vkontakte/android/fragments/news/NewPostFragment;

    invoke-virtual {v8}, Lcom/vkontakte/android/fragments/news/NewPostFragment;->getActivity()Landroid/app/Activity;

    move-result-object v8

    const-string/jumbo v9, "com.vkontakte.android.permission.ACCESS_DATA"

    invoke-virtual {v8, v4, v9}, Landroid/app/Activity;->sendBroadcast(Landroid/content/Intent;Ljava/lang/String;)V

    .line 1407
    move-object/from16 v0, p0

    iget-object v8, v0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter$3;->val$edit:Lcom/vkontakte/android/NewsEntry;

    invoke-static {}, Lcom/vkontakte/android/TimeUtils;->getCurrentTime()I

    move-result v9

    iput v9, v8, Lcom/vkontakte/android/NewsEntry;->time:I

    .line 1408
    move-object/from16 v0, p0

    iget-object v8, v0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter$3;->val$edit:Lcom/vkontakte/android/NewsEntry;

    const/16 v9, 0x800

    const/4 v10, 0x0

    invoke-virtual {v8, v9, v10}, Lcom/vkontakte/android/NewsEntry;->flag(IZ)V

    .line 1410
    .end local v4    # "intent":Landroid/content/Intent;
    :cond_2
    move-object/from16 v0, p0

    iget-object v8, v0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter$3;->this$1:Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;

    iget-object v8, v8, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->this$0:Lcom/vkontakte/android/fragments/news/NewPostFragment;

    iget-object v8, v8, Lcom/vkontakte/android/fragments/news/NewPostFragment;->attachView:Lcom/vkontakte/android/ui/AttachmentsEditorView;

    invoke-virtual {v8}, Lcom/vkontakte/android/ui/AttachmentsEditorView;->clear()V

    .line 1411
    move-object/from16 v0, p0

    iget-object v8, v0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter$3;->this$1:Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;

    iget-boolean v8, v8, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->isComment:Z

    if-eqz v8, :cond_8

    .line 1412
    new-instance v4, Landroid/content/Intent;

    invoke-direct {v4}, Landroid/content/Intent;-><init>()V

    .line 1413
    .restart local v4    # "intent":Landroid/content/Intent;
    const-string/jumbo v8, "comment"

    invoke-virtual {v4, v8, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 1414
    move-object/from16 v0, p0

    iget-object v8, v0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter$3;->this$1:Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;

    iget-object v8, v8, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->this$0:Lcom/vkontakte/android/fragments/news/NewPostFragment;

    invoke-virtual {v8}, Lcom/vkontakte/android/fragments/news/NewPostFragment;->getActivity()Landroid/app/Activity;

    move-result-object v8

    const/4 v9, -0x1

    invoke-virtual {v8, v9, v4}, Landroid/app/Activity;->setResult(ILandroid/content/Intent;)V

    .line 1415
    move-object/from16 v0, p0

    iget-object v8, v0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter$3;->this$1:Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;

    iget-object v8, v8, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->this$0:Lcom/vkontakte/android/fragments/news/NewPostFragment;

    invoke-virtual {v8}, Lcom/vkontakte/android/fragments/news/NewPostFragment;->getActivity()Landroid/app/Activity;

    move-result-object v8

    invoke-virtual {v8}, Landroid/app/Activity;->finish()V

    .line 1472
    .end local v2    # "account":Lcom/vkontakte/android/auth/VKAccount;
    .end local v3    # "e":Lcom/vkontakte/android/NewsEntry;
    .end local v4    # "intent":Landroid/content/Intent;
    .end local v5    # "names":Landroid/util/SparseArray;, "Landroid/util/SparseArray<Ljava/lang/String;>;"
    .end local v6    # "photos":Landroid/util/SparseArray;, "Landroid/util/SparseArray<Ljava/lang/String;>;"
    :cond_3
    :goto_4
    return-void

    .line 1386
    .restart local v2    # "account":Lcom/vkontakte/android/auth/VKAccount;
    .restart local v5    # "names":Landroid/util/SparseArray;, "Landroid/util/SparseArray<Ljava/lang/String;>;"
    .restart local v6    # "photos":Landroid/util/SparseArray;, "Landroid/util/SparseArray<Ljava/lang/String;>;"
    :cond_4
    invoke-virtual {v2}, Lcom/vkontakte/android/auth/VKAccount;->getUid()I

    move-result v8

    move v9, v8

    goto/16 :goto_0

    :cond_5
    invoke-virtual {v2}, Lcom/vkontakte/android/auth/VKAccount;->getName()Ljava/lang/String;

    move-result-object v8

    goto/16 :goto_1

    .line 1387
    :cond_6
    invoke-virtual {v2}, Lcom/vkontakte/android/auth/VKAccount;->getUid()I

    move-result v8

    move v9, v8

    goto/16 :goto_2

    :cond_7
    invoke-virtual {v2}, Lcom/vkontakte/android/auth/VKAccount;->getPhoto()Ljava/lang/String;

    move-result-object v8

    goto/16 :goto_3

    .line 1418
    .restart local v3    # "e":Lcom/vkontakte/android/NewsEntry;
    :cond_8
    new-instance v4, Landroid/content/Intent;

    const-string/jumbo v8, "com.vkontakte.android.POST_REPLACED"

    invoke-direct {v4, v8}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 1419
    .restart local v4    # "intent":Landroid/content/Intent;
    const-string/jumbo v8, "entry"

    invoke-virtual {v4, v8, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 1420
    move-object/from16 v0, p0

    iget-object v8, v0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter$3;->this$1:Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;

    iget-object v8, v8, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->this$0:Lcom/vkontakte/android/fragments/news/NewPostFragment;

    invoke-virtual {v8}, Lcom/vkontakte/android/fragments/news/NewPostFragment;->getActivity()Landroid/app/Activity;

    move-result-object v8

    const-string/jumbo v9, "com.vkontakte.android.permission.ACCESS_DATA"

    invoke-virtual {v8, v4, v9}, Landroid/app/Activity;->sendBroadcast(Landroid/content/Intent;Ljava/lang/String;)V

    .line 1421
    move-object/from16 v0, p0

    iget-object v8, v0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter$3;->this$1:Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;

    iget-object v8, v8, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->this$0:Lcom/vkontakte/android/fragments/news/NewPostFragment;

    invoke-virtual {v8}, Lcom/vkontakte/android/fragments/news/NewPostFragment;->getActivity()Landroid/app/Activity;

    move-result-object v8

    const/4 v9, -0x1

    invoke-virtual {v8, v9}, Landroid/app/Activity;->setResult(I)V

    .line 1422
    move-object/from16 v0, p0

    iget-object v8, v0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter$3;->this$1:Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;

    iget-object v8, v8, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->this$0:Lcom/vkontakte/android/fragments/news/NewPostFragment;

    invoke-virtual {v8}, Lcom/vkontakte/android/fragments/news/NewPostFragment;->getActivity()Landroid/app/Activity;

    move-result-object v8

    invoke-virtual {v8}, Landroid/app/Activity;->finish()V

    .line 1423
    move-object/from16 v0, p0

    iget-object v8, v0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter$3;->val$edit:Lcom/vkontakte/android/NewsEntry;

    iget v8, v8, Lcom/vkontakte/android/NewsEntry;->ownerID:I

    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter$3;->val$edit:Lcom/vkontakte/android/NewsEntry;

    iget v9, v9, Lcom/vkontakte/android/NewsEntry;->userID:I

    if-ne v8, v9, :cond_3

    move-object/from16 v0, p0

    iget-object v8, v0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter$3;->this$1:Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;

    iget-object v8, v8, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->postponeTo:Ljava/util/Calendar;

    if-nez v8, :cond_3

    .line 1424
    move-object/from16 v0, p0

    iget-object v8, v0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter$3;->val$edit:Lcom/vkontakte/android/NewsEntry;

    const/4 v9, 0x0

    invoke-static {v8, v9}, Lcom/vkontakte/android/cache/NewsfeedCache;->replaceOne(Lcom/vkontakte/android/NewsEntry;Z)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_4

    .line 1468
    .end local v2    # "account":Lcom/vkontakte/android/auth/VKAccount;
    .end local v3    # "e":Lcom/vkontakte/android/NewsEntry;
    .end local v4    # "intent":Landroid/content/Intent;
    .end local v5    # "names":Landroid/util/SparseArray;, "Landroid/util/SparseArray<Ljava/lang/String;>;"
    .end local v6    # "photos":Landroid/util/SparseArray;, "Landroid/util/SparseArray<Ljava/lang/String;>;"
    :catch_0
    move-exception v7

    .line 1469
    .local v7, "x":Lorg/json/JSONException;
    const-string/jumbo v8, "vk"

    invoke-static {v8, v7}, Lcom/vkontakte/android/Log;->w(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 1470
    new-instance v8, Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;

    const/4 v9, -0x2

    invoke-virtual {v7}, Lorg/json/JSONException;->getMessage()Ljava/lang/String;

    move-result-object v10

    invoke-direct {v8, v9, v10}, Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;-><init>(ILjava/lang/String;)V

    move-object/from16 v0, p0

    invoke-virtual {v0, v8}, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter$3;->fail(Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;)V

    goto/16 :goto_4

    .line 1428
    .end local v7    # "x":Lorg/json/JSONException;
    .restart local v2    # "account":Lcom/vkontakte/android/auth/VKAccount;
    .restart local v3    # "e":Lcom/vkontakte/android/NewsEntry;
    .restart local v5    # "names":Landroid/util/SparseArray;, "Landroid/util/SparseArray<Ljava/lang/String;>;"
    .restart local v6    # "photos":Landroid/util/SparseArray;, "Landroid/util/SparseArray<Ljava/lang/String;>;"
    :cond_9
    :try_start_1
    move-object/from16 v0, p0

    iget-object v8, v0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter$3;->this$1:Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;

    iget-object v8, v8, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->postponeTo:Ljava/util/Calendar;

    if-eqz v8, :cond_d

    .line 1429
    move-object/from16 v0, p0

    iget-object v8, v0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter$3;->this$1:Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;

    iget-object v8, v8, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->this$0:Lcom/vkontakte/android/fragments/news/NewPostFragment;

    invoke-virtual {v8}, Lcom/vkontakte/android/fragments/news/NewPostFragment;->getActivity()Landroid/app/Activity;

    move-result-object v8

    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter$3;->this$1:Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;

    iget-object v9, v9, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->this$0:Lcom/vkontakte/android/fragments/news/NewPostFragment;

    invoke-virtual {v9}, Lcom/vkontakte/android/fragments/news/NewPostFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v9

    const v10, 0x7f080787

    const/4 v11, 0x1

    new-array v11, v11, [Ljava/lang/Object;

    const/4 v12, 0x0

    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter$3;->this$1:Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;

    iget-object v13, v13, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->postponeTo:Ljava/util/Calendar;

    invoke-virtual {v13}, Ljava/util/Calendar;->getTimeInMillis()J

    move-result-wide v14

    const-wide/16 v16, 0x3e8

    div-long v14, v14, v16

    long-to-int v13, v14

    invoke-static {v13}, Lcom/vkontakte/android/TimeUtils;->langDate(I)Ljava/lang/String;

    move-result-object v13

    aput-object v13, v11, v12

    invoke-virtual {v9, v10, v11}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v9

    const/4 v10, 0x0

    invoke-static {v8, v9, v10}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v8

    invoke-virtual {v8}, Landroid/widget/Toast;->show()V

    .line 1448
    :goto_5
    move-object/from16 v0, p0

    iget-object v8, v0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter$3;->this$1:Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;

    iget-boolean v8, v8, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->isSuggest:Z

    if-eqz v8, :cond_a

    move-object/from16 v0, p0

    iget-object v8, v0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter$3;->val$edit:Lcom/vkontakte/android/NewsEntry;

    if-eqz v8, :cond_a

    .line 1449
    new-instance v4, Landroid/content/Intent;

    const-string/jumbo v8, "com.vkontakte.android.POST_DELETED"

    invoke-direct {v4, v8}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 1450
    .restart local v4    # "intent":Landroid/content/Intent;
    const-string/jumbo v8, "owner_id"

    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter$3;->val$edit:Lcom/vkontakte/android/NewsEntry;

    iget v9, v9, Lcom/vkontakte/android/NewsEntry;->ownerID:I

    invoke-virtual {v4, v8, v9}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 1451
    const-string/jumbo v8, "post_id"

    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter$3;->val$edit:Lcom/vkontakte/android/NewsEntry;

    iget v9, v9, Lcom/vkontakte/android/NewsEntry;->postID:I

    invoke-virtual {v4, v8, v9}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 1452
    const-string/jumbo v8, "post"

    invoke-virtual {v4, v8, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 1453
    move-object/from16 v0, p0

    iget-object v8, v0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter$3;->this$1:Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;

    iget-object v8, v8, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->this$0:Lcom/vkontakte/android/fragments/news/NewPostFragment;

    invoke-virtual {v8}, Lcom/vkontakte/android/fragments/news/NewPostFragment;->getActivity()Landroid/app/Activity;

    move-result-object v8

    if-eqz v8, :cond_a

    .line 1454
    move-object/from16 v0, p0

    iget-object v8, v0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter$3;->this$1:Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;

    iget-object v8, v8, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->this$0:Lcom/vkontakte/android/fragments/news/NewPostFragment;

    invoke-virtual {v8}, Lcom/vkontakte/android/fragments/news/NewPostFragment;->getActivity()Landroid/app/Activity;

    move-result-object v8

    const-string/jumbo v9, "com.vkontakte.android.permission.ACCESS_DATA"

    invoke-virtual {v8, v4, v9}, Landroid/app/Activity;->sendBroadcast(Landroid/content/Intent;Ljava/lang/String;)V

    .line 1457
    .end local v4    # "intent":Landroid/content/Intent;
    :cond_a
    move-object/from16 v0, p0

    iget-object v8, v0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter$3;->this$1:Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;

    iget-object v8, v8, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->this$0:Lcom/vkontakte/android/fragments/news/NewPostFragment;

    iget v8, v8, Lcom/vkontakte/android/fragments/news/NewPostFragment;->uid:I

    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v9

    invoke-virtual {v9}, Lcom/vkontakte/android/auth/VKAccount;->getUid()I

    move-result v9

    if-eq v8, v9, :cond_b

    move-object/from16 v0, p0

    iget-object v8, v0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter$3;->this$1:Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;

    iget-object v8, v8, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->this$0:Lcom/vkontakte/android/fragments/news/NewPostFragment;

    iget v8, v8, Lcom/vkontakte/android/fragments/news/NewPostFragment;->uid:I

    if-gez v8, :cond_c

    move-object/from16 v0, p0

    iget-object v8, v0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter$3;->this$1:Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;

    iget-boolean v8, v8, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->fromGroup:Z

    if-eqz v8, :cond_c

    :cond_b
    move-object/from16 v0, p0

    iget-object v8, v0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter$3;->this$1:Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;

    iget-object v8, v8, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->postponeTo:Ljava/util/Calendar;

    if-nez v8, :cond_c

    move-object/from16 v0, p0

    iget-object v8, v0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter$3;->this$1:Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;

    iget-object v8, v8, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->this$0:Lcom/vkontakte/android/fragments/news/NewPostFragment;

    iget-boolean v8, v8, Lcom/vkontakte/android/fragments/news/NewPostFragment;->mSuggest:Z

    if-nez v8, :cond_c

    .line 1458
    new-instance v4, Landroid/content/Intent;

    const-string/jumbo v8, "com.vkontakte.android.NEW_POST_ADDED"

    invoke-direct {v4, v8}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 1459
    .restart local v4    # "intent":Landroid/content/Intent;
    const-string/jumbo v8, "entry"

    invoke-virtual {v4, v8, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 1460
    move-object/from16 v0, p0

    iget-object v8, v0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter$3;->this$1:Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;

    iget-object v8, v8, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->this$0:Lcom/vkontakte/android/fragments/news/NewPostFragment;

    invoke-virtual {v8}, Lcom/vkontakte/android/fragments/news/NewPostFragment;->getActivity()Landroid/app/Activity;

    move-result-object v8

    const-string/jumbo v9, "com.vkontakte.android.permission.ACCESS_DATA"

    invoke-virtual {v8, v4, v9}, Landroid/app/Activity;->sendBroadcast(Landroid/content/Intent;Ljava/lang/String;)V

    .line 1462
    invoke-static {}, Lcom/vkontakte/android/cache/NewsfeedCache;->hasEntries()Z

    move-result v8

    if-eqz v8, :cond_c

    .line 1463
    invoke-static {v3}, Lcom/vkontakte/android/cache/NewsfeedCache;->addToTop(Lcom/vkontakte/android/NewsEntry;)V

    .line 1466
    .end local v4    # "intent":Landroid/content/Intent;
    :cond_c
    move-object/from16 v0, p0

    iget-object v8, v0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter$3;->this$1:Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;

    iget-object v8, v8, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->this$0:Lcom/vkontakte/android/fragments/news/NewPostFragment;

    invoke-virtual {v8}, Lcom/vkontakte/android/fragments/news/NewPostFragment;->getActivity()Landroid/app/Activity;

    move-result-object v8

    const/4 v9, -0x1

    invoke-virtual {v8, v9}, Landroid/app/Activity;->setResult(I)V

    .line 1467
    move-object/from16 v0, p0

    iget-object v8, v0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter$3;->this$1:Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;

    iget-object v8, v8, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->this$0:Lcom/vkontakte/android/fragments/news/NewPostFragment;

    invoke-virtual {v8}, Lcom/vkontakte/android/fragments/news/NewPostFragment;->getActivity()Landroid/app/Activity;

    move-result-object v8

    invoke-virtual {v8}, Landroid/app/Activity;->finish()V

    goto/16 :goto_4

    .line 1431
    :cond_d
    move-object/from16 v0, p0

    iget-object v8, v0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter$3;->this$1:Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;

    iget-object v8, v8, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->this$0:Lcom/vkontakte/android/fragments/news/NewPostFragment;

    invoke-virtual {v8}, Lcom/vkontakte/android/fragments/news/NewPostFragment;->getActivity()Landroid/app/Activity;

    move-result-object v9

    move-object/from16 v0, p0

    iget-object v8, v0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter$3;->this$1:Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;

    iget-object v8, v8, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->this$0:Lcom/vkontakte/android/fragments/news/NewPostFragment;

    invoke-virtual {v8}, Lcom/vkontakte/android/fragments/news/NewPostFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v10

    move-object/from16 v0, p0

    iget-object v8, v0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter$3;->this$1:Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;

    iget-object v8, v8, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->this$0:Lcom/vkontakte/android/fragments/news/NewPostFragment;

    iget-boolean v8, v8, Lcom/vkontakte/android/fragments/news/NewPostFragment;->mSuggest:Z

    if-eqz v8, :cond_e

    const v8, 0x7f08050b

    :goto_6
    invoke-virtual {v10, v8}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v8

    const/4 v10, 0x0

    invoke-static {v9, v8, v10}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v8

    invoke-virtual {v8}, Landroid/widget/Toast;->show()V
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_0

    goto/16 :goto_5

    :cond_e
    const v8, 0x7f080783

    goto :goto_6
.end method

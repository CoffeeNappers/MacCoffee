.class Lcom/vkontakte/android/fragments/ProfileFragment$34;
.super Lcom/vkontakte/android/api/SimpleCallback;
.source "ProfileFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/fragments/ProfileFragment;->loadWall(II)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/api/SimpleCallback",
        "<",
        "Lcom/vkontakte/android/api/wall/WallGet$Result;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

.field final synthetic val$count:I

.field final synthetic val$offset:I


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/ProfileFragment;Landroid/app/Fragment;II)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/fragments/ProfileFragment;
    .param p2, "fragment"    # Landroid/app/Fragment;

    .prologue
    .line 3225
    iput-object p1, p0, Lcom/vkontakte/android/fragments/ProfileFragment$34;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    iput p3, p0, Lcom/vkontakte/android/fragments/ProfileFragment$34;->val$offset:I

    iput p4, p0, Lcom/vkontakte/android/fragments/ProfileFragment$34;->val$count:I

    invoke-direct {p0, p2}, Lcom/vkontakte/android/api/SimpleCallback;-><init>(Landroid/app/Fragment;)V

    return-void
.end method


# virtual methods
.method public fail(Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;)V
    .locals 6
    .param p1, "err"    # Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;

    .prologue
    const/16 v5, 0x12

    const/16 v4, 0xf

    const/4 v1, 0x0

    .line 3314
    iget-object v2, p0, Lcom/vkontakte/android/fragments/ProfileFragment$34;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    const/4 v3, 0x0

    invoke-static {v2, v3}, Lcom/vkontakte/android/fragments/ProfileFragment;->access$5002(Lcom/vkontakte/android/fragments/ProfileFragment;Lme/grishka/appkit/api/APIRequest;)Lme/grishka/appkit/api/APIRequest;

    .line 3315
    invoke-virtual {p1}, Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;->getCodeValue()I

    move-result v0

    .line 3316
    .local v0, "errorCode":I
    if-eq v0, v5, :cond_0

    if-ne v0, v4, :cond_8

    .line 3317
    :cond_0
    iget-object v2, p0, Lcom/vkontakte/android/fragments/ProfileFragment$34;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-static {v2}, Lcom/vkontakte/android/fragments/ProfileFragment;->access$4000(Lcom/vkontakte/android/fragments/ProfileFragment;)Landroid/widget/TextView;

    move-result-object v2

    if-nez v2, :cond_1

    .line 3347
    :goto_0
    return-void

    .line 3320
    :cond_1
    if-ne v0, v5, :cond_2

    .line 3321
    iget-object v2, p0, Lcom/vkontakte/android/fragments/ProfileFragment$34;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-static {v2}, Lcom/vkontakte/android/fragments/ProfileFragment;->access$4000(Lcom/vkontakte/android/fragments/ProfileFragment;)Landroid/widget/TextView;

    move-result-object v2

    const v3, 0x7f08048d

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(I)V

    .line 3323
    :cond_2
    if-ne v0, v4, :cond_3

    .line 3325
    iget-object v2, p1, Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;->message:Ljava/lang/String;

    const-string/jumbo v3, "is disabled"

    invoke-virtual {v2, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_7

    .line 3326
    iget-object v2, p0, Lcom/vkontakte/android/fragments/ProfileFragment$34;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-static {v2}, Lcom/vkontakte/android/fragments/ProfileFragment;->access$4000(Lcom/vkontakte/android/fragments/ProfileFragment;)Landroid/widget/TextView;

    move-result-object v2

    const-string/jumbo v3, ""

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 3331
    :cond_3
    :goto_1
    iget-object v2, p0, Lcom/vkontakte/android/fragments/ProfileFragment$34;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-static {v2}, Lcom/vkontakte/android/fragments/ProfileFragment;->access$5100(Lcom/vkontakte/android/fragments/ProfileFragment;)Lcom/vkontakte/android/fragments/ProfileFragment$ViewInfoItem;

    move-result-object v2

    if-eqz v2, :cond_4

    .line 3332
    iget-object v2, p0, Lcom/vkontakte/android/fragments/ProfileFragment$34;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-static {v2}, Lcom/vkontakte/android/fragments/ProfileFragment;->access$1700(Lcom/vkontakte/android/fragments/ProfileFragment;)Ljava/util/ArrayList;

    move-result-object v2

    iget-object v3, p0, Lcom/vkontakte/android/fragments/ProfileFragment$34;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-static {v3}, Lcom/vkontakte/android/fragments/ProfileFragment;->access$5100(Lcom/vkontakte/android/fragments/ProfileFragment;)Lcom/vkontakte/android/fragments/ProfileFragment$ViewInfoItem;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 3336
    :cond_4
    iget-object v2, p0, Lcom/vkontakte/android/fragments/ProfileFragment$34;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {v2, v3, v1}, Lcom/vkontakte/android/fragments/ProfileFragment;->onDataLoaded(Ljava/util/List;Z)V

    .line 3337
    iget-object v2, p0, Lcom/vkontakte/android/fragments/ProfileFragment$34;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    iget-object v3, p0, Lcom/vkontakte/android/fragments/ProfileFragment$34;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-static {v3}, Lcom/vkontakte/android/fragments/ProfileFragment;->access$100(Lcom/vkontakte/android/fragments/ProfileFragment;)I

    move-result v3

    if-gez v3, :cond_5

    const/4 v1, 0x1

    :cond_5
    invoke-static {v2, v1}, Lcom/vkontakte/android/fragments/ProfileFragment;->access$5200(Lcom/vkontakte/android/fragments/ProfileFragment;Z)V

    .line 3339
    iget-object v1, p0, Lcom/vkontakte/android/fragments/ProfileFragment$34;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-static {v1}, Lcom/vkontakte/android/fragments/ProfileFragment;->access$100(Lcom/vkontakte/android/fragments/ProfileFragment;)I

    move-result v1

    if-lez v1, :cond_6

    .line 3340
    iget-object v1, p0, Lcom/vkontakte/android/fragments/ProfileFragment$34;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-static {v1}, Lcom/vkontakte/android/fragments/ProfileFragment;->access$000(Lcom/vkontakte/android/fragments/ProfileFragment;)Lcom/vkontakte/android/api/ExtendedUserProfile;

    move-result-object v1

    const/4 v2, -0x1

    iput v2, v1, Lcom/vkontakte/android/api/ExtendedUserProfile;->friendStatus:I

    .line 3342
    :cond_6
    iget-object v1, p0, Lcom/vkontakte/android/fragments/ProfileFragment$34;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-static {v1}, Lcom/vkontakte/android/fragments/ProfileFragment;->access$3200(Lcom/vkontakte/android/fragments/ProfileFragment;)V

    .line 3343
    iget-object v1, p0, Lcom/vkontakte/android/fragments/ProfileFragment$34;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-virtual {v1}, Lcom/vkontakte/android/fragments/ProfileFragment;->invalidateOptionsMenu()V

    goto :goto_0

    .line 3328
    :cond_7
    iget-object v2, p0, Lcom/vkontakte/android/fragments/ProfileFragment$34;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-static {v2}, Lcom/vkontakte/android/fragments/ProfileFragment;->access$4000(Lcom/vkontakte/android/fragments/ProfileFragment;)Landroid/widget/TextView;

    move-result-object v2

    const v3, 0x7f08048c

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(I)V

    goto :goto_1

    .line 3345
    :cond_8
    iget-object v1, p0, Lcom/vkontakte/android/fragments/ProfileFragment$34;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-virtual {v1, p1}, Lcom/vkontakte/android/fragments/ProfileFragment;->onError(Lme/grishka/appkit/api/ErrorResponse;)V

    goto/16 :goto_0
.end method

.method public success(Lcom/vkontakte/android/api/wall/WallGet$Result;)V
    .locals 12
    .param p1, "res"    # Lcom/vkontakte/android/api/wall/WallGet$Result;

    .prologue
    const/4 v11, 0x0

    const/16 v10, 0x400

    const/4 v6, 0x1

    const/4 v7, 0x0

    .line 3229
    iget-object v5, p0, Lcom/vkontakte/android/fragments/ProfileFragment$34;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-virtual {v5}, Lcom/vkontakte/android/fragments/ProfileFragment;->getActivity()Landroid/app/Activity;

    move-result-object v5

    if-nez v5, :cond_0

    .line 3310
    :goto_0
    return-void

    .line 3232
    :cond_0
    iget v5, p0, Lcom/vkontakte/android/fragments/ProfileFragment$34;->val$offset:I

    if-nez v5, :cond_1

    .line 3233
    iget-object v5, p0, Lcom/vkontakte/android/fragments/ProfileFragment$34;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-static {v5}, Lcom/vkontakte/android/fragments/ProfileFragment;->access$000(Lcom/vkontakte/android/fragments/ProfileFragment;)Lcom/vkontakte/android/api/ExtendedUserProfile;

    move-result-object v5

    iget v8, p1, Lcom/vkontakte/android/api/wall/WallGet$Result;->postponedCount:I

    iput v8, v5, Lcom/vkontakte/android/api/ExtendedUserProfile;->postponedCount:I

    .line 3234
    iget-object v5, p0, Lcom/vkontakte/android/fragments/ProfileFragment$34;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-static {v5}, Lcom/vkontakte/android/fragments/ProfileFragment;->access$000(Lcom/vkontakte/android/fragments/ProfileFragment;)Lcom/vkontakte/android/api/ExtendedUserProfile;

    move-result-object v5

    iget v8, p1, Lcom/vkontakte/android/api/wall/WallGet$Result;->suggestedCount:I

    iput v8, v5, Lcom/vkontakte/android/api/ExtendedUserProfile;->suggestedCount:I

    .line 3235
    iget-object v5, p0, Lcom/vkontakte/android/fragments/ProfileFragment$34;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-static {v5}, Lcom/vkontakte/android/fragments/ProfileFragment;->access$3500(Lcom/vkontakte/android/fragments/ProfileFragment;)V

    .line 3237
    :cond_1
    iget-object v5, p0, Lcom/vkontakte/android/fragments/ProfileFragment$34;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-static {v5}, Lcom/vkontakte/android/fragments/ProfileFragment;->access$3600(Lcom/vkontakte/android/fragments/ProfileFragment;)Z

    move-result v5

    if-eqz v5, :cond_2

    iget-object v5, p1, Lcom/vkontakte/android/api/wall/WallGet$Result;->news:Lcom/vkontakte/android/data/VKList;

    invoke-virtual {v5}, Lcom/vkontakte/android/data/VKList;->size()I

    move-result v5

    if-lez v5, :cond_2

    iget-object v5, p1, Lcom/vkontakte/android/api/wall/WallGet$Result;->news:Lcom/vkontakte/android/data/VKList;

    invoke-virtual {v5, v7}, Lcom/vkontakte/android/data/VKList;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/vkontakte/android/NewsEntry;

    invoke-virtual {v5, v10}, Lcom/vkontakte/android/NewsEntry;->flag(I)Z

    move-result v5

    if-eqz v5, :cond_2

    .line 3238
    iget-object v8, p0, Lcom/vkontakte/android/fragments/ProfileFragment$34;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    iget-object v5, p1, Lcom/vkontakte/android/api/wall/WallGet$Result;->news:Lcom/vkontakte/android/data/VKList;

    invoke-virtual {v5, v7}, Lcom/vkontakte/android/data/VKList;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/vkontakte/android/NewsEntry;

    iget v5, v5, Lcom/vkontakte/android/NewsEntry;->postID:I

    invoke-static {v8, v5}, Lcom/vkontakte/android/fragments/ProfileFragment;->access$3702(Lcom/vkontakte/android/fragments/ProfileFragment;I)I

    .line 3241
    :cond_2
    iget-object v5, p1, Lcom/vkontakte/android/api/wall/WallGet$Result;->news:Lcom/vkontakte/android/data/VKList;

    invoke-virtual {v5}, Lcom/vkontakte/android/data/VKList;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :cond_3
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_4

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/vkontakte/android/NewsEntry;

    .line 3242
    .local v3, "p":Lcom/vkontakte/android/NewsEntry;
    iget v8, v3, Lcom/vkontakte/android/NewsEntry;->postID:I

    iget-object v9, p0, Lcom/vkontakte/android/fragments/ProfileFragment$34;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-static {v9}, Lcom/vkontakte/android/fragments/ProfileFragment;->access$3700(Lcom/vkontakte/android/fragments/ProfileFragment;)I

    move-result v9

    if-ne v8, v9, :cond_3

    invoke-virtual {v3, v10}, Lcom/vkontakte/android/NewsEntry;->flag(I)Z

    move-result v8

    if-nez v8, :cond_3

    .line 3243
    iget-object v5, p1, Lcom/vkontakte/android/api/wall/WallGet$Result;->news:Lcom/vkontakte/android/data/VKList;

    invoke-virtual {v5, v3}, Lcom/vkontakte/android/data/VKList;->remove(Ljava/lang/Object;)Z

    .line 3249
    .end local v3    # "p":Lcom/vkontakte/android/NewsEntry;
    :cond_4
    iget-object v5, p0, Lcom/vkontakte/android/fragments/ProfileFragment$34;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-static {v5}, Lcom/vkontakte/android/fragments/ProfileFragment;->access$3800(Lcom/vkontakte/android/fragments/ProfileFragment;)Landroid/view/View;

    move-result-object v5

    if-eqz v5, :cond_6

    .line 3250
    iget-object v5, p1, Lcom/vkontakte/android/api/wall/WallGet$Result;->news:Lcom/vkontakte/android/data/VKList;

    invoke-virtual {v5}, Lcom/vkontakte/android/data/VKList;->total()I

    move-result v5

    if-nez v5, :cond_10

    .line 3251
    iget-object v5, p0, Lcom/vkontakte/android/fragments/ProfileFragment$34;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-static {v5}, Lcom/vkontakte/android/fragments/ProfileFragment;->access$1700(Lcom/vkontakte/android/fragments/ProfileFragment;)Ljava/util/ArrayList;

    move-result-object v5

    iget-object v8, p0, Lcom/vkontakte/android/fragments/ProfileFragment$34;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-static {v8}, Lcom/vkontakte/android/fragments/ProfileFragment;->access$3900(Lcom/vkontakte/android/fragments/ProfileFragment;)Lcom/vkontakte/android/fragments/ProfileFragment$ViewInfoItem;

    move-result-object v8

    invoke-virtual {v5, v8}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_5

    .line 3252
    iget-object v5, p0, Lcom/vkontakte/android/fragments/ProfileFragment$34;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-static {v5}, Lcom/vkontakte/android/fragments/ProfileFragment;->access$1700(Lcom/vkontakte/android/fragments/ProfileFragment;)Ljava/util/ArrayList;

    move-result-object v5

    iget-object v8, p0, Lcom/vkontakte/android/fragments/ProfileFragment$34;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-static {v8}, Lcom/vkontakte/android/fragments/ProfileFragment;->access$3900(Lcom/vkontakte/android/fragments/ProfileFragment;)Lcom/vkontakte/android/fragments/ProfileFragment$ViewInfoItem;

    move-result-object v8

    invoke-virtual {v5, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 3254
    :cond_5
    iget-object v5, p0, Lcom/vkontakte/android/fragments/ProfileFragment$34;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-static {v5}, Lcom/vkontakte/android/fragments/ProfileFragment;->access$4000(Lcom/vkontakte/android/fragments/ProfileFragment;)Landroid/widget/TextView;

    move-result-object v8

    iget-object v5, p0, Lcom/vkontakte/android/fragments/ProfileFragment$34;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-static {v5}, Lcom/vkontakte/android/fragments/ProfileFragment;->access$100(Lcom/vkontakte/android/fragments/ProfileFragment;)I

    move-result v5

    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v9

    invoke-virtual {v9}, Lcom/vkontakte/android/auth/VKAccount;->getUid()I

    move-result v9

    if-ne v5, v9, :cond_f

    const v5, 0x7f080781

    :goto_1
    invoke-virtual {v8, v5}, Landroid/widget/TextView;->setText(I)V

    .line 3260
    :cond_6
    :goto_2
    iget v5, p0, Lcom/vkontakte/android/fragments/ProfileFragment$34;->val$offset:I

    if-nez v5, :cond_7

    iget-object v5, p0, Lcom/vkontakte/android/fragments/ProfileFragment$34;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-static {v5}, Lcom/vkontakte/android/fragments/ProfileFragment;->access$4100(Lcom/vkontakte/android/fragments/ProfileFragment;)Landroid/view/View;

    move-result-object v5

    if-eqz v5, :cond_7

    .line 3261
    iget-object v5, p0, Lcom/vkontakte/android/fragments/ProfileFragment$34;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-static {v5}, Lcom/vkontakte/android/fragments/ProfileFragment;->access$4100(Lcom/vkontakte/android/fragments/ProfileFragment;)Landroid/view/View;

    move-result-object v5

    const v8, 0x7f100503

    invoke-virtual {v5, v8}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    invoke-virtual {v5, v7}, Landroid/view/View;->setVisibility(I)V

    .line 3262
    iget-object v5, p0, Lcom/vkontakte/android/fragments/ProfileFragment$34;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-static {v5}, Lcom/vkontakte/android/fragments/ProfileFragment;->access$4100(Lcom/vkontakte/android/fragments/ProfileFragment;)Landroid/view/View;

    move-result-object v5

    const v8, 0x7f100504

    invoke-virtual {v5, v8}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    const/16 v8, 0x8

    invoke-virtual {v5, v8}, Landroid/view/View;->setVisibility(I)V

    .line 3264
    :cond_7
    iget-object v5, p0, Lcom/vkontakte/android/fragments/ProfileFragment$34;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    iget v8, v5, Lcom/vkontakte/android/fragments/ProfileFragment;->offset:I

    iget v9, p0, Lcom/vkontakte/android/fragments/ProfileFragment$34;->val$count:I

    add-int/2addr v8, v9

    iput v8, v5, Lcom/vkontakte/android/fragments/ProfileFragment;->offset:I

    .line 3265
    iget-object v5, p0, Lcom/vkontakte/android/fragments/ProfileFragment$34;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-static {v5}, Lcom/vkontakte/android/fragments/ProfileFragment;->access$100(Lcom/vkontakte/android/fragments/ProfileFragment;)I

    move-result v5

    if-eqz v5, :cond_8

    iget-object v5, p0, Lcom/vkontakte/android/fragments/ProfileFragment$34;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-static {v5}, Lcom/vkontakte/android/fragments/ProfileFragment;->access$100(Lcom/vkontakte/android/fragments/ProfileFragment;)I

    move-result v5

    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v8

    invoke-virtual {v8}, Lcom/vkontakte/android/auth/VKAccount;->getUid()I

    move-result v8

    if-ne v5, v8, :cond_9

    :cond_8
    iget-object v5, p0, Lcom/vkontakte/android/fragments/ProfileFragment$34;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-static {v5}, Lcom/vkontakte/android/fragments/ProfileFragment;->access$4200(Lcom/vkontakte/android/fragments/ProfileFragment;)Z

    move-result v5

    if-eqz v5, :cond_9

    iget-object v5, p0, Lcom/vkontakte/android/fragments/ProfileFragment$34;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-static {v5}, Lcom/vkontakte/android/fragments/ProfileFragment;->access$4300(Lcom/vkontakte/android/fragments/ProfileFragment;)Z

    move-result v8

    iget-object v5, p0, Lcom/vkontakte/android/fragments/ProfileFragment$34;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-static {v5}, Lcom/vkontakte/android/fragments/ProfileFragment;->access$000(Lcom/vkontakte/android/fragments/ProfileFragment;)Lcom/vkontakte/android/api/ExtendedUserProfile;

    move-result-object v5

    iget-boolean v5, v5, Lcom/vkontakte/android/api/ExtendedUserProfile;->showAllPosts:Z

    if-nez v5, :cond_11

    move v5, v6

    :goto_3
    if-ne v8, v5, :cond_9

    iget-object v5, p0, Lcom/vkontakte/android/fragments/ProfileFragment$34;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-virtual {v5}, Lcom/vkontakte/android/fragments/ProfileFragment;->getActivity()Landroid/app/Activity;

    move-result-object v5

    if-eqz v5, :cond_9

    .line 3266
    iget-object v5, p0, Lcom/vkontakte/android/fragments/ProfileFragment$34;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-virtual {v5}, Lcom/vkontakte/android/fragments/ProfileFragment;->getActivity()Landroid/app/Activity;

    move-result-object v5

    invoke-virtual {v5, v11, v7}, Landroid/app/Activity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v5

    invoke-interface {v5}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v5

    const-string/jumbo v8, "postponed_count"

    iget v9, p1, Lcom/vkontakte/android/api/wall/WallGet$Result;->postponedCount:I

    invoke-interface {v5, v8, v9}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object v5

    invoke-interface {v5}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 3269
    :cond_9
    iget-object v5, p0, Lcom/vkontakte/android/fragments/ProfileFragment$34;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-static {v5}, Lcom/vkontakte/android/fragments/ProfileFragment;->access$4400(Lcom/vkontakte/android/fragments/ProfileFragment;)Z

    move-result v5

    if-nez v5, :cond_12

    .line 3270
    iget-object v5, p1, Lcom/vkontakte/android/api/wall/WallGet$Result;->news:Lcom/vkontakte/android/data/VKList;

    invoke-virtual {v5}, Lcom/vkontakte/android/data/VKList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .line 3271
    .local v2, "itr":Ljava/util/Iterator;, "Ljava/util/Iterator<Lcom/vkontakte/android/NewsEntry;>;"
    :cond_a
    :goto_4
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_12

    .line 3272
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/NewsEntry;

    .line 3273
    .local v0, "e":Lcom/vkontakte/android/NewsEntry;
    const/4 v4, 0x0

    .line 3274
    .local v4, "removed":Z
    iget-object v5, p0, Lcom/vkontakte/android/fragments/ProfileFragment$34;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-static {v5}, Lcom/vkontakte/android/fragments/ProfileFragment;->access$4500(Lcom/vkontakte/android/fragments/ProfileFragment;)Ljava/util/ArrayList;

    move-result-object v5

    invoke-virtual {v5}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :cond_b
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_c

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vkontakte/android/NewsEntry;

    .line 3275
    .local v1, "ee":Lcom/vkontakte/android/NewsEntry;
    iget v8, v0, Lcom/vkontakte/android/NewsEntry;->postID:I

    iget v9, v1, Lcom/vkontakte/android/NewsEntry;->postID:I

    if-ne v8, v9, :cond_b

    .line 3276
    invoke-interface {v2}, Ljava/util/Iterator;->remove()V

    .line 3278
    const/4 v4, 0x1

    .line 3282
    .end local v1    # "ee":Lcom/vkontakte/android/NewsEntry;
    :cond_c
    if-nez v4, :cond_a

    .line 3285
    iget-object v5, p0, Lcom/vkontakte/android/fragments/ProfileFragment$34;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-static {v5}, Lcom/vkontakte/android/fragments/ProfileFragment;->access$4600(Lcom/vkontakte/android/fragments/ProfileFragment;)Ljava/util/ArrayList;

    move-result-object v5

    invoke-virtual {v5}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :cond_d
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_e

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vkontakte/android/NewsEntry;

    .line 3286
    .restart local v1    # "ee":Lcom/vkontakte/android/NewsEntry;
    iget v8, v0, Lcom/vkontakte/android/NewsEntry;->postID:I

    iget v9, v1, Lcom/vkontakte/android/NewsEntry;->postID:I

    if-ne v8, v9, :cond_d

    .line 3287
    invoke-interface {v2}, Ljava/util/Iterator;->remove()V

    .line 3289
    const/4 v4, 0x1

    .line 3293
    .end local v1    # "ee":Lcom/vkontakte/android/NewsEntry;
    :cond_e
    if-eqz v4, :cond_a

    goto :goto_4

    .line 3254
    .end local v0    # "e":Lcom/vkontakte/android/NewsEntry;
    .end local v2    # "itr":Ljava/util/Iterator;, "Ljava/util/Iterator<Lcom/vkontakte/android/NewsEntry;>;"
    .end local v4    # "removed":Z
    :cond_f
    const v5, 0x7f080780

    goto/16 :goto_1

    .line 3256
    :cond_10
    iget-object v5, p0, Lcom/vkontakte/android/fragments/ProfileFragment$34;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-static {v5}, Lcom/vkontakte/android/fragments/ProfileFragment;->access$1700(Lcom/vkontakte/android/fragments/ProfileFragment;)Ljava/util/ArrayList;

    move-result-object v5

    iget-object v8, p0, Lcom/vkontakte/android/fragments/ProfileFragment$34;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-static {v8}, Lcom/vkontakte/android/fragments/ProfileFragment;->access$3900(Lcom/vkontakte/android/fragments/ProfileFragment;)Lcom/vkontakte/android/fragments/ProfileFragment$ViewInfoItem;

    move-result-object v8

    invoke-virtual {v5, v8}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    goto/16 :goto_2

    :cond_11
    move v5, v7

    .line 3265
    goto/16 :goto_3

    .line 3299
    :cond_12
    iget-object v5, p0, Lcom/vkontakte/android/fragments/ProfileFragment$34;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    iget-object v8, p1, Lcom/vkontakte/android/api/wall/WallGet$Result;->news:Lcom/vkontakte/android/data/VKList;

    invoke-virtual {v8}, Lcom/vkontakte/android/data/VKList;->total()I

    move-result v8

    invoke-static {v5, v8}, Lcom/vkontakte/android/fragments/ProfileFragment;->access$4702(Lcom/vkontakte/android/fragments/ProfileFragment;I)I

    .line 3301
    iget-object v5, p0, Lcom/vkontakte/android/fragments/ProfileFragment$34;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-static {v5}, Lcom/vkontakte/android/fragments/ProfileFragment;->access$4800(Lcom/vkontakte/android/fragments/ProfileFragment;)V

    .line 3303
    iget-object v5, p1, Lcom/vkontakte/android/api/wall/WallGet$Result;->next_from:Ljava/lang/String;

    invoke-static {v5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-eqz v5, :cond_13

    .line 3304
    iget-object v5, p0, Lcom/vkontakte/android/fragments/ProfileFragment$34;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-static {v5, v11}, Lcom/vkontakte/android/fragments/ProfileFragment;->access$4902(Lcom/vkontakte/android/fragments/ProfileFragment;Ljava/lang/String;)Ljava/lang/String;

    .line 3305
    iget-object v5, p0, Lcom/vkontakte/android/fragments/ProfileFragment$34;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    iget-object v6, p1, Lcom/vkontakte/android/api/wall/WallGet$Result;->news:Lcom/vkontakte/android/data/VKList;

    invoke-virtual {v5, v6, v7}, Lcom/vkontakte/android/fragments/ProfileFragment;->onDataLoaded(Ljava/util/List;Z)V

    goto/16 :goto_0

    .line 3307
    :cond_13
    iget-object v5, p0, Lcom/vkontakte/android/fragments/ProfileFragment$34;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    iget-object v7, p1, Lcom/vkontakte/android/api/wall/WallGet$Result;->next_from:Ljava/lang/String;

    invoke-static {v5, v7}, Lcom/vkontakte/android/fragments/ProfileFragment;->access$4902(Lcom/vkontakte/android/fragments/ProfileFragment;Ljava/lang/String;)Ljava/lang/String;

    .line 3308
    iget-object v5, p0, Lcom/vkontakte/android/fragments/ProfileFragment$34;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    iget-object v7, p1, Lcom/vkontakte/android/api/wall/WallGet$Result;->news:Lcom/vkontakte/android/data/VKList;

    invoke-virtual {v5, v7, v6}, Lcom/vkontakte/android/fragments/ProfileFragment;->onDataLoaded(Ljava/util/List;Z)V

    goto/16 :goto_0
.end method

.method public bridge synthetic success(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 3225
    check-cast p1, Lcom/vkontakte/android/api/wall/WallGet$Result;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/fragments/ProfileFragment$34;->success(Lcom/vkontakte/android/api/wall/WallGet$Result;)V

    return-void
.end method

.class public Lcom/vkontakte/android/RepostActivity;
.super Landroid/app/Activity;
.source "RepostActivity.java"


# static fields
.field private static final SEL_CHAT_RESULT:I = 0x66

.field private static final SEL_GROUP_RESULT:I = 0x65


# instance fields
.field private groupName:Ljava/lang/String;

.field private groupPhoto:Ljava/lang/String;

.field private logoutReceiver:Lcom/vkontakte/android/activities/LogoutReceiver;

.field private newPost:Z

.field private post:Lcom/vkontakte/android/NewsEntry;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 39
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lcom/vkontakte/android/RepostActivity;)Lcom/vkontakte/android/NewsEntry;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/RepostActivity;

    .prologue
    .line 39
    iget-object v0, p0, Lcom/vkontakte/android/RepostActivity;->post:Lcom/vkontakte/android/NewsEntry;

    return-object v0
.end method

.method static synthetic access$100(Lcom/vkontakte/android/RepostActivity;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/RepostActivity;

    .prologue
    .line 39
    iget-object v0, p0, Lcom/vkontakte/android/RepostActivity;->groupName:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$200(Lcom/vkontakte/android/RepostActivity;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/RepostActivity;

    .prologue
    .line 39
    iget-object v0, p0, Lcom/vkontakte/android/RepostActivity;->groupPhoto:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$300(Lcom/vkontakte/android/RepostActivity;)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/RepostActivity;

    .prologue
    .line 39
    invoke-direct {p0}, Lcom/vkontakte/android/RepostActivity;->broadcastUpdate()V

    return-void
.end method

.method private broadcastUpdate()V
    .locals 9

    .prologue
    const/16 v6, 0x8

    const/4 v8, 0x4

    .line 291
    iget-object v0, p0, Lcom/vkontakte/android/RepostActivity;->post:Lcom/vkontakte/android/NewsEntry;

    iget v0, v0, Lcom/vkontakte/android/NewsEntry;->type:I

    if-eqz v0, :cond_0

    .line 304
    :goto_0
    return-void

    .line 294
    :cond_0
    new-instance v7, Landroid/content/Intent;

    const-string/jumbo v0, "com.vkontakte.android.POST_UPDATED"

    invoke-direct {v7, v0}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 295
    .local v7, "intent":Landroid/content/Intent;
    const-string/jumbo v0, "post_id"

    iget-object v1, p0, Lcom/vkontakte/android/RepostActivity;->post:Lcom/vkontakte/android/NewsEntry;

    iget v1, v1, Lcom/vkontakte/android/NewsEntry;->postID:I

    invoke-virtual {v7, v0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 296
    const-string/jumbo v0, "owner_id"

    iget-object v1, p0, Lcom/vkontakte/android/RepostActivity;->post:Lcom/vkontakte/android/NewsEntry;

    iget v1, v1, Lcom/vkontakte/android/NewsEntry;->ownerID:I

    invoke-virtual {v7, v0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 297
    const-string/jumbo v0, "comments"

    iget-object v1, p0, Lcom/vkontakte/android/RepostActivity;->post:Lcom/vkontakte/android/NewsEntry;

    iget v1, v1, Lcom/vkontakte/android/NewsEntry;->numComments:I

    invoke-virtual {v7, v0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 298
    const-string/jumbo v0, "retweets"

    iget-object v1, p0, Lcom/vkontakte/android/RepostActivity;->post:Lcom/vkontakte/android/NewsEntry;

    iget v1, v1, Lcom/vkontakte/android/NewsEntry;->numRetweets:I

    invoke-virtual {v7, v0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 299
    const-string/jumbo v0, "likes"

    iget-object v1, p0, Lcom/vkontakte/android/RepostActivity;->post:Lcom/vkontakte/android/NewsEntry;

    iget v1, v1, Lcom/vkontakte/android/NewsEntry;->numLikes:I

    invoke-virtual {v7, v0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 300
    const-string/jumbo v0, "liked"

    iget-object v1, p0, Lcom/vkontakte/android/RepostActivity;->post:Lcom/vkontakte/android/NewsEntry;

    invoke-virtual {v1, v6}, Lcom/vkontakte/android/NewsEntry;->flag(I)Z

    move-result v1

    invoke-virtual {v7, v0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 301
    const-string/jumbo v0, "retweeted"

    iget-object v1, p0, Lcom/vkontakte/android/RepostActivity;->post:Lcom/vkontakte/android/NewsEntry;

    invoke-virtual {v1, v8}, Lcom/vkontakte/android/NewsEntry;->flag(I)Z

    move-result v1

    invoke-virtual {v7, v0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 302
    const-string/jumbo v0, "com.vkontakte.android.permission.ACCESS_DATA"

    invoke-virtual {p0, v7, v0}, Lcom/vkontakte/android/RepostActivity;->sendBroadcast(Landroid/content/Intent;Ljava/lang/String;)V

    .line 303
    iget-object v0, p0, Lcom/vkontakte/android/RepostActivity;->post:Lcom/vkontakte/android/NewsEntry;

    iget v0, v0, Lcom/vkontakte/android/NewsEntry;->ownerID:I

    iget-object v1, p0, Lcom/vkontakte/android/RepostActivity;->post:Lcom/vkontakte/android/NewsEntry;

    iget v1, v1, Lcom/vkontakte/android/NewsEntry;->postID:I

    iget-object v2, p0, Lcom/vkontakte/android/RepostActivity;->post:Lcom/vkontakte/android/NewsEntry;

    iget v2, v2, Lcom/vkontakte/android/NewsEntry;->numLikes:I

    iget-object v3, p0, Lcom/vkontakte/android/RepostActivity;->post:Lcom/vkontakte/android/NewsEntry;

    iget v3, v3, Lcom/vkontakte/android/NewsEntry;->numComments:I

    iget-object v4, p0, Lcom/vkontakte/android/RepostActivity;->post:Lcom/vkontakte/android/NewsEntry;

    iget v4, v4, Lcom/vkontakte/android/NewsEntry;->numRetweets:I

    iget-object v5, p0, Lcom/vkontakte/android/RepostActivity;->post:Lcom/vkontakte/android/NewsEntry;

    invoke-virtual {v5, v6}, Lcom/vkontakte/android/NewsEntry;->flag(I)Z

    move-result v5

    iget-object v6, p0, Lcom/vkontakte/android/RepostActivity;->post:Lcom/vkontakte/android/NewsEntry;

    invoke-virtual {v6, v8}, Lcom/vkontakte/android/NewsEntry;->flag(I)Z

    move-result v6

    invoke-static/range {v0 .. v6}, Lcom/vkontakte/android/cache/NewsfeedCache;->update(IIIIIZZ)V

    goto :goto_0
.end method

.method private doRepostWithComment(ILjava/lang/String;)V
    .locals 8
    .param p1, "gid"    # I
    .param p2, "comment"    # Ljava/lang/String;

    .prologue
    const/4 v2, 0x0

    .line 199
    const-string/jumbo v7, "wall"

    .line 200
    .local v7, "type":Ljava/lang/String;
    const/4 v4, 0x0

    .line 201
    .local v4, "akey":Ljava/lang/String;
    iget-object v0, p0, Lcom/vkontakte/android/RepostActivity;->post:Lcom/vkontakte/android/NewsEntry;

    iget v0, v0, Lcom/vkontakte/android/NewsEntry;->type:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    .line 202
    const-string/jumbo v7, "photo"

    .line 203
    iget-object v0, p0, Lcom/vkontakte/android/RepostActivity;->post:Lcom/vkontakte/android/NewsEntry;

    iget-object v0, v0, Lcom/vkontakte/android/NewsEntry;->attachments:Ljava/util/ArrayList;

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/attachments/PhotoAttachment;

    iget-object v4, v0, Lcom/vkontakte/android/attachments/PhotoAttachment;->accessKey:Ljava/lang/String;

    .line 205
    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/RepostActivity;->post:Lcom/vkontakte/android/NewsEntry;

    iget v0, v0, Lcom/vkontakte/android/NewsEntry;->type:I

    const/4 v1, 0x2

    if-ne v0, v1, :cond_1

    .line 206
    const-string/jumbo v7, "video"

    .line 207
    iget-object v0, p0, Lcom/vkontakte/android/RepostActivity;->post:Lcom/vkontakte/android/NewsEntry;

    iget-object v0, v0, Lcom/vkontakte/android/NewsEntry;->attachments:Ljava/util/ArrayList;

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/attachments/VideoAttachment;

    iget-object v0, v0, Lcom/vkontakte/android/attachments/VideoAttachment;->video:Lcom/vkontakte/android/api/VideoFile;

    iget-object v4, v0, Lcom/vkontakte/android/api/VideoFile;->accessKey:Ljava/lang/String;

    .line 209
    :cond_1
    iget-object v0, p0, Lcom/vkontakte/android/RepostActivity;->post:Lcom/vkontakte/android/NewsEntry;

    iget v0, v0, Lcom/vkontakte/android/NewsEntry;->type:I

    const/16 v1, 0x12

    if-ne v0, v1, :cond_2

    .line 210
    const-string/jumbo v7, "market"

    .line 212
    :cond_2
    iget-object v0, p0, Lcom/vkontakte/android/RepostActivity;->post:Lcom/vkontakte/android/NewsEntry;

    iget v0, v0, Lcom/vkontakte/android/NewsEntry;->type:I

    const/16 v1, 0xc

    if-ne v0, v1, :cond_3

    .line 213
    const-string/jumbo v7, "wall_ads"

    .line 215
    :cond_3
    new-instance v0, Lcom/vkontakte/android/api/wall/WallRepost;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/vkontakte/android/RepostActivity;->post:Lcom/vkontakte/android/NewsEntry;

    iget v2, v2, Lcom/vkontakte/android/NewsEntry;->ownerID:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, "_"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/vkontakte/android/RepostActivity;->post:Lcom/vkontakte/android/NewsEntry;

    iget v2, v2, Lcom/vkontakte/android/NewsEntry;->postID:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 216
    invoke-virtual {p0}, Lcom/vkontakte/android/RepostActivity;->getIntent()Landroid/content/Intent;

    move-result-object v2

    const-string/jumbo v3, "referer"

    invoke-virtual {v2, v3}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    iget-object v2, p0, Lcom/vkontakte/android/RepostActivity;->post:Lcom/vkontakte/android/NewsEntry;

    .line 217
    invoke-virtual {v2}, Lcom/vkontakte/android/NewsEntry;->getTrackCode()Ljava/lang/String;

    move-result-object v6

    move v2, p1

    move-object v3, p2

    invoke-direct/range {v0 .. v6}, Lcom/vkontakte/android/api/wall/WallRepost;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    new-instance v1, Lcom/vkontakte/android/RepostActivity$1;

    invoke-direct {v1, p0, p0, p1, p2}, Lcom/vkontakte/android/RepostActivity$1;-><init>(Lcom/vkontakte/android/RepostActivity;Landroid/content/Context;ILjava/lang/String;)V

    .line 218
    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/wall/WallRepost;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    .line 286
    invoke-virtual {v0, p0}, Lcom/vkontakte/android/api/VKAPIRequest;->wrapProgress(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    .line 287
    invoke-virtual {v0, p0}, Lcom/vkontakte/android/api/VKAPIRequest;->exec(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 288
    return-void
.end method

.method private repostWithComment(I)V
    .locals 7
    .param p1, "gid"    # I

    .prologue
    const/high16 v5, 0x41800000    # 16.0f

    const/4 v6, 0x0

    .line 175
    new-instance v1, Landroid/widget/EditText;

    invoke-direct {v1, p0}, Landroid/widget/EditText;-><init>(Landroid/content/Context;)V

    .line 176
    .local v1, "ed":Landroid/widget/EditText;
    const/4 v3, 0x4

    invoke-virtual {v1, v3}, Landroid/widget/EditText;->setLines(I)V

    .line 177
    const/16 v3, 0x33

    invoke-virtual {v1, v3}, Landroid/widget/EditText;->setGravity(I)V

    .line 178
    new-instance v2, Landroid/widget/FrameLayout;

    invoke-direct {v2, p0}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 179
    .local v2, "fl":Landroid/widget/FrameLayout;
    invoke-virtual {v2, v1}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;)V

    .line 180
    sget v3, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v4, 0x15

    if-lt v3, v4, :cond_0

    .line 181
    invoke-static {v5}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v3

    invoke-static {v5}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v4

    invoke-virtual {v2, v3, v6, v4, v6}, Landroid/widget/FrameLayout;->setPadding(IIII)V

    .line 183
    :cond_0
    new-instance v3, Lcom/vkontakte/android/VKAlertDialog$Builder;

    invoke-direct {v3, p0}, Lcom/vkontakte/android/VKAlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const v4, 0x7f0805c0

    .line 184
    invoke-virtual {v3, v4}, Lcom/vkontakte/android/VKAlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v3

    .line 185
    invoke-virtual {v3, v2}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    move-result-object v3

    const v4, 0x7f080479

    invoke-static {p0, p1, v1}, Lcom/vkontakte/android/RepostActivity$$Lambda$3;->lambdaFactory$(Lcom/vkontakte/android/RepostActivity;ILandroid/widget/EditText;)Landroid/content/DialogInterface$OnClickListener;

    move-result-object v5

    .line 186
    invoke-virtual {v3, v4, v5}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v3

    const v4, 0x7f08011f

    invoke-static {p0}, Lcom/vkontakte/android/RepostActivity$$Lambda$4;->lambdaFactory$(Lcom/vkontakte/android/RepostActivity;)Landroid/content/DialogInterface$OnClickListener;

    move-result-object v5

    .line 187
    invoke-virtual {v3, v4, v5}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v3

    invoke-static {p0}, Lcom/vkontakte/android/RepostActivity$$Lambda$5;->lambdaFactory$(Lcom/vkontakte/android/RepostActivity;)Landroid/content/DialogInterface$OnCancelListener;

    move-result-object v4

    .line 188
    invoke-virtual {v3, v4}, Landroid/app/AlertDialog$Builder;->setOnCancelListener(Landroid/content/DialogInterface$OnCancelListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v3

    .line 189
    invoke-virtual {v3}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    .line 190
    .local v0, "dlg":Landroid/app/AlertDialog;
    invoke-static {p0, v1}, Lcom/vkontakte/android/RepostActivity$$Lambda$6;->lambdaFactory$(Lcom/vkontakte/android/RepostActivity;Landroid/widget/EditText;)Landroid/content/DialogInterface$OnShowListener;

    move-result-object v3

    invoke-virtual {v0, v3}, Landroid/app/AlertDialog;->setOnShowListener(Landroid/content/DialogInterface$OnShowListener;)V

    .line 194
    invoke-virtual {v0, v6}, Landroid/app/AlertDialog;->setCanceledOnTouchOutside(Z)V

    .line 195
    invoke-virtual {v0}, Landroid/app/AlertDialog;->show()V

    .line 196
    return-void
.end method

.method private startChatChooser()V
    .locals 2

    .prologue
    .line 128
    new-instance v0, Lcom/vkontakte/android/fragments/messages/DialogsFragment$Builder;

    invoke-direct {v0}, Lcom/vkontakte/android/fragments/messages/DialogsFragment$Builder;-><init>()V

    invoke-virtual {v0}, Lcom/vkontakte/android/fragments/messages/DialogsFragment$Builder;->setSelectMode()Lcom/vkontakte/android/fragments/messages/DialogsFragment$Builder;

    move-result-object v0

    const/16 v1, 0x66

    invoke-virtual {v0, p0, v1}, Lcom/vkontakte/android/fragments/messages/DialogsFragment$Builder;->forResult(Landroid/app/Activity;I)Z

    .line 129
    return-void
.end method

.method private startGroupChooser()V
    .locals 2

    .prologue
    .line 124
    new-instance v0, Lcom/vkontakte/android/fragments/groups/AdminedGroupsFragment$Builder;

    const/4 v1, 0x2

    invoke-direct {v0, v1}, Lcom/vkontakte/android/fragments/groups/AdminedGroupsFragment$Builder;-><init>(I)V

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/fragments/groups/AdminedGroupsFragment$Builder;->select(Z)Lcom/vkontakte/android/fragments/groups/AdminedGroupsFragment$Builder;

    move-result-object v0

    const/16 v1, 0x65

    invoke-virtual {v0, p0, v1}, Lcom/vkontakte/android/fragments/groups/AdminedGroupsFragment$Builder;->forResult(Landroid/app/Activity;I)Z

    .line 125
    return-void
.end method


# virtual methods
.method synthetic lambda$onCreate$0(Ljava/util/ArrayList;Landroid/content/DialogInterface;I)V
    .locals 6
    .param p1, "acts"    # Ljava/util/ArrayList;
    .param p2, "dialog"    # Landroid/content/DialogInterface;
    .param p3, "which"    # I

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 89
    invoke-virtual {p1, p3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    const/4 v1, -0x1

    invoke-virtual {v4}, Ljava/lang/String;->hashCode()I

    move-result v5

    sparse-switch v5, :sswitch_data_0

    :cond_0
    :goto_0
    packed-switch v1, :pswitch_data_0

    .line 114
    :goto_1
    return-void

    .line 89
    :sswitch_0
    const-string/jumbo v5, "me"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    move v1, v2

    goto :goto_0

    :sswitch_1
    const-string/jumbo v5, "group"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    move v1, v3

    goto :goto_0

    :sswitch_2
    const-string/jumbo v5, "msg"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    const/4 v1, 0x2

    goto :goto_0

    .line 91
    :pswitch_0
    iget-boolean v1, p0, Lcom/vkontakte/android/RepostActivity;->newPost:Z

    if-eqz v1, :cond_2

    .line 92
    new-instance v0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Builder;

    invoke-direct {v0}, Lcom/vkontakte/android/fragments/news/NewPostFragment$Builder;-><init>()V

    .line 93
    .local v0, "builder":Lcom/vkontakte/android/fragments/news/NewPostFragment$Builder;
    iget-object v1, p0, Lcom/vkontakte/android/RepostActivity;->groupName:Ljava/lang/String;

    iget-object v4, p0, Lcom/vkontakte/android/RepostActivity;->groupPhoto:Ljava/lang/String;

    invoke-virtual {v0, v1, v4}, Lcom/vkontakte/android/fragments/news/NewPostFragment$Builder;->attachGroup(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/fragments/news/NewPostFragment$Builder;

    .line 94
    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v1

    invoke-virtual {v1}, Lcom/vkontakte/android/auth/VKAccount;->getUid()I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/fragments/news/NewPostFragment$Builder;->uid(I)Lcom/vkontakte/android/fragments/news/NewPostFragment$Builder;

    .line 95
    invoke-virtual {v0, v2}, Lcom/vkontakte/android/fragments/news/NewPostFragment$Builder;->suggest(Z)Lcom/vkontakte/android/fragments/news/NewPostFragment$Builder;

    .line 96
    invoke-virtual {v0, v2}, Lcom/vkontakte/android/fragments/news/NewPostFragment$Builder;->isPublic(Z)Lcom/vkontakte/android/fragments/news/NewPostFragment$Builder;

    .line 97
    invoke-virtual {v0, v3}, Lcom/vkontakte/android/fragments/news/NewPostFragment$Builder;->send(Z)Lcom/vkontakte/android/fragments/news/NewPostFragment$Builder;

    .line 98
    iget-object v1, p0, Lcom/vkontakte/android/RepostActivity;->post:Lcom/vkontakte/android/NewsEntry;

    iget-object v1, v1, Lcom/vkontakte/android/NewsEntry;->attachments:Ljava/util/ArrayList;

    if-eqz v1, :cond_1

    .line 99
    iget-object v1, p0, Lcom/vkontakte/android/RepostActivity;->post:Lcom/vkontakte/android/NewsEntry;

    iget-object v1, v1, Lcom/vkontakte/android/NewsEntry;->attachments:Ljava/util/ArrayList;

    iget-object v2, p0, Lcom/vkontakte/android/RepostActivity;->post:Lcom/vkontakte/android/NewsEntry;

    iget-object v2, v2, Lcom/vkontakte/android/NewsEntry;->attachments:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    new-array v2, v2, [Lcom/vkontakte/android/attachments/Attachment;

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [Lcom/vkontakte/android/attachments/Attachment;

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/fragments/news/NewPostFragment$Builder;->attachAttachments([Lcom/vkontakte/android/attachments/Attachment;)Lcom/vkontakte/android/fragments/news/NewPostFragment$Builder;

    .line 101
    :cond_1
    invoke-virtual {v0, p0}, Lcom/vkontakte/android/fragments/news/NewPostFragment$Builder;->go(Landroid/content/Context;)Z

    .line 102
    invoke-virtual {p0}, Lcom/vkontakte/android/RepostActivity;->finish()V

    goto :goto_1

    .line 104
    .end local v0    # "builder":Lcom/vkontakte/android/fragments/news/NewPostFragment$Builder;
    :cond_2
    invoke-direct {p0, v2}, Lcom/vkontakte/android/RepostActivity;->repostWithComment(I)V

    goto :goto_1

    .line 108
    :pswitch_1
    invoke-direct {p0}, Lcom/vkontakte/android/RepostActivity;->startGroupChooser()V

    goto :goto_1

    .line 111
    :pswitch_2
    invoke-direct {p0}, Lcom/vkontakte/android/RepostActivity;->startChatChooser()V

    goto :goto_1

    .line 89
    nop

    :sswitch_data_0
    .sparse-switch
        0xd98 -> :sswitch_0
        0x1a781 -> :sswitch_2
        0x5e0f67f -> :sswitch_1
    .end sparse-switch

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method

.method synthetic lambda$onCreate$1(Landroid/content/DialogInterface;)V
    .locals 0
    .param p1, "dialog"    # Landroid/content/DialogInterface;

    .prologue
    .line 114
    invoke-virtual {p0}, Lcom/vkontakte/android/RepostActivity;->finish()V

    return-void
.end method

.method synthetic lambda$repostWithComment$2(ILandroid/widget/EditText;Landroid/content/DialogInterface;I)V
    .locals 1
    .param p1, "gid"    # I
    .param p2, "ed"    # Landroid/widget/EditText;
    .param p3, "dialog"    # Landroid/content/DialogInterface;
    .param p4, "which"    # I

    .prologue
    .line 186
    invoke-virtual {p2}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, p1, v0}, Lcom/vkontakte/android/RepostActivity;->doRepostWithComment(ILjava/lang/String;)V

    return-void
.end method

.method synthetic lambda$repostWithComment$3(Landroid/content/DialogInterface;I)V
    .locals 0
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "which"    # I

    .prologue
    .line 187
    invoke-virtual {p0}, Lcom/vkontakte/android/RepostActivity;->finish()V

    return-void
.end method

.method synthetic lambda$repostWithComment$4(Landroid/content/DialogInterface;)V
    .locals 0
    .param p1, "dialog"    # Landroid/content/DialogInterface;

    .prologue
    .line 188
    invoke-virtual {p0}, Lcom/vkontakte/android/RepostActivity;->finish()V

    return-void
.end method

.method synthetic lambda$repostWithComment$5(Landroid/widget/EditText;Landroid/content/DialogInterface;)V
    .locals 2
    .param p1, "ed"    # Landroid/widget/EditText;
    .param p2, "dialog"    # Landroid/content/DialogInterface;

    .prologue
    .line 191
    const-string/jumbo v1, "input_method"

    invoke-virtual {p0, v1}, Lcom/vkontakte/android/RepostActivity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/inputmethod/InputMethodManager;

    .line 192
    .local v0, "imm":Landroid/view/inputmethod/InputMethodManager;
    const/4 v1, 0x1

    invoke-virtual {v0, p1, v1}, Landroid/view/inputmethod/InputMethodManager;->showSoftInput(Landroid/view/View;I)Z

    .line 193
    return-void
.end method

.method public onActivityResult(IILandroid/content/Intent;)V
    .locals 6
    .param p1, "reqCode"    # I
    .param p2, "resCode"    # I
    .param p3, "data"    # Landroid/content/Intent;

    .prologue
    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 132
    const/4 v2, -0x1

    if-eq p2, v2, :cond_1

    .line 133
    invoke-virtual {p0}, Lcom/vkontakte/android/RepostActivity;->finish()V

    .line 172
    :cond_0
    :goto_0
    return-void

    .line 136
    :cond_1
    const/16 v2, 0x65

    if-ne p1, v2, :cond_3

    .line 137
    const-string/jumbo v2, "name"

    invoke-virtual {p3, v2}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/vkontakte/android/RepostActivity;->groupName:Ljava/lang/String;

    .line 138
    const-string/jumbo v2, "photo"

    invoke-virtual {p3, v2}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/vkontakte/android/RepostActivity;->groupPhoto:Ljava/lang/String;

    .line 139
    iget-boolean v2, p0, Lcom/vkontakte/android/RepostActivity;->newPost:Z

    if-eqz v2, :cond_5

    .line 140
    new-instance v0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Builder;

    invoke-direct {v0}, Lcom/vkontakte/android/fragments/news/NewPostFragment$Builder;-><init>()V

    .line 141
    .local v0, "builder":Lcom/vkontakte/android/fragments/news/NewPostFragment$Builder;
    iget-object v2, p0, Lcom/vkontakte/android/RepostActivity;->groupName:Ljava/lang/String;

    iget-object v3, p0, Lcom/vkontakte/android/RepostActivity;->groupPhoto:Ljava/lang/String;

    invoke-virtual {v0, v2, v3}, Lcom/vkontakte/android/fragments/news/NewPostFragment$Builder;->attachGroup(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/fragments/news/NewPostFragment$Builder;

    .line 142
    const-string/jumbo v2, "gid"

    invoke-virtual {p3, v2, v4}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v2

    invoke-virtual {v0, v2}, Lcom/vkontakte/android/fragments/news/NewPostFragment$Builder;->uid(I)Lcom/vkontakte/android/fragments/news/NewPostFragment$Builder;

    .line 143
    invoke-virtual {v0, v4}, Lcom/vkontakte/android/fragments/news/NewPostFragment$Builder;->suggest(Z)Lcom/vkontakte/android/fragments/news/NewPostFragment$Builder;

    .line 144
    invoke-virtual {v0, v5}, Lcom/vkontakte/android/fragments/news/NewPostFragment$Builder;->isPublic(Z)Lcom/vkontakte/android/fragments/news/NewPostFragment$Builder;

    .line 145
    invoke-virtual {v0, v5}, Lcom/vkontakte/android/fragments/news/NewPostFragment$Builder;->send(Z)Lcom/vkontakte/android/fragments/news/NewPostFragment$Builder;

    .line 146
    iget-object v2, p0, Lcom/vkontakte/android/RepostActivity;->post:Lcom/vkontakte/android/NewsEntry;

    iget-object v2, v2, Lcom/vkontakte/android/NewsEntry;->attachments:Ljava/util/ArrayList;

    if-eqz v2, :cond_2

    .line 147
    iget-object v2, p0, Lcom/vkontakte/android/RepostActivity;->post:Lcom/vkontakte/android/NewsEntry;

    iget-object v2, v2, Lcom/vkontakte/android/NewsEntry;->attachments:Ljava/util/ArrayList;

    iget-object v3, p0, Lcom/vkontakte/android/RepostActivity;->post:Lcom/vkontakte/android/NewsEntry;

    iget-object v3, v3, Lcom/vkontakte/android/NewsEntry;->attachments:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v3

    new-array v3, v3, [Lcom/vkontakte/android/attachments/Attachment;

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v2

    check-cast v2, [Lcom/vkontakte/android/attachments/Attachment;

    invoke-virtual {v0, v2}, Lcom/vkontakte/android/fragments/news/NewPostFragment$Builder;->attachAttachments([Lcom/vkontakte/android/attachments/Attachment;)Lcom/vkontakte/android/fragments/news/NewPostFragment$Builder;

    .line 149
    :cond_2
    invoke-virtual {v0, p0}, Lcom/vkontakte/android/fragments/news/NewPostFragment$Builder;->go(Landroid/content/Context;)Z

    .line 150
    invoke-virtual {p0}, Lcom/vkontakte/android/RepostActivity;->finish()V

    .line 155
    .end local v0    # "builder":Lcom/vkontakte/android/fragments/news/NewPostFragment$Builder;
    :cond_3
    :goto_1
    const/16 v2, 0x66

    if-ne p1, v2, :cond_0

    .line 156
    const-string/jumbo v2, "profile"

    invoke-virtual {p3, v2}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v1

    check-cast v1, Lcom/vkontakte/android/UserProfile;

    .line 158
    .local v1, "profile":Lcom/vkontakte/android/UserProfile;
    new-instance v0, Lcom/vkontakte/android/fragments/messages/ChatFragment$Builder;

    iget v2, v1, Lcom/vkontakte/android/UserProfile;->uid:I

    iget-object v3, v1, Lcom/vkontakte/android/UserProfile;->fullName:Ljava/lang/String;

    invoke-direct {v0, v2, v3}, Lcom/vkontakte/android/fragments/messages/ChatFragment$Builder;-><init>(ILjava/lang/String;)V

    .line 159
    .local v0, "builder":Lcom/vkontakte/android/fragments/messages/ChatFragment$Builder;
    iget-object v2, p0, Lcom/vkontakte/android/RepostActivity;->post:Lcom/vkontakte/android/NewsEntry;

    iget v2, v2, Lcom/vkontakte/android/NewsEntry;->type:I

    const/16 v3, 0x12

    if-ne v2, v3, :cond_6

    .line 160
    new-array v3, v5, [Lcom/vkontakte/android/attachments/Attachment;

    iget-object v2, p0, Lcom/vkontakte/android/RepostActivity;->post:Lcom/vkontakte/android/NewsEntry;

    iget-object v2, v2, Lcom/vkontakte/android/NewsEntry;->attachments:Ljava/util/ArrayList;

    invoke-virtual {v2, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/vkontakte/android/attachments/Attachment;

    aput-object v2, v3, v4

    invoke-virtual {v0, v3}, Lcom/vkontakte/android/fragments/messages/ChatFragment$Builder;->setAttachments([Landroid/os/Parcelable;)Lcom/vkontakte/android/fragments/messages/ChatFragment$Builder;

    .line 164
    :goto_2
    iget v2, v1, Lcom/vkontakte/android/UserProfile;->uid:I

    const v3, 0x77359400

    if-ge v2, v3, :cond_4

    .line 165
    iget-object v2, v1, Lcom/vkontakte/android/UserProfile;->photo:Ljava/lang/String;

    invoke-virtual {v0, v2}, Lcom/vkontakte/android/fragments/messages/ChatFragment$Builder;->setPhoto(Ljava/lang/CharSequence;)Lcom/vkontakte/android/fragments/messages/ChatFragment$Builder;

    .line 167
    :cond_4
    invoke-virtual {v0, p0}, Lcom/vkontakte/android/fragments/messages/ChatFragment$Builder;->go(Landroid/content/Context;)Z

    .line 169
    iget-object v2, p0, Lcom/vkontakte/android/RepostActivity;->post:Lcom/vkontakte/android/NewsEntry;

    const-string/jumbo v3, "share_post"

    invoke-static {v2, v3}, Lcom/vkontakte/android/data/Analytics;->sendPromoPostActionByType(Lcom/vkontakte/android/NewsEntry;Ljava/lang/String;)V

    .line 170
    invoke-virtual {p0}, Lcom/vkontakte/android/RepostActivity;->finish()V

    goto/16 :goto_0

    .line 152
    .end local v0    # "builder":Lcom/vkontakte/android/fragments/messages/ChatFragment$Builder;
    .end local v1    # "profile":Lcom/vkontakte/android/UserProfile;
    :cond_5
    const-string/jumbo v2, "gid"

    invoke-virtual {p3, v2, v4}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v2

    invoke-direct {p0, v2}, Lcom/vkontakte/android/RepostActivity;->repostWithComment(I)V

    goto :goto_1

    .line 162
    .restart local v0    # "builder":Lcom/vkontakte/android/fragments/messages/ChatFragment$Builder;
    .restart local v1    # "profile":Lcom/vkontakte/android/UserProfile;
    :cond_6
    iget-object v2, p0, Lcom/vkontakte/android/RepostActivity;->post:Lcom/vkontakte/android/NewsEntry;

    invoke-virtual {v0, v2}, Lcom/vkontakte/android/fragments/messages/ChatFragment$Builder;->setPost(Landroid/os/Parcelable;)Lcom/vkontakte/android/fragments/messages/ChatFragment$Builder;

    goto :goto_2
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 8
    .param p1, "b"    # Landroid/os/Bundle;

    .prologue
    const/16 v7, 0x10

    const/4 v6, 0x1

    const/4 v5, 0x0

    const/4 v4, 0x5

    .line 51
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 52
    invoke-static {p0}, Lcom/vkontakte/android/activities/LogoutReceiver;->register(Landroid/app/Activity;)Lcom/vkontakte/android/activities/LogoutReceiver;

    move-result-object v2

    iput-object v2, p0, Lcom/vkontakte/android/RepostActivity;->logoutReceiver:Lcom/vkontakte/android/activities/LogoutReceiver;

    .line 54
    invoke-virtual {p0, v5, v5}, Lcom/vkontakte/android/RepostActivity;->overridePendingTransition(II)V

    .line 57
    invoke-virtual {p0}, Lcom/vkontakte/android/RepostActivity;->getIntent()Landroid/content/Intent;

    move-result-object v2

    const-string/jumbo v3, "post"

    invoke-virtual {v2, v3}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v2

    check-cast v2, Lcom/vkontakte/android/NewsEntry;

    iput-object v2, p0, Lcom/vkontakte/android/RepostActivity;->post:Lcom/vkontakte/android/NewsEntry;

    .line 58
    invoke-virtual {p0}, Lcom/vkontakte/android/RepostActivity;->getIntent()Landroid/content/Intent;

    move-result-object v2

    const-string/jumbo v3, "new_post"

    invoke-virtual {v2, v3, v5}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v2

    iput-boolean v2, p0, Lcom/vkontakte/android/RepostActivity;->newPost:Z

    .line 60
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 61
    .local v1, "items":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 62
    .local v0, "acts":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    iget-object v2, p0, Lcom/vkontakte/android/RepostActivity;->post:Lcom/vkontakte/android/NewsEntry;

    invoke-virtual {v2, v6}, Lcom/vkontakte/android/NewsEntry;->flag(I)Z

    move-result v2

    if-nez v2, :cond_1

    iget-object v2, p0, Lcom/vkontakte/android/RepostActivity;->post:Lcom/vkontakte/android/NewsEntry;

    iget v2, v2, Lcom/vkontakte/android/NewsEntry;->ownerID:I

    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v3

    invoke-virtual {v3}, Lcom/vkontakte/android/auth/VKAccount;->getUid()I

    move-result v3

    if-ne v2, v3, :cond_0

    iget-object v2, p0, Lcom/vkontakte/android/RepostActivity;->post:Lcom/vkontakte/android/NewsEntry;

    iget v2, v2, Lcom/vkontakte/android/NewsEntry;->ownerID:I

    iget-object v3, p0, Lcom/vkontakte/android/RepostActivity;->post:Lcom/vkontakte/android/NewsEntry;

    iget v3, v3, Lcom/vkontakte/android/NewsEntry;->userID:I

    if-eq v2, v3, :cond_1

    :cond_0
    iget-object v2, p0, Lcom/vkontakte/android/RepostActivity;->post:Lcom/vkontakte/android/NewsEntry;

    iget v2, v2, Lcom/vkontakte/android/NewsEntry;->type:I

    if-eq v2, v6, :cond_1

    iget-object v2, p0, Lcom/vkontakte/android/RepostActivity;->post:Lcom/vkontakte/android/NewsEntry;

    iget v2, v2, Lcom/vkontakte/android/NewsEntry;->type:I

    if-eq v2, v4, :cond_1

    iget-object v2, p0, Lcom/vkontakte/android/RepostActivity;->post:Lcom/vkontakte/android/NewsEntry;

    iget v2, v2, Lcom/vkontakte/android/NewsEntry;->type:I

    const/4 v3, 0x2

    if-eq v2, v3, :cond_1

    iget-object v2, p0, Lcom/vkontakte/android/RepostActivity;->post:Lcom/vkontakte/android/NewsEntry;

    iget v2, v2, Lcom/vkontakte/android/NewsEntry;->type:I

    if-ne v2, v7, :cond_6

    :cond_1
    iget-object v2, p0, Lcom/vkontakte/android/RepostActivity;->post:Lcom/vkontakte/android/NewsEntry;

    const/16 v3, 0x200

    invoke-virtual {v2, v3}, Lcom/vkontakte/android/NewsEntry;->flag(I)Z

    move-result v2

    if-nez v2, :cond_6

    .line 63
    iget-object v2, p0, Lcom/vkontakte/android/RepostActivity;->post:Lcom/vkontakte/android/NewsEntry;

    const/4 v3, 0x4

    invoke-virtual {v2, v3}, Lcom/vkontakte/android/NewsEntry;->flag(I)Z

    move-result v2

    if-nez v2, :cond_2

    iget-object v2, p0, Lcom/vkontakte/android/RepostActivity;->post:Lcom/vkontakte/android/NewsEntry;

    iget v2, v2, Lcom/vkontakte/android/NewsEntry;->ownerID:I

    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v3

    invoke-virtual {v3}, Lcom/vkontakte/android/auth/VKAccount;->getUid()I

    move-result v3

    if-ne v2, v3, :cond_4

    :cond_2
    iget-object v2, p0, Lcom/vkontakte/android/RepostActivity;->post:Lcom/vkontakte/android/NewsEntry;

    iget v2, v2, Lcom/vkontakte/android/NewsEntry;->type:I

    if-ne v2, v4, :cond_3

    iget-object v2, p0, Lcom/vkontakte/android/RepostActivity;->post:Lcom/vkontakte/android/NewsEntry;

    iget v2, v2, Lcom/vkontakte/android/NewsEntry;->userID:I

    .line 64
    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v3

    invoke-virtual {v3}, Lcom/vkontakte/android/auth/VKAccount;->getUid()I

    move-result v3

    if-ne v2, v3, :cond_4

    :cond_3
    iget-object v2, p0, Lcom/vkontakte/android/RepostActivity;->post:Lcom/vkontakte/android/NewsEntry;

    iget v2, v2, Lcom/vkontakte/android/NewsEntry;->type:I

    if-ne v2, v7, :cond_5

    iget-object v2, p0, Lcom/vkontakte/android/RepostActivity;->post:Lcom/vkontakte/android/NewsEntry;

    iget v2, v2, Lcom/vkontakte/android/NewsEntry;->userID:I

    .line 65
    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v3

    invoke-virtual {v3}, Lcom/vkontakte/android/auth/VKAccount;->getUid()I

    move-result v3

    if-eq v2, v3, :cond_5

    .line 68
    :cond_4
    const v2, 0x7f0805cf

    invoke-virtual {p0, v2}, Lcom/vkontakte/android/RepostActivity;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 69
    const-string/jumbo v2, "me"

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 71
    :cond_5
    const v2, 0x7f0805c3

    invoke-virtual {p0, v2}, Lcom/vkontakte/android/RepostActivity;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 72
    const-string/jumbo v2, "group"

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 74
    :cond_6
    iget-object v2, p0, Lcom/vkontakte/android/RepostActivity;->post:Lcom/vkontakte/android/NewsEntry;

    iget v2, v2, Lcom/vkontakte/android/NewsEntry;->type:I

    if-eq v2, v4, :cond_7

    .line 75
    const v2, 0x7f0805c4

    invoke-virtual {p0, v2}, Lcom/vkontakte/android/RepostActivity;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 76
    const-string/jumbo v2, "msg"

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 79
    :cond_7
    new-instance v2, Landroid/view/View;

    invoke-direct {v2, p0}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    invoke-virtual {p0, v2}, Lcom/vkontakte/android/RepostActivity;->setContentView(Landroid/view/View;)V

    .line 81
    invoke-virtual {p0}, Lcom/vkontakte/android/RepostActivity;->getIntent()Landroid/content/Intent;

    move-result-object v2

    const-string/jumbo v3, "msg"

    invoke-virtual {v2, v3}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_8

    .line 82
    invoke-direct {p0}, Lcom/vkontakte/android/RepostActivity;->startChatChooser()V

    .line 115
    :goto_0
    return-void

    .line 86
    :cond_8
    new-instance v3, Lcom/vkontakte/android/VKAlertDialog$Builder;

    invoke-direct {v3, p0}, Lcom/vkontakte/android/VKAlertDialog$Builder;-><init>(Landroid/content/Context;)V

    iget-object v2, p0, Lcom/vkontakte/android/RepostActivity;->post:Lcom/vkontakte/android/NewsEntry;

    iget v2, v2, Lcom/vkontakte/android/NewsEntry;->type:I

    if-ne v2, v4, :cond_9

    const v2, 0x7f0805c2

    .line 87
    :goto_1
    invoke-virtual {v3, v2}, Lcom/vkontakte/android/VKAlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v3

    .line 88
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v2

    new-array v2, v2, [Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v2

    check-cast v2, [Ljava/lang/CharSequence;

    invoke-static {p0, v0}, Lcom/vkontakte/android/RepostActivity$$Lambda$1;->lambdaFactory$(Lcom/vkontakte/android/RepostActivity;Ljava/util/ArrayList;)Landroid/content/DialogInterface$OnClickListener;

    move-result-object v4

    invoke-virtual {v3, v2, v4}, Landroid/app/AlertDialog$Builder;->setItems([Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    invoke-static {p0}, Lcom/vkontakte/android/RepostActivity$$Lambda$2;->lambdaFactory$(Lcom/vkontakte/android/RepostActivity;)Landroid/content/DialogInterface$OnCancelListener;

    move-result-object v3

    .line 114
    invoke-virtual {v2, v3}, Landroid/app/AlertDialog$Builder;->setOnCancelListener(Landroid/content/DialogInterface$OnCancelListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    invoke-virtual {v2}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    goto :goto_0

    .line 86
    :cond_9
    const v2, 0x7f0805c1

    goto :goto_1
.end method

.method protected onDestroy()V
    .locals 1

    .prologue
    .line 119
    iget-object v0, p0, Lcom/vkontakte/android/RepostActivity;->logoutReceiver:Lcom/vkontakte/android/activities/LogoutReceiver;

    invoke-virtual {v0}, Lcom/vkontakte/android/activities/LogoutReceiver;->unregister()V

    .line 120
    invoke-super {p0}, Landroid/app/Activity;->onDestroy()V

    .line 121
    return-void
.end method

.method public onPause()V
    .locals 0

    .prologue
    .line 312
    invoke-super {p0}, Landroid/app/Activity;->onPause()V

    .line 313
    invoke-static {}, Lcom/vkontakte/android/AppStateTracker;->onActivityPaused()V

    .line 314
    return-void
.end method

.method public onResume()V
    .locals 0

    .prologue
    .line 307
    invoke-super {p0}, Landroid/app/Activity;->onResume()V

    .line 308
    invoke-static {p0}, Lcom/vkontakte/android/AppStateTracker;->onActivityResumed(Landroid/app/Activity;)V

    .line 309
    return-void
.end method

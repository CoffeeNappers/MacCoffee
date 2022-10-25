.class public Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem;
.super Lcom/vkontakte/android/ui/posts/PostDisplayItem;
.source "HeaderPostDisplayItem.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem$ViewHolder;,
        Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem$SubscribeClickListener;
    }
.end annotation


# instance fields
.field public fromList:Z

.field public listPosition:I

.field public menuClickListener:Landroid/view/View$OnClickListener;

.field private photoOnClick:Landroid/view/View$OnClickListener;

.field public photosMode:Z

.field public post:Lcom/vkontakte/android/NewsEntry;

.field public referrer:Ljava/lang/String;

.field public showMenu:Z

.field private final subscribeClickListener:Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem$SubscribeClickListener;


# direct methods
.method public constructor <init>(Lcom/vkontakte/android/NewsEntry;ZZLjava/lang/String;ILcom/vkontakte/android/data/PostInteract;)V
    .locals 2
    .param p1, "_post"    # Lcom/vkontakte/android/NewsEntry;
    .param p2, "_photosMode"    # Z
    .param p3, "_list"    # Z
    .param p4, "_referrer"    # Ljava/lang/String;
    .param p5, "_listPosition"    # I
    .param p6, "postInteract"    # Lcom/vkontakte/android/data/PostInteract;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 62
    invoke-direct {p0, p1}, Lcom/vkontakte/android/ui/posts/PostDisplayItem;-><init>(Lcom/vkontakte/android/NewsEntry;)V

    .line 50
    new-instance v0, Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem$SubscribeClickListener;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem$SubscribeClickListener;-><init>(Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem;Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem$1;)V

    iput-object v0, p0, Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem;->subscribeClickListener:Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem$SubscribeClickListener;

    .line 53
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem;->showMenu:Z

    .line 63
    iput-boolean p2, p0, Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem;->photosMode:Z

    .line 64
    iput-object p1, p0, Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem;->post:Lcom/vkontakte/android/NewsEntry;

    .line 65
    iput-boolean p3, p0, Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem;->fromList:Z

    .line 66
    iput-object p4, p0, Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem;->referrer:Ljava/lang/String;

    .line 67
    iput p5, p0, Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem;->listPosition:I

    .line 68
    invoke-static {p0, p6}, Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem$$Lambda$1;->lambdaFactory$(Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem;Lcom/vkontakte/android/data/PostInteract;)Landroid/view/View$OnClickListener;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem;->photoOnClick:Landroid/view/View$OnClickListener;

    .line 77
    return-void
.end method

.method static synthetic access$200(Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem;Landroid/content/Context;ILcom/vkontakte/android/functions/F0;)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem;
    .param p1, "x1"    # Landroid/content/Context;
    .param p2, "x2"    # I
    .param p3, "x3"    # Lcom/vkontakte/android/functions/F0;

    .prologue
    .line 48
    invoke-direct {p0, p1, p2, p3}, Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem;->doAddFriend(Landroid/content/Context;ILcom/vkontakte/android/functions/F0;)V

    return-void
.end method

.method static synthetic access$300(Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem;Landroid/content/Context;ILcom/vkontakte/android/functions/F0;)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem;
    .param p1, "x1"    # Landroid/content/Context;
    .param p2, "x2"    # I
    .param p3, "x3"    # Lcom/vkontakte/android/functions/F0;

    .prologue
    .line 48
    invoke-direct {p0, p1, p2, p3}, Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem;->joinGroup(Landroid/content/Context;ILcom/vkontakte/android/functions/F0;)V

    return-void
.end method

.method static synthetic access$400(Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem;Landroid/view/View;Lcom/vkontakte/android/functions/F0;)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem;
    .param p1, "x1"    # Landroid/view/View;
    .param p2, "x2"    # Lcom/vkontakte/android/functions/F0;

    .prologue
    .line 48
    invoke-direct {p0, p1, p2}, Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem;->showUnSubscribeMenu(Landroid/view/View;Lcom/vkontakte/android/functions/F0;)V

    return-void
.end method

.method public static createView(Landroid/content/Context;)Landroid/view/View;
    .locals 1
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 112
    const v0, 0x7f030161

    invoke-static {p0, v0}, Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem;->createView(Landroid/content/Context;I)Landroid/view/View;

    move-result-object v0

    return-object v0
.end method

.method private static createView(Landroid/content/Context;I)Landroid/view/View;
    .locals 3
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "res"    # I
        .annotation build Landroid/support/annotation/LayoutRes;
        .end annotation
    .end param

    .prologue
    const/4 v2, 0x0

    .line 95
    invoke-static {p0, p1, v2}, Landroid/view/View;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v1

    .line 96
    .local v1, "view":Landroid/view/View;
    new-instance v0, Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem$ViewHolder;

    invoke-direct {v0, v2}, Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem$ViewHolder;-><init>(Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem$1;)V

    .line 97
    .local v0, "holder":Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem$ViewHolder;
    const v2, 0x7f100407

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    iput-object v2, v0, Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem$ViewHolder;->name:Landroid/widget/TextView;

    .line 98
    const v2, 0x7f100408

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    iput-object v2, v0, Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem$ViewHolder;->time:Landroid/widget/TextView;

    .line 99
    const v2, 0x7f100405

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Lcom/vk/imageloader/view/VKImageView;

    iput-object v2, v0, Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem$ViewHolder;->photo:Lcom/vk/imageloader/view/VKImageView;

    .line 100
    const v2, 0x7f100400

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    iput-object v2, v0, Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem$ViewHolder;->menuBtn:Landroid/view/View;

    .line 101
    const v2, 0x7f100409

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/ImageView;

    iput-object v2, v0, Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem$ViewHolder;->subscribeBtn:Landroid/widget/ImageView;

    .line 102
    const v2, 0x7f10040a

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    iput-object v2, v0, Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem$ViewHolder;->unSubscribeBtn:Landroid/view/View;

    .line 103
    const v2, 0x7f10040c

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    iput-object v2, v0, Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem$ViewHolder;->adsTitle:Landroid/widget/TextView;

    .line 104
    const v2, 0x7f10040e

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    iput-object v2, v0, Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem$ViewHolder;->adsAction:Landroid/widget/TextView;

    .line 105
    const v2, 0x7f10040d

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    iput-object v2, v0, Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem$ViewHolder;->ageRestriction:Landroid/widget/TextView;

    .line 106
    const v2, 0x7f100406

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    iput-object v2, v0, Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem$ViewHolder;->profileBtn:Landroid/view/View;

    .line 107
    invoke-virtual {v1, v0}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 108
    return-object v1
.end method

.method public static createViewAd(Landroid/content/Context;)Landroid/view/View;
    .locals 1
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 116
    const v0, 0x7f030162

    invoke-static {p0, v0}, Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem;->createView(Landroid/content/Context;I)Landroid/view/View;

    move-result-object v0

    return-object v0
.end method

.method public static createViewRecommended(Landroid/content/Context;)Landroid/view/View;
    .locals 1
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 120
    const v0, 0x7f030163

    invoke-static {p0, v0}, Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem;->createView(Landroid/content/Context;I)Landroid/view/View;

    move-result-object v0

    return-object v0
.end method

.method private doAddFriend(Landroid/content/Context;ILcom/vkontakte/android/functions/F0;)V
    .locals 3
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "uid"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "I",
            "Lcom/vkontakte/android/functions/F0",
            "<",
            "Ljava/lang/Void;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 275
    .local p3, "showUnSubscribe":Lcom/vkontakte/android/functions/F0;, "Lcom/vkontakte/android/functions/F0<Ljava/lang/Void;>;"
    const-string/jumbo v0, "subscription_from_post"

    invoke-static {v0}, Lcom/vkontakte/android/data/Analytics;->track(Ljava/lang/String;)Lcom/vkontakte/android/data/Analytics$EventBuilder;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vkontakte/android/data/Analytics$EventBuilder;->collapse()Lcom/vkontakte/android/data/Analytics$EventBuilder;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vkontakte/android/data/Analytics$EventBuilder;->unique()Lcom/vkontakte/android/data/Analytics$EventBuilder;

    move-result-object v0

    const-string/jumbo v1, "post_ids"

    iget v2, p0, Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem;->postID:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/vkontakte/android/data/Analytics$EventBuilder;->addParam(Ljava/lang/String;Ljava/lang/Object;)Lcom/vkontakte/android/data/Analytics$EventBuilder;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vkontakte/android/data/Analytics$EventBuilder;->commit()Lcom/vkontakte/android/data/Analytics$EventBuilder;

    .line 276
    const/4 v0, 0x0

    invoke-static {p2, v0}, Lcom/vkontakte/android/api/friends/FriendsAdd;->createFriendsAddAndSendAllStats(ILjava/lang/String;)Lcom/vkontakte/android/api/friends/FriendsAdd;

    move-result-object v0

    new-instance v1, Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem$1;

    invoke-direct {v1, p0, p3, p2, p1}, Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem$1;-><init>(Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem;Lcom/vkontakte/android/functions/F0;ILandroid/content/Context;)V

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/friends/FriendsAdd;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    .line 307
    invoke-virtual {v0, p1}, Lcom/vkontakte/android/api/VKAPIRequest;->wrapProgress(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/vkontakte/android/api/VKAPIRequest;->exec(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 308
    return-void
.end method

.method private doLeaveGroup(Landroid/content/Context;ILcom/vkontakte/android/functions/F0;)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "uid"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "I",
            "Lcom/vkontakte/android/functions/F0",
            "<",
            "Ljava/lang/Void;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 351
    .local p3, "showSubscribe":Lcom/vkontakte/android/functions/F0;, "Lcom/vkontakte/android/functions/F0<Ljava/lang/Void;>;"
    new-instance v0, Lcom/vkontakte/android/api/groups/GroupsLeave;

    invoke-direct {v0, p2}, Lcom/vkontakte/android/api/groups/GroupsLeave;-><init>(I)V

    new-instance v1, Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem$4;

    invoke-direct {v1, p0, p1, p3, p1}, Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem$4;-><init>(Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem;Landroid/content/Context;Lcom/vkontakte/android/functions/F0;Landroid/content/Context;)V

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/groups/GroupsLeave;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    .line 366
    invoke-virtual {v0, p1}, Lcom/vkontakte/android/api/VKAPIRequest;->wrapProgress(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/vkontakte/android/api/VKAPIRequest;->exec(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 367
    return-void
.end method

.method private doRemoveFriend(Landroid/content/Context;ILcom/vkontakte/android/functions/F0;)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "uid"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "I",
            "Lcom/vkontakte/android/functions/F0",
            "<",
            "Ljava/lang/Void;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 311
    .local p3, "showSubscribe":Lcom/vkontakte/android/functions/F0;, "Lcom/vkontakte/android/functions/F0<Ljava/lang/Void;>;"
    new-instance v0, Lcom/vkontakte/android/api/friends/FriendsDelete;

    invoke-direct {v0, p2}, Lcom/vkontakte/android/api/friends/FriendsDelete;-><init>(I)V

    new-instance v1, Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem$2;

    invoke-direct {v1, p0, p3, p2, p1}, Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem$2;-><init>(Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem;Lcom/vkontakte/android/functions/F0;ILandroid/content/Context;)V

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/friends/FriendsDelete;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    .line 327
    invoke-virtual {v0, p1}, Lcom/vkontakte/android/api/VKAPIRequest;->wrapProgress(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/vkontakte/android/api/VKAPIRequest;->exec(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 328
    return-void
.end method

.method private joinGroup(Landroid/content/Context;ILcom/vkontakte/android/functions/F0;)V
    .locals 3
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "uid"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "I",
            "Lcom/vkontakte/android/functions/F0",
            "<",
            "Ljava/lang/Void;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 331
    .local p3, "showUnSubscribe":Lcom/vkontakte/android/functions/F0;, "Lcom/vkontakte/android/functions/F0<Ljava/lang/Void;>;"
    const-string/jumbo v0, "subscription_from_post"

    invoke-static {v0}, Lcom/vkontakte/android/data/Analytics;->track(Ljava/lang/String;)Lcom/vkontakte/android/data/Analytics$EventBuilder;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vkontakte/android/data/Analytics$EventBuilder;->collapse()Lcom/vkontakte/android/data/Analytics$EventBuilder;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vkontakte/android/data/Analytics$EventBuilder;->unique()Lcom/vkontakte/android/data/Analytics$EventBuilder;

    move-result-object v0

    const-string/jumbo v1, "post_ids"

    iget v2, p0, Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem;->postID:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/vkontakte/android/data/Analytics$EventBuilder;->addParam(Ljava/lang/String;Ljava/lang/Object;)Lcom/vkontakte/android/data/Analytics$EventBuilder;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vkontakte/android/data/Analytics$EventBuilder;->commit()Lcom/vkontakte/android/data/Analytics$EventBuilder;

    .line 332
    const/4 v0, 0x0

    invoke-static {p2, v0}, Lcom/vkontakte/android/api/groups/GroupsJoin;->createGroupsJoinAndSendAllStats(IZ)Lcom/vkontakte/android/api/groups/GroupsJoin;

    move-result-object v0

    new-instance v1, Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem$3;

    invoke-direct {v1, p0, p1, p3, p1}, Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem$3;-><init>(Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem;Landroid/content/Context;Lcom/vkontakte/android/functions/F0;Landroid/content/Context;)V

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/groups/GroupsJoin;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    .line 347
    invoke-virtual {v0, p1}, Lcom/vkontakte/android/api/VKAPIRequest;->wrapProgress(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/vkontakte/android/api/VKAPIRequest;->exec(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 348
    return-void
.end method

.method private showUnSubscribeMenu(Landroid/view/View;Lcom/vkontakte/android/functions/F0;)V
    .locals 5
    .param p1, "anchorView"    # Landroid/view/View;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/view/View;",
            "Lcom/vkontakte/android/functions/F0",
            "<",
            "Ljava/lang/Void;",
            ">;)V"
        }
    .end annotation

    .prologue
    .local p2, "showSubscribe":Lcom/vkontakte/android/functions/F0;, "Lcom/vkontakte/android/functions/F0<Ljava/lang/Void;>;"
    const/4 v4, 0x0

    .line 371
    iget-object v3, p0, Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem;->post:Lcom/vkontakte/android/NewsEntry;

    iget v3, v3, Lcom/vkontakte/android/NewsEntry;->ownerID:I

    if-gez v3, :cond_1

    .line 372
    iget-object v3, p0, Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem;->post:Lcom/vkontakte/android/NewsEntry;

    iget v3, v3, Lcom/vkontakte/android/NewsEntry;->ownerID:I

    neg-int v3, v3

    invoke-static {v3}, Lcom/vkontakte/android/data/Groups;->getById(I)Lcom/vkontakte/android/api/Group;

    move-result-object v0

    .line 373
    .local v0, "group":Lcom/vkontakte/android/api/Group;
    if-eqz v0, :cond_0

    iget v3, v0, Lcom/vkontakte/android/api/Group;->isClosed:I

    if-eqz v3, :cond_0

    const v2, 0x7f08032c

    .line 377
    .end local v0    # "group":Lcom/vkontakte/android/api/Group;
    .local v2, "unSubscribeTitle":I
    :goto_0
    new-instance v1, Landroid/support/v7/widget/PopupMenu;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-direct {v1, v3, p1}, Landroid/support/v7/widget/PopupMenu;-><init>(Landroid/content/Context;Landroid/view/View;)V

    .line 378
    .local v1, "menu":Landroid/support/v7/widget/PopupMenu;
    invoke-virtual {v1}, Landroid/support/v7/widget/PopupMenu;->getMenu()Landroid/view/Menu;

    move-result-object v3

    invoke-interface {v3, v4, v4, v4, v2}, Landroid/view/Menu;->add(IIII)Landroid/view/MenuItem;

    .line 379
    invoke-static {p0, p1, p2}, Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem$$Lambda$3;->lambdaFactory$(Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem;Landroid/view/View;Lcom/vkontakte/android/functions/F0;)Landroid/support/v7/widget/PopupMenu$OnMenuItemClickListener;

    move-result-object v3

    invoke-virtual {v1, v3}, Landroid/support/v7/widget/PopupMenu;->setOnMenuItemClickListener(Landroid/support/v7/widget/PopupMenu$OnMenuItemClickListener;)V

    .line 387
    invoke-virtual {v1}, Landroid/support/v7/widget/PopupMenu;->show()V

    .line 388
    return-void

    .line 373
    .end local v1    # "menu":Landroid/support/v7/widget/PopupMenu;
    .end local v2    # "unSubscribeTitle":I
    .restart local v0    # "group":Lcom/vkontakte/android/api/Group;
    :cond_0
    const v2, 0x7f080584

    goto :goto_0

    .line 375
    .end local v0    # "group":Lcom/vkontakte/android/api/Group;
    :cond_1
    const v2, 0x7f080556

    .restart local v2    # "unSubscribeTitle":I
    goto :goto_0
.end method


# virtual methods
.method public getImageCount()I
    .locals 1

    .prologue
    .line 91
    const/4 v0, 0x1

    return v0
.end method

.method public getImageURL(I)Ljava/lang/String;
    .locals 1
    .param p1, "image"    # I

    .prologue
    .line 271
    iget-object v0, p0, Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem;->post:Lcom/vkontakte/android/NewsEntry;

    iget-object v0, v0, Lcom/vkontakte/android/NewsEntry;->userPhotoURL:Ljava/lang/String;

    return-object v0
.end method

.method public getType()I
    .locals 2

    .prologue
    const/16 v0, 0xc

    .line 81
    iget-object v1, p0, Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem;->post:Lcom/vkontakte/android/NewsEntry;

    iget-object v1, v1, Lcom/vkontakte/android/NewsEntry;->captionText:Ljava/lang/CharSequence;

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem;->post:Lcom/vkontakte/android/NewsEntry;

    iget-object v1, v1, Lcom/vkontakte/android/NewsEntry;->captionText:Ljava/lang/CharSequence;

    invoke-interface {v1}, Ljava/lang/CharSequence;->length()I

    move-result v1

    if-lez v1, :cond_1

    .line 82
    const/16 v0, 0x14

    .line 84
    :cond_0
    :goto_0
    return v0

    :cond_1
    iget-object v1, p0, Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem;->post:Lcom/vkontakte/android/NewsEntry;

    iget v1, v1, Lcom/vkontakte/android/NewsEntry;->type:I

    if-eq v1, v0, :cond_0

    const/4 v0, 0x0

    goto :goto_0
.end method

.method synthetic lambda$new$0(Lcom/vkontakte/android/data/PostInteract;Landroid/view/View;)V
    .locals 3
    .param p1, "postInteract"    # Lcom/vkontakte/android/data/PostInteract;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "v"    # Landroid/view/View;

    .prologue
    .line 69
    new-instance v0, Lcom/vkontakte/android/fragments/ProfileFragment$Builder;

    iget-object v1, p0, Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem;->post:Lcom/vkontakte/android/NewsEntry;

    iget v1, v1, Lcom/vkontakte/android/NewsEntry;->userID:I

    invoke-direct {v0, v1}, Lcom/vkontakte/android/fragments/ProfileFragment$Builder;-><init>(I)V

    iget-object v1, p0, Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem;->post:Lcom/vkontakte/android/NewsEntry;

    iget v1, v1, Lcom/vkontakte/android/NewsEntry;->ownerID:I

    iget-object v2, p0, Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem;->post:Lcom/vkontakte/android/NewsEntry;

    iget v2, v2, Lcom/vkontakte/android/NewsEntry;->postID:I

    invoke-virtual {v0, v1, v2}, Lcom/vkontakte/android/fragments/ProfileFragment$Builder;->setFromPost(II)Lcom/vkontakte/android/fragments/ProfileFragment$Builder;

    move-result-object v0

    invoke-virtual {p2}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/fragments/ProfileFragment$Builder;->go(Landroid/content/Context;)Z

    .line 71
    iget-object v0, p0, Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem;->post:Lcom/vkontakte/android/NewsEntry;

    iget v0, v0, Lcom/vkontakte/android/NewsEntry;->userID:I

    if-lez v0, :cond_0

    .line 72
    sget-object v0, Lcom/vkontakte/android/data/PostInteract$Type;->open_user:Lcom/vkontakte/android/data/PostInteract$Type;

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/data/PostInteract;->commit(Lcom/vkontakte/android/data/PostInteract$Type;)V

    .line 76
    :goto_0
    return-void

    .line 74
    :cond_0
    sget-object v0, Lcom/vkontakte/android/data/PostInteract$Type;->open_group:Lcom/vkontakte/android/data/PostInteract$Type;

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/data/PostInteract;->commit(Lcom/vkontakte/android/data/PostInteract$Type;)V

    goto :goto_0
.end method

.method synthetic lambda$onBindView$1(Landroid/view/View;)V
    .locals 2
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 189
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    iget-object v1, p0, Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem;->post:Lcom/vkontakte/android/NewsEntry;

    iget-object v1, v1, Lcom/vkontakte/android/NewsEntry;->captionActionUrl:Ljava/lang/CharSequence;

    invoke-interface {v1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/vkontakte/android/audio/utils/Utils;->openLink(Landroid/content/Context;Ljava/lang/String;)V

    return-void
.end method

.method synthetic lambda$showUnSubscribeMenu$2(Landroid/view/View;Lcom/vkontakte/android/functions/F0;Landroid/view/MenuItem;)Z
    .locals 2
    .param p1, "anchorView"    # Landroid/view/View;
    .param p2, "showSubscribe"    # Lcom/vkontakte/android/functions/F0;
    .param p3, "mi"    # Landroid/view/MenuItem;

    .prologue
    .line 380
    iget-object v0, p0, Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem;->post:Lcom/vkontakte/android/NewsEntry;

    iget v0, v0, Lcom/vkontakte/android/NewsEntry;->ownerID:I

    if-gez v0, :cond_0

    .line 381
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    iget-object v1, p0, Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem;->post:Lcom/vkontakte/android/NewsEntry;

    iget v1, v1, Lcom/vkontakte/android/NewsEntry;->ownerID:I

    neg-int v1, v1

    invoke-direct {p0, v0, v1, p2}, Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem;->doLeaveGroup(Landroid/content/Context;ILcom/vkontakte/android/functions/F0;)V

    .line 385
    :goto_0
    const/4 v0, 0x1

    return v0

    .line 383
    :cond_0
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    iget-object v1, p0, Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem;->post:Lcom/vkontakte/android/NewsEntry;

    iget v1, v1, Lcom/vkontakte/android/NewsEntry;->ownerID:I

    invoke-direct {p0, v0, v1, p2}, Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem;->doRemoveFriend(Landroid/content/Context;ILcom/vkontakte/android/functions/F0;)V

    goto :goto_0
.end method

.method public onBindView(Landroid/view/View;)V
    .locals 33
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 125
    const-string/jumbo v13, ""

    .line 126
    .local v13, "infoHtml":Ljava/lang/CharSequence;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem;->post:Lcom/vkontakte/android/NewsEntry;

    move-object/from16 v26, v0

    move-object/from16 v0, v26

    iget-object v14, v0, Lcom/vkontakte/android/NewsEntry;->userName:Ljava/lang/String;

    .line 127
    .local v14, "name":Ljava/lang/CharSequence;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem;->post:Lcom/vkontakte/android/NewsEntry;

    move-object/from16 v26, v0

    move-object/from16 v0, v26

    iget v0, v0, Lcom/vkontakte/android/NewsEntry;->type:I

    move/from16 v26, v0

    const/16 v27, 0x7

    move/from16 v0, v26

    move/from16 v1, v27

    if-ne v0, v1, :cond_10

    .line 128
    new-instance v27, Ljava/lang/StringBuilder;

    invoke-direct/range {v27 .. v27}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual/range {p1 .. p1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v28

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem;->post:Lcom/vkontakte/android/NewsEntry;

    move-object/from16 v26, v0

    move-object/from16 v0, v26

    iget-boolean v0, v0, Lcom/vkontakte/android/NewsEntry;->f:Z

    move/from16 v26, v0

    if-eqz v26, :cond_f

    const v26, 0x7f0d0045

    :goto_0
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem;->post:Lcom/vkontakte/android/NewsEntry;

    move-object/from16 v29, v0

    move-object/from16 v0, v29

    iget v0, v0, Lcom/vkontakte/android/NewsEntry;->postID:I

    move/from16 v29, v0

    const/16 v30, 0x1

    move/from16 v0, v30

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v30, v0

    const/16 v31, 0x0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem;->post:Lcom/vkontakte/android/NewsEntry;

    move-object/from16 v32, v0

    move-object/from16 v0, v32

    iget v0, v0, Lcom/vkontakte/android/NewsEntry;->postID:I

    move/from16 v32, v0

    invoke-static/range {v32 .. v32}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v32

    aput-object v32, v30, v31

    move-object/from16 v0, v28

    move/from16 v1, v26

    move/from16 v2, v29

    move-object/from16 v3, v30

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/res/Resources;->getQuantityString(II[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v26

    move-object/from16 v0, v27

    move-object/from16 v1, v26

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v26

    const-string/jumbo v27, ", "

    invoke-virtual/range {v26 .. v27}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v26

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem;->post:Lcom/vkontakte/android/NewsEntry;

    move-object/from16 v27, v0

    move-object/from16 v0, v27

    iget v0, v0, Lcom/vkontakte/android/NewsEntry;->time:I

    move/from16 v27, v0

    invoke-virtual/range {p1 .. p1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v28

    invoke-static/range {v27 .. v28}, Lcom/vkontakte/android/TimeUtils;->langDateRelative(ILandroid/content/res/Resources;)Ljava/lang/String;

    move-result-object v27

    invoke-virtual/range {v26 .. v27}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v26

    invoke-virtual/range {v26 .. v26}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    .line 140
    :goto_1
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem;->post:Lcom/vkontakte/android/NewsEntry;

    move-object/from16 v26, v0

    move-object/from16 v0, v26

    iget v0, v0, Lcom/vkontakte/android/NewsEntry;->type:I

    move/from16 v26, v0

    const/16 v27, 0x5

    move/from16 v0, v26

    move/from16 v1, v27

    if-ne v0, v1, :cond_0

    .line 141
    new-instance v26, Ljava/lang/StringBuilder;

    invoke-direct/range {v26 .. v26}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v26

    invoke-virtual {v0, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v26

    const-string/jumbo v27, " "

    invoke-virtual/range {v26 .. v27}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v26

    invoke-virtual/range {p1 .. p1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v27

    const v28, 0x7f080471

    invoke-virtual/range {v27 .. v28}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v27

    invoke-virtual/range {v26 .. v27}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v26

    invoke-virtual/range {v26 .. v26}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    .line 144
    :cond_0
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem;->photosMode:Z

    move/from16 v26, v0

    if-nez v26, :cond_1

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem;->post:Lcom/vkontakte/android/NewsEntry;

    move-object/from16 v26, v0

    move-object/from16 v0, v26

    iget v0, v0, Lcom/vkontakte/android/NewsEntry;->type:I

    move/from16 v26, v0

    const/16 v27, 0x1

    move/from16 v0, v26

    move/from16 v1, v27

    if-ne v0, v1, :cond_1

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem;->post:Lcom/vkontakte/android/NewsEntry;

    move-object/from16 v26, v0

    move-object/from16 v0, v26

    iget-object v0, v0, Lcom/vkontakte/android/NewsEntry;->extra:Landroid/os/Bundle;

    move-object/from16 v26, v0

    const-string/jumbo v27, "converted_to_photo"

    invoke-virtual/range {v26 .. v27}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v26

    if-eqz v26, :cond_1

    .line 145
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem;->post:Lcom/vkontakte/android/NewsEntry;

    move-object/from16 v26, v0

    move-object/from16 v0, v26

    iget-object v0, v0, Lcom/vkontakte/android/NewsEntry;->extra:Landroid/os/Bundle;

    move-object/from16 v26, v0

    const-string/jumbo v27, "orig_type"

    invoke-virtual/range {v26 .. v27}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v26

    const/16 v27, 0x6

    move/from16 v0, v26

    move/from16 v1, v27

    if-ne v0, v1, :cond_14

    .line 146
    new-instance v26, Ljava/lang/StringBuilder;

    invoke-direct/range {v26 .. v26}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual/range {p1 .. p1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v27

    const v28, 0x7f0d0044

    const/16 v29, 0x1

    const/16 v30, 0x1

    move/from16 v0, v30

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v30, v0

    const/16 v31, 0x0

    const/16 v32, 0x1

    invoke-static/range {v32 .. v32}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v32

    aput-object v32, v30, v31

    invoke-virtual/range {v27 .. v30}, Landroid/content/res/Resources;->getQuantityString(II[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v27

    invoke-virtual/range {v26 .. v27}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v26

    const-string/jumbo v27, ", "

    invoke-virtual/range {v26 .. v27}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v26

    move-object/from16 v0, v26

    invoke-virtual {v0, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v26

    invoke-virtual/range {v26 .. v26}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    .line 152
    :cond_1
    :goto_2
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem;->post:Lcom/vkontakte/android/NewsEntry;

    move-object/from16 v26, v0

    const/16 v27, 0x200

    invoke-virtual/range {v26 .. v27}, Lcom/vkontakte/android/NewsEntry;->flag(I)Z

    move-result v26

    if-nez v26, :cond_2

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem;->post:Lcom/vkontakte/android/NewsEntry;

    move-object/from16 v26, v0

    const/16 v27, 0x400

    invoke-virtual/range {v26 .. v27}, Lcom/vkontakte/android/NewsEntry;->flag(I)Z

    move-result v26

    if-eqz v26, :cond_3

    .line 153
    :cond_2
    new-instance v6, Landroid/text/SpannableStringBuilder;

    new-instance v26, Ljava/lang/StringBuilder;

    invoke-direct/range {v26 .. v26}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v26

    invoke-virtual {v0, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v26

    const-string/jumbo v27, ""

    invoke-virtual/range {v26 .. v27}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v26

    invoke-virtual/range {v26 .. v26}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v26

    move-object/from16 v0, v26

    invoke-direct {v6, v0}, Landroid/text/SpannableStringBuilder;-><init>(Ljava/lang/CharSequence;)V

    .line 154
    .local v6, "bldr":Landroid/text/SpannableStringBuilder;
    invoke-static {}, Landroid/text/Spannable$Factory;->getInstance()Landroid/text/Spannable$Factory;

    move-result-object v26

    const-string/jumbo v27, "F"

    invoke-virtual/range {v26 .. v27}, Landroid/text/Spannable$Factory;->newSpannable(Ljava/lang/CharSequence;)Landroid/text/Spannable;

    move-result-object v22

    .line 155
    .local v22, "sp":Landroid/text/Spannable;
    invoke-virtual/range {p1 .. p1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v27

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem;->post:Lcom/vkontakte/android/NewsEntry;

    move-object/from16 v26, v0

    const/16 v28, 0x200

    move-object/from16 v0, v26

    move/from16 v1, v28

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/NewsEntry;->flag(I)Z

    move-result v26

    if-eqz v26, :cond_16

    const v26, 0x7f02024b

    :goto_3
    move-object/from16 v0, v27

    move/from16 v1, v26

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v9

    .line 156
    .local v9, "d":Landroid/graphics/drawable/Drawable;
    const/16 v26, 0x0

    const/16 v27, 0x0

    invoke-virtual {v9}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v28

    invoke-virtual {v9}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v29

    move/from16 v0, v26

    move/from16 v1, v27

    move/from16 v2, v28

    move/from16 v3, v29

    invoke-virtual {v9, v0, v1, v2, v3}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 157
    new-instance v26, Landroid/text/style/ImageSpan;

    const/16 v27, 0x0

    move-object/from16 v0, v26

    move/from16 v1, v27

    invoke-direct {v0, v9, v1}, Landroid/text/style/ImageSpan;-><init>(Landroid/graphics/drawable/Drawable;I)V

    const/16 v27, 0x0

    const/16 v28, 0x1

    const/16 v29, 0x0

    move-object/from16 v0, v22

    move-object/from16 v1, v26

    move/from16 v2, v27

    move/from16 v3, v28

    move/from16 v4, v29

    invoke-interface {v0, v1, v2, v3, v4}, Landroid/text/Spannable;->setSpan(Ljava/lang/Object;III)V

    .line 158
    const-string/jumbo v26, " "

    move-object/from16 v0, v26

    invoke-virtual {v6, v0}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 159
    move-object/from16 v0, v22

    invoke-virtual {v6, v0}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 160
    move-object v14, v6

    .line 163
    .end local v6    # "bldr":Landroid/text/SpannableStringBuilder;
    .end local v9    # "d":Landroid/graphics/drawable/Drawable;
    .end local v22    # "sp":Landroid/text/Spannable;
    :cond_3
    invoke-virtual/range {p1 .. p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem$ViewHolder;

    .line 165
    .local v10, "holder":Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem$ViewHolder;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem;->post:Lcom/vkontakte/android/NewsEntry;

    move-object/from16 v26, v0

    invoke-virtual/range {v26 .. v26}, Lcom/vkontakte/android/NewsEntry;->getPlatformIconResource()I

    move-result v18

    .line 166
    .local v18, "platformIconResId":I
    if-eqz v18, :cond_4

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem;->post:Lcom/vkontakte/android/NewsEntry;

    move-object/from16 v26, v0

    const/16 v27, 0x20

    invoke-virtual/range {v26 .. v27}, Lcom/vkontakte/android/NewsEntry;->flag(I)Z

    move-result v26

    if-nez v26, :cond_4

    .line 167
    new-instance v6, Landroid/text/SpannableStringBuilder;

    invoke-direct {v6, v13}, Landroid/text/SpannableStringBuilder;-><init>(Ljava/lang/CharSequence;)V

    .line 168
    .restart local v6    # "bldr":Landroid/text/SpannableStringBuilder;
    invoke-static {}, Landroid/text/Spannable$Factory;->getInstance()Landroid/text/Spannable$Factory;

    move-result-object v26

    const-string/jumbo v27, "F"

    invoke-virtual/range {v26 .. v27}, Landroid/text/Spannable$Factory;->newSpannable(Ljava/lang/CharSequence;)Landroid/text/Spannable;

    move-result-object v22

    .line 169
    .restart local v22    # "sp":Landroid/text/Spannable;
    invoke-virtual/range {p1 .. p1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v26

    move-object/from16 v0, v26

    move/from16 v1, v18

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v9

    .line 170
    .restart local v9    # "d":Landroid/graphics/drawable/Drawable;
    const/16 v26, 0x0

    const/16 v27, 0x0

    invoke-virtual {v9}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v28

    invoke-virtual {v9}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v29

    move/from16 v0, v26

    move/from16 v1, v27

    move/from16 v2, v28

    move/from16 v3, v29

    invoke-virtual {v9, v0, v1, v2, v3}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 171
    new-instance v26, Landroid/text/style/ImageSpan;

    const/16 v27, 0x0

    move-object/from16 v0, v26

    move/from16 v1, v27

    invoke-direct {v0, v9, v1}, Landroid/text/style/ImageSpan;-><init>(Landroid/graphics/drawable/Drawable;I)V

    const/16 v27, 0x0

    const/16 v28, 0x1

    const/16 v29, 0x0

    move-object/from16 v0, v22

    move-object/from16 v1, v26

    move/from16 v2, v27

    move/from16 v3, v28

    move/from16 v4, v29

    invoke-interface {v0, v1, v2, v3, v4}, Landroid/text/Spannable;->setSpan(Ljava/lang/Object;III)V

    .line 172
    const-string/jumbo v26, " "

    move-object/from16 v0, v26

    invoke-virtual {v6, v0}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 173
    move-object/from16 v0, v22

    invoke-virtual {v6, v0}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 174
    move-object v13, v6

    .line 177
    .end local v6    # "bldr":Landroid/text/SpannableStringBuilder;
    .end local v9    # "d":Landroid/graphics/drawable/Drawable;
    .end local v22    # "sp":Landroid/text/Spannable;
    :cond_4
    iget-object v0, v10, Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem$ViewHolder;->adsTitle:Landroid/widget/TextView;

    move-object/from16 v26, v0

    if-eqz v26, :cond_17

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem;->post:Lcom/vkontakte/android/NewsEntry;

    move-object/from16 v26, v0

    move-object/from16 v0, v26

    iget-object v0, v0, Lcom/vkontakte/android/NewsEntry;->captionText:Ljava/lang/CharSequence;

    move-object/from16 v26, v0

    invoke-static/range {v26 .. v26}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v26

    if-nez v26, :cond_17

    .line 178
    iget-object v0, v10, Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem$ViewHolder;->adsTitle:Landroid/widget/TextView;

    move-object/from16 v26, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem;->post:Lcom/vkontakte/android/NewsEntry;

    move-object/from16 v27, v0

    move-object/from16 v0, v27

    iget-object v0, v0, Lcom/vkontakte/android/NewsEntry;->captionText:Ljava/lang/CharSequence;

    move-object/from16 v27, v0

    invoke-virtual/range {v26 .. v27}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 184
    :cond_5
    :goto_4
    iget-object v0, v10, Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem$ViewHolder;->adsAction:Landroid/widget/TextView;

    move-object/from16 v26, v0

    if-eqz v26, :cond_7

    .line 185
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem;->post:Lcom/vkontakte/android/NewsEntry;

    move-object/from16 v26, v0

    move-object/from16 v0, v26

    iget-object v0, v0, Lcom/vkontakte/android/NewsEntry;->captionActionUrl:Ljava/lang/CharSequence;

    move-object/from16 v26, v0

    invoke-static/range {v26 .. v26}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v26

    if-nez v26, :cond_18

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem;->post:Lcom/vkontakte/android/NewsEntry;

    move-object/from16 v26, v0

    move-object/from16 v0, v26

    iget-object v0, v0, Lcom/vkontakte/android/NewsEntry;->captionActionText:Ljava/lang/CharSequence;

    move-object/from16 v26, v0

    invoke-static/range {v26 .. v26}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v26

    if-nez v26, :cond_18

    const/16 v21, 0x1

    .line 186
    .local v21, "showAction":Z
    :goto_5
    iget-object v0, v10, Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem$ViewHolder;->adsAction:Landroid/widget/TextView;

    move-object/from16 v27, v0

    if-eqz v21, :cond_19

    const/16 v26, 0x0

    :goto_6
    move-object/from16 v0, v27

    move/from16 v1, v26

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setVisibility(I)V

    .line 187
    if-eqz v21, :cond_6

    .line 188
    iget-object v0, v10, Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem$ViewHolder;->adsAction:Landroid/widget/TextView;

    move-object/from16 v26, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem;->post:Lcom/vkontakte/android/NewsEntry;

    move-object/from16 v27, v0

    move-object/from16 v0, v27

    iget-object v0, v0, Lcom/vkontakte/android/NewsEntry;->captionActionText:Ljava/lang/CharSequence;

    move-object/from16 v27, v0

    invoke-virtual/range {v26 .. v27}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 189
    iget-object v0, v10, Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem$ViewHolder;->adsAction:Landroid/widget/TextView;

    move-object/from16 v26, v0

    invoke-static/range {p0 .. p0}, Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem$$Lambda$2;->lambdaFactory$(Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem;)Landroid/view/View$OnClickListener;

    move-result-object v27

    invoke-virtual/range {v26 .. v27}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 191
    :cond_6
    iget-object v0, v10, Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem$ViewHolder;->adsTitle:Landroid/widget/TextView;

    move-object/from16 v26, v0

    if-eqz v26, :cond_7

    .line 192
    iget-object v0, v10, Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem$ViewHolder;->adsTitle:Landroid/widget/TextView;

    move-object/from16 v26, v0

    invoke-virtual/range {v26 .. v26}, Landroid/widget/TextView;->getContext()Landroid/content/Context;

    move-result-object v26

    invoke-virtual/range {v26 .. v26}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v26

    const v27, 0x7f090027

    invoke-virtual/range {v26 .. v27}, Landroid/content/res/Resources;->getDimension(I)F

    move-result v26

    move/from16 v0, v26

    float-to-int v0, v0

    move/from16 v16, v0

    .line 193
    .local v16, "padding":I
    iget-object v0, v10, Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem$ViewHolder;->adsTitle:Landroid/widget/TextView;

    move-object/from16 v26, v0

    const/16 v27, 0x0

    const/16 v28, 0x0

    const/16 v29, 0x0

    move-object/from16 v0, v26

    move/from16 v1, v16

    move/from16 v2, v27

    move/from16 v3, v28

    move/from16 v4, v29

    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 197
    .end local v16    # "padding":I
    .end local v21    # "showAction":Z
    :cond_7
    iget-object v0, v10, Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem$ViewHolder;->subscribeBtn:Landroid/widget/ImageView;

    move-object/from16 v26, v0

    if-eqz v26, :cond_8

    .line 198
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem;->post:Lcom/vkontakte/android/NewsEntry;

    move-object/from16 v26, v0

    move-object/from16 v0, v26

    iget v0, v0, Lcom/vkontakte/android/NewsEntry;->ownerID:I

    move/from16 v26, v0

    if-lez v26, :cond_1a

    .line 199
    iget-object v0, v10, Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem$ViewHolder;->subscribeBtn:Landroid/widget/ImageView;

    move-object/from16 v26, v0

    const v27, 0x7f02026b

    invoke-virtual/range {v26 .. v27}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 204
    :goto_7
    iget-object v0, v10, Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem$ViewHolder;->subscribeBtn:Landroid/widget/ImageView;

    move-object/from16 v27, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem;->post:Lcom/vkontakte/android/NewsEntry;

    move-object/from16 v26, v0

    move-object/from16 v0, v26

    iget-object v0, v0, Lcom/vkontakte/android/NewsEntry;->suggestSubscribe:Ljava/lang/Boolean;

    move-object/from16 v26, v0

    if-eqz v26, :cond_1b

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem;->post:Lcom/vkontakte/android/NewsEntry;

    move-object/from16 v26, v0

    move-object/from16 v0, v26

    iget-object v0, v0, Lcom/vkontakte/android/NewsEntry;->suggestSubscribe:Ljava/lang/Boolean;

    move-object/from16 v26, v0

    invoke-virtual/range {v26 .. v26}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v26

    if-eqz v26, :cond_1b

    const/16 v26, 0x0

    :goto_8
    move-object/from16 v0, v27

    move/from16 v1, v26

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 205
    iget-object v0, v10, Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem$ViewHolder;->subscribeBtn:Landroid/widget/ImageView;

    move-object/from16 v26, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem;->subscribeClickListener:Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem$SubscribeClickListener;

    move-object/from16 v27, v0

    invoke-virtual/range {v26 .. v27}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 206
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem;->subscribeClickListener:Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem$SubscribeClickListener;

    move-object/from16 v26, v0

    iget-object v0, v10, Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem$ViewHolder;->subscribeBtn:Landroid/widget/ImageView;

    move-object/from16 v27, v0

    move-object/from16 v0, v27

    move-object/from16 v1, v26

    iput-object v0, v1, Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem$SubscribeClickListener;->subscribeButton:Landroid/view/View;

    .line 209
    :cond_8
    iget-object v0, v10, Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem$ViewHolder;->unSubscribeBtn:Landroid/view/View;

    move-object/from16 v26, v0

    if-eqz v26, :cond_9

    .line 210
    iget-object v0, v10, Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem$ViewHolder;->unSubscribeBtn:Landroid/view/View;

    move-object/from16 v27, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem;->post:Lcom/vkontakte/android/NewsEntry;

    move-object/from16 v26, v0

    move-object/from16 v0, v26

    iget-object v0, v0, Lcom/vkontakte/android/NewsEntry;->suggestSubscribe:Ljava/lang/Boolean;

    move-object/from16 v26, v0

    if-eqz v26, :cond_1c

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem;->post:Lcom/vkontakte/android/NewsEntry;

    move-object/from16 v26, v0

    move-object/from16 v0, v26

    iget-object v0, v0, Lcom/vkontakte/android/NewsEntry;->suggestSubscribe:Ljava/lang/Boolean;

    move-object/from16 v26, v0

    invoke-virtual/range {v26 .. v26}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v26

    if-nez v26, :cond_1c

    const/16 v26, 0x0

    :goto_9
    move-object/from16 v0, v27

    move/from16 v1, v26

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 211
    iget-object v0, v10, Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem$ViewHolder;->unSubscribeBtn:Landroid/view/View;

    move-object/from16 v26, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem;->subscribeClickListener:Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem$SubscribeClickListener;

    move-object/from16 v27, v0

    invoke-virtual/range {v26 .. v27}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 212
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem;->subscribeClickListener:Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem$SubscribeClickListener;

    move-object/from16 v26, v0

    iget-object v0, v10, Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem$ViewHolder;->unSubscribeBtn:Landroid/view/View;

    move-object/from16 v27, v0

    move-object/from16 v0, v27

    move-object/from16 v1, v26

    iput-object v0, v1, Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem$SubscribeClickListener;->unSubscribeButton:Landroid/view/View;

    .line 215
    :cond_9
    iget-object v0, v10, Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem$ViewHolder;->name:Landroid/widget/TextView;

    move-object/from16 v26, v0

    move-object/from16 v0, v26

    invoke-virtual {v0, v14}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 216
    iget-object v0, v10, Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem$ViewHolder;->time:Landroid/widget/TextView;

    move-object/from16 v26, v0

    move-object/from16 v0, v26

    invoke-virtual {v0, v13}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 217
    iget-object v0, v10, Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem$ViewHolder;->menuBtn:Landroid/view/View;

    move-object/from16 v26, v0

    if-eqz v26, :cond_a

    .line 218
    iget-object v0, v10, Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem$ViewHolder;->menuBtn:Landroid/view/View;

    move-object/from16 v26, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem;->menuClickListener:Landroid/view/View$OnClickListener;

    move-object/from16 v27, v0

    invoke-virtual/range {v26 .. v27}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 219
    iget-object v0, v10, Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem$ViewHolder;->menuBtn:Landroid/view/View;

    move-object/from16 v27, v0

    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem;->showMenu:Z

    move/from16 v26, v0

    if-eqz v26, :cond_1d

    const/16 v26, 0x0

    :goto_a
    move-object/from16 v0, v27

    move/from16 v1, v26

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 220
    iget-object v0, v10, Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem$ViewHolder;->menuBtn:Landroid/view/View;

    move-object/from16 v26, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem;->post:Lcom/vkontakte/android/NewsEntry;

    move-object/from16 v27, v0

    invoke-virtual/range {v26 .. v27}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 222
    :cond_a
    iget-object v0, v10, Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem$ViewHolder;->profileBtn:Landroid/view/View;

    move-object/from16 v26, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem;->photoOnClick:Landroid/view/View$OnClickListener;

    move-object/from16 v27, v0

    invoke-virtual/range {v26 .. v27}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 223
    iget-object v0, v10, Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem$ViewHolder;->profileBtn:Landroid/view/View;

    move-object/from16 v27, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem;->post:Lcom/vkontakte/android/NewsEntry;

    move-object/from16 v26, v0

    move-object/from16 v0, v26

    iget v0, v0, Lcom/vkontakte/android/NewsEntry;->ownerID:I

    move/from16 v26, v0

    if-eqz v26, :cond_1e

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem;->post:Lcom/vkontakte/android/NewsEntry;

    move-object/from16 v26, v0

    move-object/from16 v0, v26

    iget v0, v0, Lcom/vkontakte/android/NewsEntry;->type:I

    move/from16 v26, v0

    const/16 v28, 0xb

    move/from16 v0, v26

    move/from16 v1, v28

    if-eq v0, v1, :cond_1e

    const/16 v26, 0x1

    :goto_b
    move-object/from16 v0, v27

    move/from16 v1, v26

    invoke-virtual {v0, v1}, Landroid/view/View;->setClickable(Z)V

    .line 224
    iget-object v0, v10, Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem$ViewHolder;->subscribeBtn:Landroid/widget/ImageView;

    move-object/from16 v26, v0

    if-eqz v26, :cond_1f

    iget-object v0, v10, Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem$ViewHolder;->subscribeBtn:Landroid/widget/ImageView;

    move-object/from16 v26, v0

    invoke-virtual/range {v26 .. v26}, Landroid/widget/ImageView;->getVisibility()I

    move-result v26

    if-nez v26, :cond_1f

    iget-object v0, v10, Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem$ViewHolder;->menuBtn:Landroid/view/View;

    move-object/from16 v26, v0

    if-eqz v26, :cond_1f

    iget-object v0, v10, Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem$ViewHolder;->menuBtn:Landroid/view/View;

    move-object/from16 v26, v0

    .line 225
    invoke-virtual/range {v26 .. v26}, Landroid/view/View;->getVisibility()I

    move-result v26

    if-nez v26, :cond_1f

    const/4 v15, 0x1

    .line 226
    .local v15, "needMargin":Z
    :goto_c
    if-eqz v15, :cond_20

    const/high16 v26, 0x42400000    # 48.0f

    invoke-static/range {v26 .. v26}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v20

    .line 227
    .local v20, "shiftMargin":I
    :goto_d
    if-eqz v15, :cond_21

    const/16 v23, 0x0

    .line 228
    .local v23, "subscribeMargin":I
    :goto_e
    iget-object v0, v10, Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem$ViewHolder;->profileBtn:Landroid/view/View;

    move-object/from16 v26, v0

    invoke-virtual/range {v26 .. v26}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v17

    check-cast v17, Landroid/widget/RelativeLayout$LayoutParams;

    .line 229
    .local v17, "params":Landroid/widget/RelativeLayout$LayoutParams;
    iget-object v0, v10, Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem$ViewHolder;->subscribeBtn:Landroid/widget/ImageView;

    move-object/from16 v26, v0

    invoke-virtual/range {v26 .. v26}, Landroid/widget/ImageView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v24

    check-cast v24, Landroid/widget/RelativeLayout$LayoutParams;

    .line 230
    .local v24, "subscribeParams":Landroid/widget/RelativeLayout$LayoutParams;
    iget-object v0, v10, Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem$ViewHolder;->unSubscribeBtn:Landroid/view/View;

    move-object/from16 v26, v0

    invoke-virtual/range {v26 .. v26}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v25

    check-cast v25, Landroid/widget/RelativeLayout$LayoutParams;

    .line 231
    .local v25, "unSubscribeParams":Landroid/widget/RelativeLayout$LayoutParams;
    invoke-virtual/range {p1 .. p1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v26

    const v27, 0x7f090029

    invoke-virtual/range {v26 .. v27}, Landroid/content/res/Resources;->getDimension(I)F

    move-result v26

    move/from16 v0, v26

    float-to-int v0, v0

    move/from16 v26, v0

    add-int v26, v26, v20

    move/from16 v0, v26

    move-object/from16 v1, v17

    iput v0, v1, Landroid/widget/RelativeLayout$LayoutParams;->rightMargin:I

    .line 232
    move/from16 v0, v23

    move-object/from16 v1, v24

    iput v0, v1, Landroid/widget/RelativeLayout$LayoutParams;->rightMargin:I

    .line 233
    move/from16 v0, v23

    move-object/from16 v1, v25

    iput v0, v1, Landroid/widget/RelativeLayout$LayoutParams;->rightMargin:I

    .line 234
    iget-object v0, v10, Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem$ViewHolder;->profileBtn:Landroid/view/View;

    move-object/from16 v26, v0

    invoke-virtual/range {v26 .. v26}, Landroid/view/View;->requestLayout()V

    .line 235
    iget-object v0, v10, Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem$ViewHolder;->subscribeBtn:Landroid/widget/ImageView;

    move-object/from16 v26, v0

    invoke-virtual/range {v26 .. v26}, Landroid/widget/ImageView;->requestLayout()V

    .line 236
    iget-object v0, v10, Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem$ViewHolder;->unSubscribeBtn:Landroid/view/View;

    move-object/from16 v26, v0

    invoke-virtual/range {v26 .. v26}, Landroid/view/View;->requestLayout()V

    .line 238
    iget-object v0, v10, Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem$ViewHolder;->photo:Lcom/vk/imageloader/view/VKImageView;

    move-object/from16 v27, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem;->post:Lcom/vkontakte/android/NewsEntry;

    move-object/from16 v26, v0

    move-object/from16 v0, v26

    iget v0, v0, Lcom/vkontakte/android/NewsEntry;->userID:I

    move/from16 v26, v0

    if-lez v26, :cond_22

    const v26, 0x7f02039b

    :goto_f
    move-object/from16 v0, v27

    move/from16 v1, v26

    invoke-virtual {v0, v1}, Lcom/vk/imageloader/view/VKImageView;->setPlaceholderImage(I)V

    .line 239
    iget-object v0, v10, Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem$ViewHolder;->photo:Lcom/vk/imageloader/view/VKImageView;

    move-object/from16 v26, v0

    const/16 v27, 0x0

    move-object/from16 v0, p0

    move/from16 v1, v27

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem;->getImageURL(I)Ljava/lang/String;

    move-result-object v27

    invoke-virtual/range {v26 .. v27}, Lcom/vk/imageloader/view/VKImageView;->load(Ljava/lang/String;)V

    .line 242
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem;->post:Lcom/vkontakte/android/NewsEntry;

    move-object/from16 v26, v0

    move-object/from16 v0, v26

    iget v0, v0, Lcom/vkontakte/android/NewsEntry;->type:I

    move/from16 v26, v0

    if-eqz v26, :cond_b

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem;->post:Lcom/vkontakte/android/NewsEntry;

    move-object/from16 v26, v0

    move-object/from16 v0, v26

    iget v0, v0, Lcom/vkontakte/android/NewsEntry;->type:I

    move/from16 v26, v0

    const/16 v27, 0x1

    move/from16 v0, v26

    move/from16 v1, v27

    if-eq v0, v1, :cond_b

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem;->post:Lcom/vkontakte/android/NewsEntry;

    move-object/from16 v26, v0

    move-object/from16 v0, v26

    iget v0, v0, Lcom/vkontakte/android/NewsEntry;->type:I

    move/from16 v26, v0

    const/16 v27, 0x2

    move/from16 v0, v26

    move/from16 v1, v27

    if-eq v0, v1, :cond_b

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem;->post:Lcom/vkontakte/android/NewsEntry;

    move-object/from16 v26, v0

    move-object/from16 v0, v26

    iget v0, v0, Lcom/vkontakte/android/NewsEntry;->type:I

    move/from16 v26, v0

    const/16 v27, 0x4

    move/from16 v0, v26

    move/from16 v1, v27

    if-eq v0, v1, :cond_b

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem;->post:Lcom/vkontakte/android/NewsEntry;

    move-object/from16 v26, v0

    move-object/from16 v0, v26

    iget v0, v0, Lcom/vkontakte/android/NewsEntry;->type:I

    move/from16 v26, v0

    const/16 v27, 0xc

    move/from16 v0, v26

    move/from16 v1, v27

    if-ne v0, v1, :cond_e

    .line 243
    :cond_b
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem;->post:Lcom/vkontakte/android/NewsEntry;

    move-object/from16 v26, v0

    move-object/from16 v0, v26

    iget-object v0, v0, Lcom/vkontakte/android/NewsEntry;->extra:Landroid/os/Bundle;

    move-object/from16 v26, v0

    const-string/jumbo v27, "view_post_viewed"

    invoke-virtual/range {v26 .. v27}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v26

    if-nez v26, :cond_e

    .line 244
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem;->post:Lcom/vkontakte/android/NewsEntry;

    move-object/from16 v26, v0

    move-object/from16 v0, v26

    iget-object v0, v0, Lcom/vkontakte/android/NewsEntry;->extra:Landroid/os/Bundle;

    move-object/from16 v26, v0

    const-string/jumbo v27, "view_post_viewed"

    const/16 v28, 0x1

    invoke-virtual/range {v26 .. v28}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 245
    new-instance v26, Ljava/lang/StringBuilder;

    invoke-direct/range {v26 .. v26}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem;->post:Lcom/vkontakte/android/NewsEntry;

    move-object/from16 v27, v0

    move-object/from16 v0, v27

    iget v0, v0, Lcom/vkontakte/android/NewsEntry;->ownerID:I

    move/from16 v27, v0

    invoke-virtual/range {v26 .. v27}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v26

    const-string/jumbo v27, "_"

    invoke-virtual/range {v26 .. v27}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v26

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem;->post:Lcom/vkontakte/android/NewsEntry;

    move-object/from16 v27, v0

    move-object/from16 v0, v27

    iget v0, v0, Lcom/vkontakte/android/NewsEntry;->postID:I

    move/from16 v27, v0

    invoke-virtual/range {v26 .. v27}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v26

    const-string/jumbo v27, "|"

    invoke-virtual/range {v26 .. v27}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v26

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem;->post:Lcom/vkontakte/android/NewsEntry;

    move-object/from16 v27, v0

    invoke-virtual/range {v27 .. v27}, Lcom/vkontakte/android/NewsEntry;->getTypeString()Ljava/lang/String;

    move-result-object v27

    invoke-virtual/range {v26 .. v27}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v26

    const-string/jumbo v27, "|"

    invoke-virtual/range {v26 .. v27}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v26

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem;->referrer:Ljava/lang/String;

    move-object/from16 v27, v0

    invoke-virtual/range {v26 .. v27}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v26

    const-string/jumbo v27, "|"

    invoke-virtual/range {v26 .. v27}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v26

    move-object/from16 v0, p0

    iget v0, v0, Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem;->listPosition:I

    move/from16 v27, v0

    invoke-virtual/range {v26 .. v27}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v26

    invoke-virtual/range {v26 .. v26}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v19

    .line 247
    .local v19, "postIds":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem;->post:Lcom/vkontakte/android/NewsEntry;

    move-object/from16 v26, v0

    move-object/from16 v0, v26

    iget v0, v0, Lcom/vkontakte/android/NewsEntry;->type:I

    move/from16 v26, v0

    const/16 v27, 0xc

    move/from16 v0, v26

    move/from16 v1, v27

    if-ne v0, v1, :cond_c

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem;->post:Lcom/vkontakte/android/NewsEntry;

    move-object/from16 v26, v0

    move-object/from16 v0, v26

    iget-object v0, v0, Lcom/vkontakte/android/NewsEntry;->attachments:Ljava/util/ArrayList;

    move-object/from16 v26, v0

    if-eqz v26, :cond_c

    .line 248
    const/4 v11, 0x0

    .local v11, "i":I
    :goto_10
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem;->post:Lcom/vkontakte/android/NewsEntry;

    move-object/from16 v26, v0

    move-object/from16 v0, v26

    iget-object v0, v0, Lcom/vkontakte/android/NewsEntry;->attachments:Ljava/util/ArrayList;

    move-object/from16 v26, v0

    invoke-virtual/range {v26 .. v26}, Ljava/util/ArrayList;->size()I

    move-result v26

    move/from16 v0, v26

    if-ge v11, v0, :cond_c

    .line 249
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem;->post:Lcom/vkontakte/android/NewsEntry;

    move-object/from16 v26, v0

    move-object/from16 v0, v26

    iget-object v0, v0, Lcom/vkontakte/android/NewsEntry;->attachments:Ljava/util/ArrayList;

    move-object/from16 v26, v0

    move-object/from16 v0, v26

    invoke-virtual {v0, v11}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/vkontakte/android/attachments/Attachment;

    .line 250
    .local v5, "attachment":Lcom/vkontakte/android/attachments/Attachment;
    instance-of v0, v5, Lcom/vkontakte/android/attachments/ShitAttachment;

    move/from16 v26, v0

    if-eqz v26, :cond_23

    check-cast v5, Lcom/vkontakte/android/attachments/ShitAttachment;

    .end local v5    # "attachment":Lcom/vkontakte/android/attachments/Attachment;
    iget-object v12, v5, Lcom/vkontakte/android/attachments/ShitAttachment;->dataImpression:Lcom/vkontakte/android/statistics/StatisticUrl;

    .local v12, "impression":Lcom/vkontakte/android/statistics/StatisticUrl;
    if-eqz v12, :cond_23

    iget-object v0, v12, Lcom/vkontakte/android/statistics/StatisticUrl;->value:Ljava/lang/String;

    move-object/from16 v26, v0

    .line 252
    invoke-static/range {v26 .. v26}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v26

    if-nez v26, :cond_23

    .line 253
    new-instance v26, Ljava/lang/StringBuilder;

    invoke-direct/range {v26 .. v26}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v26

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v26

    const-string/jumbo v27, "|"

    invoke-virtual/range {v26 .. v27}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v26

    iget-object v0, v12, Lcom/vkontakte/android/statistics/StatisticUrl;->value:Ljava/lang/String;

    move-object/from16 v27, v0

    invoke-virtual/range {v26 .. v27}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v26

    invoke-virtual/range {v26 .. v26}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v19

    .line 258
    .end local v11    # "i":I
    .end local v12    # "impression":Lcom/vkontakte/android/statistics/StatisticUrl;
    :cond_c
    const-string/jumbo v26, "view_post"

    invoke-static/range {v26 .. v26}, Lcom/vkontakte/android/data/Analytics;->track(Ljava/lang/String;)Lcom/vkontakte/android/data/Analytics$EventBuilder;

    move-result-object v26

    invoke-virtual/range {v26 .. v26}, Lcom/vkontakte/android/data/Analytics$EventBuilder;->collapse()Lcom/vkontakte/android/data/Analytics$EventBuilder;

    move-result-object v26

    invoke-virtual/range {v26 .. v26}, Lcom/vkontakte/android/data/Analytics$EventBuilder;->unique()Lcom/vkontakte/android/data/Analytics$EventBuilder;

    move-result-object v7

    .line 259
    .local v7, "builder":Lcom/vkontakte/android/data/Analytics$EventBuilder;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem;->post:Lcom/vkontakte/android/NewsEntry;

    move-object/from16 v26, v0

    invoke-virtual/range {v26 .. v26}, Lcom/vkontakte/android/NewsEntry;->hasTrackCode()Z

    move-result v26

    if-eqz v26, :cond_d

    .line 260
    const-string/jumbo v26, "track_code"

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem;->post:Lcom/vkontakte/android/NewsEntry;

    move-object/from16 v27, v0

    invoke-virtual/range {v27 .. v27}, Lcom/vkontakte/android/NewsEntry;->getTrackCode()Ljava/lang/String;

    move-result-object v27

    move-object/from16 v0, v26

    move-object/from16 v1, v27

    invoke-virtual {v7, v0, v1}, Lcom/vkontakte/android/data/Analytics$EventBuilder;->addParam(Ljava/lang/String;Ljava/lang/Object;)Lcom/vkontakte/android/data/Analytics$EventBuilder;

    .line 262
    :cond_d
    const-string/jumbo v26, "post_ids"

    move-object/from16 v0, v26

    move-object/from16 v1, v19

    invoke-virtual {v7, v0, v1}, Lcom/vkontakte/android/data/Analytics$EventBuilder;->addParam(Ljava/lang/String;Ljava/lang/Object;)Lcom/vkontakte/android/data/Analytics$EventBuilder;

    .line 263
    const-string/jumbo v27, "repost_ids"

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem;->post:Lcom/vkontakte/android/NewsEntry;

    move-object/from16 v26, v0

    const/16 v28, 0x20

    move-object/from16 v0, v26

    move/from16 v1, v28

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/NewsEntry;->flag(I)Z

    move-result v26

    if-eqz v26, :cond_24

    new-instance v26, Ljava/lang/StringBuilder;

    invoke-direct/range {v26 .. v26}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem;->post:Lcom/vkontakte/android/NewsEntry;

    move-object/from16 v28, v0

    invoke-virtual/range {v28 .. v28}, Lcom/vkontakte/android/NewsEntry;->getRepostTypeString()Ljava/lang/String;

    move-result-object v28

    move-object/from16 v0, v26

    move-object/from16 v1, v28

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v26

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem;->post:Lcom/vkontakte/android/NewsEntry;

    move-object/from16 v28, v0

    move-object/from16 v0, v28

    iget v0, v0, Lcom/vkontakte/android/NewsEntry;->retweetUID:I

    move/from16 v28, v0

    move-object/from16 v0, v26

    move/from16 v1, v28

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v26

    const-string/jumbo v28, "_"

    move-object/from16 v0, v26

    move-object/from16 v1, v28

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v26

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem;->post:Lcom/vkontakte/android/NewsEntry;

    move-object/from16 v28, v0

    move-object/from16 v0, v28

    iget v0, v0, Lcom/vkontakte/android/NewsEntry;->retweetOrigId:I

    move/from16 v28, v0

    move-object/from16 v0, v26

    move/from16 v1, v28

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v26

    invoke-virtual/range {v26 .. v26}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v26

    :goto_11
    move-object/from16 v0, v27

    move-object/from16 v1, v26

    invoke-virtual {v7, v0, v1}, Lcom/vkontakte/android/data/Analytics$EventBuilder;->addParam(Ljava/lang/String;Ljava/lang/Object;)Lcom/vkontakte/android/data/Analytics$EventBuilder;

    .line 264
    invoke-virtual {v7}, Lcom/vkontakte/android/data/Analytics$EventBuilder;->commit()Lcom/vkontakte/android/data/Analytics$EventBuilder;

    .line 267
    .end local v7    # "builder":Lcom/vkontakte/android/data/Analytics$EventBuilder;
    .end local v19    # "postIds":Ljava/lang/String;
    :cond_e
    return-void

    .line 128
    .end local v10    # "holder":Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem$ViewHolder;
    .end local v15    # "needMargin":Z
    .end local v17    # "params":Landroid/widget/RelativeLayout$LayoutParams;
    .end local v18    # "platformIconResId":I
    .end local v20    # "shiftMargin":I
    .end local v23    # "subscribeMargin":I
    .end local v24    # "subscribeParams":Landroid/widget/RelativeLayout$LayoutParams;
    .end local v25    # "unSubscribeParams":Landroid/widget/RelativeLayout$LayoutParams;
    :cond_f
    const v26, 0x7f0d0046

    goto/16 :goto_0

    .line 129
    :cond_10
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem;->post:Lcom/vkontakte/android/NewsEntry;

    move-object/from16 v26, v0

    move-object/from16 v0, v26

    iget v0, v0, Lcom/vkontakte/android/NewsEntry;->type:I

    move/from16 v26, v0

    const/16 v27, 0x6

    move/from16 v0, v26

    move/from16 v1, v27

    if-ne v0, v1, :cond_11

    .line 130
    new-instance v26, Ljava/lang/StringBuilder;

    invoke-direct/range {v26 .. v26}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual/range {p1 .. p1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v27

    const v28, 0x7f0d0044

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem;->post:Lcom/vkontakte/android/NewsEntry;

    move-object/from16 v29, v0

    move-object/from16 v0, v29

    iget v0, v0, Lcom/vkontakte/android/NewsEntry;->postID:I

    move/from16 v29, v0

    const/16 v30, 0x1

    move/from16 v0, v30

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v30, v0

    const/16 v31, 0x0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem;->post:Lcom/vkontakte/android/NewsEntry;

    move-object/from16 v32, v0

    move-object/from16 v0, v32

    iget v0, v0, Lcom/vkontakte/android/NewsEntry;->postID:I

    move/from16 v32, v0

    invoke-static/range {v32 .. v32}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v32

    aput-object v32, v30, v31

    invoke-virtual/range {v27 .. v30}, Landroid/content/res/Resources;->getQuantityString(II[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v27

    invoke-virtual/range {v26 .. v27}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v26

    const-string/jumbo v27, ", "

    invoke-virtual/range {v26 .. v27}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v26

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem;->post:Lcom/vkontakte/android/NewsEntry;

    move-object/from16 v27, v0

    move-object/from16 v0, v27

    iget v0, v0, Lcom/vkontakte/android/NewsEntry;->time:I

    move/from16 v27, v0

    invoke-virtual/range {p1 .. p1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v28

    invoke-static/range {v27 .. v28}, Lcom/vkontakte/android/TimeUtils;->langDateRelative(ILandroid/content/res/Resources;)Ljava/lang/String;

    move-result-object v27

    invoke-virtual/range {v26 .. v27}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v26

    invoke-virtual/range {v26 .. v26}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    goto/16 :goto_1

    .line 132
    :cond_11
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem;->post:Lcom/vkontakte/android/NewsEntry;

    move-object/from16 v26, v0

    move-object/from16 v0, v26

    iget v0, v0, Lcom/vkontakte/android/NewsEntry;->type:I

    move/from16 v26, v0

    const/16 v27, 0xb

    move/from16 v0, v26

    move/from16 v1, v27

    if-ne v0, v1, :cond_12

    .line 133
    new-instance v26, Ljava/lang/StringBuilder;

    invoke-direct/range {v26 .. v26}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem;->post:Lcom/vkontakte/android/NewsEntry;

    move-object/from16 v27, v0

    move-object/from16 v0, v27

    iget-object v0, v0, Lcom/vkontakte/android/NewsEntry;->retweetUserName:Ljava/lang/String;

    move-object/from16 v27, v0

    invoke-virtual/range {v26 .. v27}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v26

    const-string/jumbo v27, " "

    invoke-virtual/range {v26 .. v27}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v26

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem;->post:Lcom/vkontakte/android/NewsEntry;

    move-object/from16 v27, v0

    move-object/from16 v0, v27

    iget-object v0, v0, Lcom/vkontakte/android/NewsEntry;->extra:Landroid/os/Bundle;

    move-object/from16 v27, v0

    const-string/jumbo v28, "age_restriction"

    invoke-virtual/range {v27 .. v28}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v27

    invoke-virtual/range {v26 .. v27}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v26

    invoke-virtual/range {v26 .. v26}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    goto/16 :goto_1

    .line 134
    :cond_12
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem;->fromList:Z

    move/from16 v26, v0

    if-eqz v26, :cond_13

    .line 135
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem;->post:Lcom/vkontakte/android/NewsEntry;

    move-object/from16 v26, v0

    move-object/from16 v0, v26

    iget v0, v0, Lcom/vkontakte/android/NewsEntry;->time:I

    move/from16 v26, v0

    invoke-virtual/range {p1 .. p1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v27

    invoke-static/range {v26 .. v27}, Lcom/vkontakte/android/TimeUtils;->langDateRelative(ILandroid/content/res/Resources;)Ljava/lang/String;

    move-result-object v13

    goto/16 :goto_1

    .line 137
    :cond_13
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem;->post:Lcom/vkontakte/android/NewsEntry;

    move-object/from16 v26, v0

    move-object/from16 v0, v26

    iget v0, v0, Lcom/vkontakte/android/NewsEntry;->time:I

    move/from16 v26, v0

    invoke-static/range {v26 .. v26}, Lcom/vkontakte/android/TimeUtils;->langDate(I)Ljava/lang/String;

    move-result-object v13

    goto/16 :goto_1

    .line 147
    :cond_14
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem;->post:Lcom/vkontakte/android/NewsEntry;

    move-object/from16 v26, v0

    move-object/from16 v0, v26

    iget-object v0, v0, Lcom/vkontakte/android/NewsEntry;->extra:Landroid/os/Bundle;

    move-object/from16 v26, v0

    const-string/jumbo v27, "orig_type"

    invoke-virtual/range {v26 .. v27}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v26

    const/16 v27, 0x7

    move/from16 v0, v26

    move/from16 v1, v27

    if-ne v0, v1, :cond_1

    .line 148
    new-instance v27, Ljava/lang/StringBuilder;

    invoke-direct/range {v27 .. v27}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual/range {p1 .. p1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v28

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem;->post:Lcom/vkontakte/android/NewsEntry;

    move-object/from16 v26, v0

    move-object/from16 v0, v26

    iget-boolean v0, v0, Lcom/vkontakte/android/NewsEntry;->f:Z

    move/from16 v26, v0

    if-eqz v26, :cond_15

    const v26, 0x7f0d0045

    :goto_12
    const/16 v29, 0x1

    const/16 v30, 0x1

    move/from16 v0, v30

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v30, v0

    const/16 v31, 0x0

    const/16 v32, 0x1

    invoke-static/range {v32 .. v32}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v32

    aput-object v32, v30, v31

    move-object/from16 v0, v28

    move/from16 v1, v26

    move/from16 v2, v29

    move-object/from16 v3, v30

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/res/Resources;->getQuantityString(II[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v26

    move-object/from16 v0, v27

    move-object/from16 v1, v26

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v26

    const-string/jumbo v27, ", "

    invoke-virtual/range {v26 .. v27}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v26

    move-object/from16 v0, v26

    invoke-virtual {v0, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v26

    invoke-virtual/range {v26 .. v26}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    goto/16 :goto_2

    :cond_15
    const v26, 0x7f0d0046

    goto :goto_12

    .line 155
    .restart local v6    # "bldr":Landroid/text/SpannableStringBuilder;
    .restart local v22    # "sp":Landroid/text/Spannable;
    :cond_16
    const v26, 0x7f02024d

    goto/16 :goto_3

    .line 179
    .end local v6    # "bldr":Landroid/text/SpannableStringBuilder;
    .end local v22    # "sp":Landroid/text/Spannable;
    .restart local v10    # "holder":Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem$ViewHolder;
    .restart local v18    # "platformIconResId":I
    :cond_17
    iget-object v0, v10, Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem$ViewHolder;->adsTitle:Landroid/widget/TextView;

    move-object/from16 v26, v0

    if-eqz v26, :cond_5

    iget-object v0, v10, Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem$ViewHolder;->ageRestriction:Landroid/widget/TextView;

    move-object/from16 v26, v0

    if-eqz v26, :cond_5

    .line 180
    iget-object v0, v10, Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem$ViewHolder;->adsTitle:Landroid/widget/TextView;

    move-object/from16 v26, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem;->post:Lcom/vkontakte/android/NewsEntry;

    move-object/from16 v27, v0

    move-object/from16 v0, v27

    iget-object v0, v0, Lcom/vkontakte/android/NewsEntry;->extra:Landroid/os/Bundle;

    move-object/from16 v27, v0

    const-string/jumbo v28, "ads_title"

    invoke-virtual/range {v27 .. v28}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v27

    invoke-virtual/range {v26 .. v27}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 181
    iget-object v0, v10, Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem$ViewHolder;->ageRestriction:Landroid/widget/TextView;

    move-object/from16 v26, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem;->post:Lcom/vkontakte/android/NewsEntry;

    move-object/from16 v27, v0

    move-object/from16 v0, v27

    iget-object v0, v0, Lcom/vkontakte/android/NewsEntry;->extra:Landroid/os/Bundle;

    move-object/from16 v27, v0

    const-string/jumbo v28, "age_restriction"

    invoke-virtual/range {v27 .. v28}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v27

    invoke-virtual/range {v26 .. v27}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto/16 :goto_4

    .line 185
    :cond_18
    const/16 v21, 0x0

    goto/16 :goto_5

    .line 186
    .restart local v21    # "showAction":Z
    :cond_19
    const/16 v26, 0x8

    goto/16 :goto_6

    .line 201
    .end local v21    # "showAction":Z
    :cond_1a
    iget-object v0, v10, Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem$ViewHolder;->subscribeBtn:Landroid/widget/ImageView;

    move-object/from16 v26, v0

    invoke-virtual/range {v26 .. v26}, Landroid/widget/ImageView;->getContext()Landroid/content/Context;

    move-result-object v8

    .line 202
    .local v8, "context":Landroid/content/Context;
    iget-object v0, v10, Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem$ViewHolder;->subscribeBtn:Landroid/widget/ImageView;

    move-object/from16 v26, v0

    const v27, 0x7f02015f

    const v28, 0x7f0f0018

    move/from16 v0, v27

    move/from16 v1, v28

    invoke-static {v8, v0, v1}, Lcom/vk/core/util/DrawableUtils;->tint(Landroid/content/Context;II)Landroid/graphics/drawable/Drawable;

    move-result-object v27

    invoke-virtual/range {v26 .. v27}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    goto/16 :goto_7

    .line 204
    .end local v8    # "context":Landroid/content/Context;
    :cond_1b
    const/16 v26, 0x8

    goto/16 :goto_8

    .line 210
    :cond_1c
    const/16 v26, 0x8

    goto/16 :goto_9

    .line 219
    :cond_1d
    const/16 v26, 0x8

    goto/16 :goto_a

    .line 223
    :cond_1e
    const/16 v26, 0x0

    goto/16 :goto_b

    .line 225
    :cond_1f
    const/4 v15, 0x0

    goto/16 :goto_c

    .line 226
    .restart local v15    # "needMargin":Z
    :cond_20
    const/16 v20, 0x0

    goto/16 :goto_d

    .line 227
    .restart local v20    # "shiftMargin":I
    :cond_21
    const/high16 v26, 0x40800000    # 4.0f

    invoke-static/range {v26 .. v26}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v23

    goto/16 :goto_e

    .line 238
    .restart local v17    # "params":Landroid/widget/RelativeLayout$LayoutParams;
    .restart local v23    # "subscribeMargin":I
    .restart local v24    # "subscribeParams":Landroid/widget/RelativeLayout$LayoutParams;
    .restart local v25    # "unSubscribeParams":Landroid/widget/RelativeLayout$LayoutParams;
    :cond_22
    const v26, 0x7f02038e

    goto/16 :goto_f

    .line 248
    .restart local v11    # "i":I
    .restart local v19    # "postIds":Ljava/lang/String;
    :cond_23
    add-int/lit8 v11, v11, 0x1

    goto/16 :goto_10

    .line 263
    .end local v11    # "i":I
    .restart local v7    # "builder":Lcom/vkontakte/android/data/Analytics$EventBuilder;
    :cond_24
    const/16 v26, 0x0

    goto/16 :goto_11
.end method

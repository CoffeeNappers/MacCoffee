.class public Lcom/vkontakte/android/ui/posts/FooterPostDisplayItem;
.super Lcom/vkontakte/android/ui/posts/PostDisplayItem;
.source "FooterPostDisplayItem.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vkontakte/android/ui/posts/FooterPostDisplayItem$ViewHolder;
    }
.end annotation


# instance fields
.field private commentsOnClick:Landroid/view/View$OnClickListener;

.field public e:Lcom/vkontakte/android/NewsEntry;

.field private feedback:Z

.field private likesOnClick:Landroid/view/View$OnClickListener;

.field private liking:Z

.field public referer:Ljava/lang/String;

.field private repostsOnClick:Landroid/view/View$OnClickListener;

.field private showLikes:Z


# direct methods
.method public constructor <init>(Lcom/vkontakte/android/NewsEntry;ZZLjava/lang/String;)V
    .locals 1
    .param p1, "_e"    # Lcom/vkontakte/android/NewsEntry;
    .param p2, "_feedback"    # Z
    .param p3, "likes"    # Z
    .param p4, "_referer"    # Ljava/lang/String;

    .prologue
    .line 42
    invoke-direct {p0, p1}, Lcom/vkontakte/android/ui/posts/PostDisplayItem;-><init>(Lcom/vkontakte/android/NewsEntry;)V

    .line 43
    iput-object p1, p0, Lcom/vkontakte/android/ui/posts/FooterPostDisplayItem;->e:Lcom/vkontakte/android/NewsEntry;

    .line 44
    invoke-static {p0, p4}, Lcom/vkontakte/android/ui/posts/FooterPostDisplayItem$$Lambda$1;->lambdaFactory$(Lcom/vkontakte/android/ui/posts/FooterPostDisplayItem;Ljava/lang/String;)Landroid/view/View$OnClickListener;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/ui/posts/FooterPostDisplayItem;->commentsOnClick:Landroid/view/View$OnClickListener;

    .line 45
    invoke-static {p0}, Lcom/vkontakte/android/ui/posts/FooterPostDisplayItem$$Lambda$2;->lambdaFactory$(Lcom/vkontakte/android/ui/posts/FooterPostDisplayItem;)Landroid/view/View$OnClickListener;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/ui/posts/FooterPostDisplayItem;->likesOnClick:Landroid/view/View$OnClickListener;

    .line 46
    invoke-static {p0}, Lcom/vkontakte/android/ui/posts/FooterPostDisplayItem$$Lambda$3;->lambdaFactory$(Lcom/vkontakte/android/ui/posts/FooterPostDisplayItem;)Landroid/view/View$OnClickListener;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/ui/posts/FooterPostDisplayItem;->repostsOnClick:Landroid/view/View$OnClickListener;

    .line 54
    iput-boolean p3, p0, Lcom/vkontakte/android/ui/posts/FooterPostDisplayItem;->showLikes:Z

    .line 55
    iput-boolean p2, p0, Lcom/vkontakte/android/ui/posts/FooterPostDisplayItem;->feedback:Z

    .line 56
    iput-object p4, p0, Lcom/vkontakte/android/ui/posts/FooterPostDisplayItem;->referer:Ljava/lang/String;

    .line 57
    return-void
.end method

.method static synthetic access$102(Lcom/vkontakte/android/ui/posts/FooterPostDisplayItem;Z)Z
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/ui/posts/FooterPostDisplayItem;
    .param p1, "x1"    # Z

    .prologue
    .line 32
    iput-boolean p1, p0, Lcom/vkontakte/android/ui/posts/FooterPostDisplayItem;->liking:Z

    return p1
.end method

.method static synthetic access$200(Lcom/vkontakte/android/ui/posts/FooterPostDisplayItem;ZLandroid/view/View;)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/ui/posts/FooterPostDisplayItem;
    .param p1, "x1"    # Z
    .param p2, "x2"    # Landroid/view/View;

    .prologue
    .line 32
    invoke-direct {p0, p1, p2}, Lcom/vkontakte/android/ui/posts/FooterPostDisplayItem;->like(ZLandroid/view/View;)V

    return-void
.end method

.method public static createView(Landroid/content/Context;)Landroid/view/View;
    .locals 4
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    const/4 v3, 0x0

    .line 65
    const v2, 0x7f030160

    invoke-static {p0, v2, v3}, Landroid/view/View;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v1

    .line 66
    .local v1, "view":Landroid/view/View;
    new-instance v0, Lcom/vkontakte/android/ui/posts/FooterPostDisplayItem$ViewHolder;

    invoke-direct {v0, v3}, Lcom/vkontakte/android/ui/posts/FooterPostDisplayItem$ViewHolder;-><init>(Lcom/vkontakte/android/ui/posts/FooterPostDisplayItem$1;)V

    .line 67
    .local v0, "holder":Lcom/vkontakte/android/ui/posts/FooterPostDisplayItem$ViewHolder;
    const v2, 0x7f100402

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    iput-object v2, v0, Lcom/vkontakte/android/ui/posts/FooterPostDisplayItem$ViewHolder;->likes:Landroid/widget/TextView;

    .line 68
    const v2, 0x7f100403

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    iput-object v2, v0, Lcom/vkontakte/android/ui/posts/FooterPostDisplayItem$ViewHolder;->comments:Landroid/widget/TextView;

    .line 69
    const v2, 0x7f100404

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    iput-object v2, v0, Lcom/vkontakte/android/ui/posts/FooterPostDisplayItem$ViewHolder;->reposts:Landroid/widget/TextView;

    .line 70
    const v2, 0x7f100253

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    iput-object v2, v0, Lcom/vkontakte/android/ui/posts/FooterPostDisplayItem$ViewHolder;->divider:Landroid/view/View;

    .line 71
    invoke-virtual {v1, v0}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 72
    return-object v1
.end method

.method private like(ZLandroid/view/View;)V
    .locals 7
    .param p1, "liked"    # Z
    .param p2, "view"    # Landroid/view/View;

    .prologue
    .line 152
    iget-object v0, p0, Lcom/vkontakte/android/ui/posts/FooterPostDisplayItem;->e:Lcom/vkontakte/android/NewsEntry;

    const/16 v1, 0x8

    invoke-virtual {v0, v1, p1}, Lcom/vkontakte/android/NewsEntry;->flag(IZ)V

    .line 153
    if-eqz p1, :cond_0

    .line 154
    iget-object v0, p0, Lcom/vkontakte/android/ui/posts/FooterPostDisplayItem;->e:Lcom/vkontakte/android/NewsEntry;

    iget v1, v0, Lcom/vkontakte/android/NewsEntry;->numLikes:I

    add-int/lit8 v1, v1, 0x1

    iput v1, v0, Lcom/vkontakte/android/NewsEntry;->numLikes:I

    .line 159
    :goto_0
    invoke-virtual {p2}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/ui/posts/FooterPostDisplayItem;->bindView(Landroid/view/View;)V

    .line 161
    iget-boolean v0, p0, Lcom/vkontakte/android/ui/posts/FooterPostDisplayItem;->liking:Z

    if-eqz v0, :cond_1

    .line 204
    :goto_1
    return-void

    .line 156
    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/ui/posts/FooterPostDisplayItem;->e:Lcom/vkontakte/android/NewsEntry;

    iget v1, v0, Lcom/vkontakte/android/NewsEntry;->numLikes:I

    add-int/lit8 v1, v1, -0x1

    iput v1, v0, Lcom/vkontakte/android/NewsEntry;->numLikes:I

    goto :goto_0

    .line 164
    :cond_1
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/vkontakte/android/ui/posts/FooterPostDisplayItem;->liking:Z

    .line 165
    iget-object v0, p0, Lcom/vkontakte/android/ui/posts/FooterPostDisplayItem;->e:Lcom/vkontakte/android/NewsEntry;

    iget v3, v0, Lcom/vkontakte/android/NewsEntry;->ownerID:I

    .local v3, "lOid":I
    iget-object v0, p0, Lcom/vkontakte/android/ui/posts/FooterPostDisplayItem;->e:Lcom/vkontakte/android/NewsEntry;

    iget v4, v0, Lcom/vkontakte/android/NewsEntry;->postID:I

    .line 166
    .local v4, "lPid":I
    iget-object v0, p0, Lcom/vkontakte/android/ui/posts/FooterPostDisplayItem;->e:Lcom/vkontakte/android/NewsEntry;

    const-string/jumbo v1, ""

    invoke-static {v0, p1, v1}, Lcom/vkontakte/android/api/wall/WallLike;->newsEntry(Lcom/vkontakte/android/NewsEntry;ZLjava/lang/String;)Lcom/vkontakte/android/api/wall/WallLike;

    move-result-object v6

    new-instance v0, Lcom/vkontakte/android/ui/posts/FooterPostDisplayItem$1;

    move-object v1, p0

    move-object v2, p2

    move v5, p1

    invoke-direct/range {v0 .. v5}, Lcom/vkontakte/android/ui/posts/FooterPostDisplayItem$1;-><init>(Lcom/vkontakte/android/ui/posts/FooterPostDisplayItem;Landroid/view/View;IIZ)V

    invoke-virtual {v6, v0}, Lcom/vkontakte/android/api/wall/WallLike;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    .line 203
    invoke-virtual {v0}, Lcom/vkontakte/android/api/VKAPIRequest;->exec()Lcom/vkontakte/android/api/VKAPIRequest;

    goto :goto_1
.end method


# virtual methods
.method public getImageCount()I
    .locals 1

    .prologue
    .line 136
    const/4 v0, 0x0

    return v0
.end method

.method public getImageURL(I)Ljava/lang/String;
    .locals 1
    .param p1, "image"    # I

    .prologue
    .line 141
    const/4 v0, 0x0

    return-object v0
.end method

.method public getType()I
    .locals 1

    .prologue
    .line 61
    const/4 v0, 0x1

    return v0
.end method

.method synthetic lambda$new$0(Ljava/lang/String;Landroid/view/View;)V
    .locals 2
    .param p1, "_referer"    # Ljava/lang/String;
    .param p2, "v"    # Landroid/view/View;

    .prologue
    .line 44
    new-instance v0, Lcom/vkontakte/android/fragments/PostViewFragment$Builder;

    iget-object v1, p0, Lcom/vkontakte/android/ui/posts/FooterPostDisplayItem;->e:Lcom/vkontakte/android/NewsEntry;

    invoke-direct {v0, v1}, Lcom/vkontakte/android/fragments/PostViewFragment$Builder;-><init>(Lcom/vkontakte/android/NewsEntry;)V

    invoke-virtual {v0, p1}, Lcom/vkontakte/android/fragments/PostViewFragment$Builder;->setRefer(Ljava/lang/String;)Lcom/vkontakte/android/fragments/PostViewFragment$Builder;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vkontakte/android/fragments/PostViewFragment$Builder;->loadFromBeginning()Lcom/vkontakte/android/fragments/PostViewFragment$Builder;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vkontakte/android/fragments/PostViewFragment$Builder;->scrollToFirstComment()Lcom/vkontakte/android/fragments/PostViewFragment$Builder;

    move-result-object v0

    invoke-virtual {p2}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/fragments/PostViewFragment$Builder;->go(Landroid/content/Context;)Z

    return-void
.end method

.method synthetic lambda$new$1(Landroid/view/View;)V
    .locals 4
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 45
    iget-object v1, p0, Lcom/vkontakte/android/ui/posts/FooterPostDisplayItem;->e:Lcom/vkontakte/android/NewsEntry;

    iget-object v0, p0, Lcom/vkontakte/android/ui/posts/FooterPostDisplayItem;->e:Lcom/vkontakte/android/NewsEntry;

    const/16 v2, 0x8

    invoke-virtual {v0, v2}, Lcom/vkontakte/android/NewsEntry;->flag(I)Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-static {v2}, Lcom/vkontakte/android/utils/Utils;->castToActivity(Landroid/content/Context;)Landroid/app/Activity;

    move-result-object v2

    iget-object v3, p0, Lcom/vkontakte/android/ui/posts/FooterPostDisplayItem;->referer:Ljava/lang/String;

    invoke-static {v1, v0, v2, v3}, Lcom/vkontakte/android/data/Posts;->like(Lcom/vkontakte/android/NewsEntry;ZLandroid/app/Activity;Ljava/lang/String;)V

    return-void

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method synthetic lambda$new$2(Landroid/view/View;)V
    .locals 3
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 47
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/vkontakte/android/auth/VKAuth;->ensureLoggedIn(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 48
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/vk/sharing/Sharing;->from(Landroid/content/Context;)Lcom/vk/sharing/Sharing$Builder;

    move-result-object v0

    iget-object v1, p0, Lcom/vkontakte/android/ui/posts/FooterPostDisplayItem;->e:Lcom/vkontakte/android/NewsEntry;

    iget-object v2, p0, Lcom/vkontakte/android/ui/posts/FooterPostDisplayItem;->referer:Ljava/lang/String;

    .line 49
    invoke-static {v1, v2}, Lcom/vk/sharing/attachment/Attachments;->createInfo(Lcom/vkontakte/android/NewsEntry;Ljava/lang/String;)Lcom/vk/sharing/attachment/AttachmentInfo;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vk/sharing/Sharing$Builder;->withAttachment(Lcom/vk/sharing/attachment/AttachmentInfo;)Lcom/vk/sharing/Sharing$Builder;

    move-result-object v0

    iget-object v1, p0, Lcom/vkontakte/android/ui/posts/FooterPostDisplayItem;->e:Lcom/vkontakte/android/NewsEntry;

    .line 50
    invoke-static {v1}, Lcom/vk/sharing/action/Actions;->createInfo(Lcom/vkontakte/android/NewsEntry;)Lcom/vk/sharing/action/ActionsInfo;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vk/sharing/Sharing$Builder;->withActions(Lcom/vk/sharing/action/ActionsInfo;)Lcom/vk/sharing/Sharing$Builder;

    move-result-object v0

    .line 51
    invoke-virtual {v0}, Lcom/vk/sharing/Sharing$Builder;->share()V

    .line 53
    :cond_0
    return-void
.end method

.method public onBindView(Landroid/view/View;)V
    .locals 8
    .param p1, "view"    # Landroid/view/View;

    .prologue
    const/16 v7, 0x8

    const/high16 v6, 0x41200000    # 10.0f

    const/4 v2, 0x4

    const/4 v3, 0x0

    .line 77
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/ui/posts/FooterPostDisplayItem$ViewHolder;

    .line 79
    .local v0, "holder":Lcom/vkontakte/android/ui/posts/FooterPostDisplayItem$ViewHolder;
    iget-object v1, v0, Lcom/vkontakte/android/ui/posts/FooterPostDisplayItem$ViewHolder;->divider:Landroid/view/View;

    if-eqz v1, :cond_3

    .line 80
    iget-object v1, p0, Lcom/vkontakte/android/ui/posts/FooterPostDisplayItem;->e:Lcom/vkontakte/android/NewsEntry;

    iget-object v1, v1, Lcom/vkontakte/android/NewsEntry;->attachments:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-lez v1, :cond_6

    iget-object v1, p0, Lcom/vkontakte/android/ui/posts/FooterPostDisplayItem;->e:Lcom/vkontakte/android/NewsEntry;

    iget-object v1, v1, Lcom/vkontakte/android/NewsEntry;->attachments:Ljava/util/ArrayList;

    iget-object v4, p0, Lcom/vkontakte/android/ui/posts/FooterPostDisplayItem;->e:Lcom/vkontakte/android/NewsEntry;

    iget-object v4, v4, Lcom/vkontakte/android/NewsEntry;->attachments:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v4

    add-int/lit8 v4, v4, -0x1

    invoke-virtual {v1, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    instance-of v1, v1, Lcom/vkontakte/android/attachments/ThumbAttachment;

    if-nez v1, :cond_1

    iget-object v1, p0, Lcom/vkontakte/android/ui/posts/FooterPostDisplayItem;->e:Lcom/vkontakte/android/NewsEntry;

    iget-object v1, v1, Lcom/vkontakte/android/NewsEntry;->attachments:Ljava/util/ArrayList;

    iget-object v4, p0, Lcom/vkontakte/android/ui/posts/FooterPostDisplayItem;->e:Lcom/vkontakte/android/NewsEntry;

    iget-object v4, v4, Lcom/vkontakte/android/NewsEntry;->attachments:Ljava/util/ArrayList;

    .line 81
    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v4

    add-int/lit8 v4, v4, -0x1

    invoke-virtual {v1, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    instance-of v1, v1, Lcom/vkontakte/android/attachments/SnippetAttachment;

    if-nez v1, :cond_1

    iget-object v1, p0, Lcom/vkontakte/android/ui/posts/FooterPostDisplayItem;->e:Lcom/vkontakte/android/NewsEntry;

    iget-object v1, v1, Lcom/vkontakte/android/NewsEntry;->attachments:Ljava/util/ArrayList;

    iget-object v4, p0, Lcom/vkontakte/android/ui/posts/FooterPostDisplayItem;->e:Lcom/vkontakte/android/NewsEntry;

    iget-object v4, v4, Lcom/vkontakte/android/NewsEntry;->attachments:Ljava/util/ArrayList;

    .line 82
    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v4

    add-int/lit8 v4, v4, -0x1

    invoke-virtual {v1, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    instance-of v1, v1, Lcom/vkontakte/android/attachments/PollAttachment;

    if-nez v1, :cond_1

    iget-object v1, p0, Lcom/vkontakte/android/ui/posts/FooterPostDisplayItem;->e:Lcom/vkontakte/android/NewsEntry;

    iget-object v1, v1, Lcom/vkontakte/android/NewsEntry;->attachments:Ljava/util/ArrayList;

    iget-object v4, p0, Lcom/vkontakte/android/ui/posts/FooterPostDisplayItem;->e:Lcom/vkontakte/android/NewsEntry;

    iget-object v4, v4, Lcom/vkontakte/android/NewsEntry;->attachments:Ljava/util/ArrayList;

    .line 83
    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v4

    add-int/lit8 v4, v4, -0x1

    invoke-virtual {v1, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    instance-of v1, v1, Lcom/vkontakte/android/attachments/ShitAttachment;

    if-nez v1, :cond_1

    iget-object v1, p0, Lcom/vkontakte/android/ui/posts/FooterPostDisplayItem;->e:Lcom/vkontakte/android/NewsEntry;

    iget-object v1, v1, Lcom/vkontakte/android/NewsEntry;->attachments:Ljava/util/ArrayList;

    iget-object v4, p0, Lcom/vkontakte/android/ui/posts/FooterPostDisplayItem;->e:Lcom/vkontakte/android/NewsEntry;

    iget-object v4, v4, Lcom/vkontakte/android/NewsEntry;->attachments:Ljava/util/ArrayList;

    .line 84
    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v4

    add-int/lit8 v4, v4, -0x1

    invoke-virtual {v1, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    instance-of v1, v1, Lcom/vkontakte/android/attachments/PrettyCardAttachment;

    if-nez v1, :cond_1

    iget-object v1, p0, Lcom/vkontakte/android/ui/posts/FooterPostDisplayItem;->e:Lcom/vkontakte/android/NewsEntry;

    iget-object v1, v1, Lcom/vkontakte/android/NewsEntry;->attachments:Ljava/util/ArrayList;

    iget-object v4, p0, Lcom/vkontakte/android/ui/posts/FooterPostDisplayItem;->e:Lcom/vkontakte/android/NewsEntry;

    iget-object v4, v4, Lcom/vkontakte/android/NewsEntry;->attachments:Ljava/util/ArrayList;

    .line 85
    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v4

    add-int/lit8 v4, v4, -0x1

    invoke-virtual {v1, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    instance-of v1, v1, Lcom/vkontakte/android/attachments/GeoAttachment;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/vkontakte/android/ui/posts/FooterPostDisplayItem;->e:Lcom/vkontakte/android/NewsEntry;

    iget-object v1, v1, Lcom/vkontakte/android/NewsEntry;->attachments:Ljava/util/ArrayList;

    iget-object v4, p0, Lcom/vkontakte/android/ui/posts/FooterPostDisplayItem;->e:Lcom/vkontakte/android/NewsEntry;

    iget-object v4, v4, Lcom/vkontakte/android/NewsEntry;->attachments:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v4

    add-int/lit8 v4, v4, -0x1

    invoke-virtual {v1, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vkontakte/android/attachments/GeoAttachment;

    iget v1, v1, Lcom/vkontakte/android/attachments/GeoAttachment;->style:I

    const/4 v4, 0x3

    if-eq v1, v4, :cond_1

    :cond_0
    iget-object v1, p0, Lcom/vkontakte/android/ui/posts/FooterPostDisplayItem;->e:Lcom/vkontakte/android/NewsEntry;

    iget-object v1, v1, Lcom/vkontakte/android/NewsEntry;->attachments:Ljava/util/ArrayList;

    iget-object v4, p0, Lcom/vkontakte/android/ui/posts/FooterPostDisplayItem;->e:Lcom/vkontakte/android/NewsEntry;

    iget-object v4, v4, Lcom/vkontakte/android/NewsEntry;->attachments:Ljava/util/ArrayList;

    .line 86
    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v4

    add-int/lit8 v4, v4, -0x1

    invoke-virtual {v1, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    instance-of v1, v1, Lcom/vkontakte/android/attachments/DocumentAttachment;

    if-eqz v1, :cond_6

    iget-object v1, p0, Lcom/vkontakte/android/ui/posts/FooterPostDisplayItem;->e:Lcom/vkontakte/android/NewsEntry;

    iget-object v1, v1, Lcom/vkontakte/android/NewsEntry;->attachments:Ljava/util/ArrayList;

    iget-object v4, p0, Lcom/vkontakte/android/ui/posts/FooterPostDisplayItem;->e:Lcom/vkontakte/android/NewsEntry;

    iget-object v4, v4, Lcom/vkontakte/android/NewsEntry;->attachments:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v4

    add-int/lit8 v4, v4, -0x1

    invoke-virtual {v1, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vkontakte/android/attachments/DocumentAttachment;

    iget-object v1, v1, Lcom/vkontakte/android/attachments/DocumentAttachment;->thumb:Ljava/lang/String;

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_6

    .line 87
    :cond_1
    iget-object v1, p0, Lcom/vkontakte/android/ui/posts/FooterPostDisplayItem;->e:Lcom/vkontakte/android/NewsEntry;

    iget-object v1, v1, Lcom/vkontakte/android/NewsEntry;->attachments:Ljava/util/ArrayList;

    iget-object v4, p0, Lcom/vkontakte/android/ui/posts/FooterPostDisplayItem;->e:Lcom/vkontakte/android/NewsEntry;

    iget-object v4, v4, Lcom/vkontakte/android/NewsEntry;->attachments:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v4

    add-int/lit8 v4, v4, -0x1

    invoke-virtual {v1, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    instance-of v1, v1, Lcom/vkontakte/android/attachments/VideoAttachment;

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/vkontakte/android/ui/posts/FooterPostDisplayItem;->e:Lcom/vkontakte/android/NewsEntry;

    iget-object v1, v1, Lcom/vkontakte/android/NewsEntry;->attachments:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    const/4 v4, 0x1

    if-eq v1, v4, :cond_5

    .line 88
    :cond_2
    iget-object v1, v0, Lcom/vkontakte/android/ui/posts/FooterPostDisplayItem$ViewHolder;->divider:Landroid/view/View;

    invoke-virtual {v1, v7}, Landroid/view/View;->setVisibility(I)V

    .line 97
    :cond_3
    :goto_0
    iget-object v1, p0, Lcom/vkontakte/android/ui/posts/FooterPostDisplayItem;->e:Lcom/vkontakte/android/NewsEntry;

    iget v1, v1, Lcom/vkontakte/android/NewsEntry;->numComments:I

    if-lez v1, :cond_7

    .line 98
    iget-object v1, v0, Lcom/vkontakte/android/ui/posts/FooterPostDisplayItem$ViewHolder;->comments:Landroid/widget/TextView;

    iget-object v4, p0, Lcom/vkontakte/android/ui/posts/FooterPostDisplayItem;->e:Lcom/vkontakte/android/NewsEntry;

    iget v4, v4, Lcom/vkontakte/android/NewsEntry;->numComments:I

    invoke-static {v4}, Lcom/vkontakte/android/Global;->formatNumber(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 99
    iget-object v1, v0, Lcom/vkontakte/android/ui/posts/FooterPostDisplayItem$ViewHolder;->comments:Landroid/widget/TextView;

    invoke-static {v6}, Lcom/vkontakte/android/Global;->scale(F)I

    move-result v4

    invoke-virtual {v1, v4}, Landroid/widget/TextView;->setCompoundDrawablePadding(I)V

    .line 104
    :goto_1
    iget-object v4, v0, Lcom/vkontakte/android/ui/posts/FooterPostDisplayItem$ViewHolder;->comments:Landroid/widget/TextView;

    iget-object v1, p0, Lcom/vkontakte/android/ui/posts/FooterPostDisplayItem;->e:Lcom/vkontakte/android/NewsEntry;

    iget v1, v1, Lcom/vkontakte/android/NewsEntry;->numComments:I

    if-gtz v1, :cond_4

    iget-object v1, p0, Lcom/vkontakte/android/ui/posts/FooterPostDisplayItem;->e:Lcom/vkontakte/android/NewsEntry;

    const/4 v5, 0x2

    invoke-virtual {v1, v5}, Lcom/vkontakte/android/NewsEntry;->flag(I)Z

    move-result v1

    if-eqz v1, :cond_8

    :cond_4
    move v1, v3

    :goto_2
    invoke-virtual {v4, v1}, Landroid/widget/TextView;->setVisibility(I)V

    .line 105
    iget-object v1, p0, Lcom/vkontakte/android/ui/posts/FooterPostDisplayItem;->e:Lcom/vkontakte/android/NewsEntry;

    iget v1, v1, Lcom/vkontakte/android/NewsEntry;->numLikes:I

    if-lez v1, :cond_9

    .line 106
    iget-object v1, v0, Lcom/vkontakte/android/ui/posts/FooterPostDisplayItem$ViewHolder;->likes:Landroid/widget/TextView;

    iget-object v4, p0, Lcom/vkontakte/android/ui/posts/FooterPostDisplayItem;->e:Lcom/vkontakte/android/NewsEntry;

    iget v4, v4, Lcom/vkontakte/android/NewsEntry;->numLikes:I

    invoke-static {v4}, Lcom/vkontakte/android/Global;->formatNumber(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 107
    iget-object v1, v0, Lcom/vkontakte/android/ui/posts/FooterPostDisplayItem$ViewHolder;->likes:Landroid/widget/TextView;

    invoke-static {v6}, Lcom/vkontakte/android/Global;->scale(F)I

    move-result v4

    invoke-virtual {v1, v4}, Landroid/widget/TextView;->setCompoundDrawablePadding(I)V

    .line 112
    :goto_3
    iget-object v1, p0, Lcom/vkontakte/android/ui/posts/FooterPostDisplayItem;->e:Lcom/vkontakte/android/NewsEntry;

    iget v1, v1, Lcom/vkontakte/android/NewsEntry;->numRetweets:I

    if-lez v1, :cond_a

    .line 113
    iget-object v1, v0, Lcom/vkontakte/android/ui/posts/FooterPostDisplayItem$ViewHolder;->reposts:Landroid/widget/TextView;

    iget-object v4, p0, Lcom/vkontakte/android/ui/posts/FooterPostDisplayItem;->e:Lcom/vkontakte/android/NewsEntry;

    iget v4, v4, Lcom/vkontakte/android/NewsEntry;->numRetweets:I

    invoke-static {v4}, Lcom/vkontakte/android/Global;->formatNumber(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 114
    iget-object v1, v0, Lcom/vkontakte/android/ui/posts/FooterPostDisplayItem$ViewHolder;->reposts:Landroid/widget/TextView;

    invoke-static {v6}, Lcom/vkontakte/android/Global;->scale(F)I

    move-result v4

    invoke-virtual {v1, v4}, Landroid/widget/TextView;->setCompoundDrawablePadding(I)V

    .line 119
    :goto_4
    iget-boolean v1, p0, Lcom/vkontakte/android/ui/posts/FooterPostDisplayItem;->showLikes:Z

    if-eqz v1, :cond_b

    .line 120
    iget-object v1, v0, Lcom/vkontakte/android/ui/posts/FooterPostDisplayItem$ViewHolder;->likes:Landroid/widget/TextView;

    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setVisibility(I)V

    .line 121
    iget-object v1, v0, Lcom/vkontakte/android/ui/posts/FooterPostDisplayItem$ViewHolder;->reposts:Landroid/widget/TextView;

    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setVisibility(I)V

    .line 126
    :goto_5
    iget-object v1, v0, Lcom/vkontakte/android/ui/posts/FooterPostDisplayItem$ViewHolder;->likes:Landroid/widget/TextView;

    iget-object v3, p0, Lcom/vkontakte/android/ui/posts/FooterPostDisplayItem;->e:Lcom/vkontakte/android/NewsEntry;

    invoke-virtual {v3, v7}, Lcom/vkontakte/android/NewsEntry;->flag(I)Z

    move-result v3

    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setSelected(Z)V

    .line 127
    iget-object v1, v0, Lcom/vkontakte/android/ui/posts/FooterPostDisplayItem$ViewHolder;->reposts:Landroid/widget/TextView;

    iget-object v3, p0, Lcom/vkontakte/android/ui/posts/FooterPostDisplayItem;->e:Lcom/vkontakte/android/NewsEntry;

    invoke-virtual {v3, v2}, Lcom/vkontakte/android/NewsEntry;->flag(I)Z

    move-result v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setSelected(Z)V

    .line 128
    const v1, 0x7f10008e

    iget-object v2, p0, Lcom/vkontakte/android/ui/posts/FooterPostDisplayItem;->e:Lcom/vkontakte/android/NewsEntry;

    invoke-virtual {p1, v1, v2}, Landroid/view/View;->setTag(ILjava/lang/Object;)V

    .line 129
    iget-object v1, v0, Lcom/vkontakte/android/ui/posts/FooterPostDisplayItem$ViewHolder;->likes:Landroid/widget/TextView;

    iget-object v2, p0, Lcom/vkontakte/android/ui/posts/FooterPostDisplayItem;->likesOnClick:Landroid/view/View$OnClickListener;

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 130
    iget-object v1, v0, Lcom/vkontakte/android/ui/posts/FooterPostDisplayItem$ViewHolder;->reposts:Landroid/widget/TextView;

    iget-object v2, p0, Lcom/vkontakte/android/ui/posts/FooterPostDisplayItem;->repostsOnClick:Landroid/view/View$OnClickListener;

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 131
    iget-object v1, v0, Lcom/vkontakte/android/ui/posts/FooterPostDisplayItem$ViewHolder;->comments:Landroid/widget/TextView;

    iget-object v2, p0, Lcom/vkontakte/android/ui/posts/FooterPostDisplayItem;->commentsOnClick:Landroid/view/View$OnClickListener;

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 132
    return-void

    .line 90
    :cond_5
    iget-object v1, v0, Lcom/vkontakte/android/ui/posts/FooterPostDisplayItem$ViewHolder;->divider:Landroid/view/View;

    invoke-virtual {v1, v3}, Landroid/view/View;->setVisibility(I)V

    goto/16 :goto_0

    .line 93
    :cond_6
    iget-object v1, v0, Lcom/vkontakte/android/ui/posts/FooterPostDisplayItem$ViewHolder;->divider:Landroid/view/View;

    invoke-virtual {v1, v3}, Landroid/view/View;->setVisibility(I)V

    goto/16 :goto_0

    .line 101
    :cond_7
    iget-object v1, v0, Lcom/vkontakte/android/ui/posts/FooterPostDisplayItem$ViewHolder;->comments:Landroid/widget/TextView;

    const-string/jumbo v4, ""

    invoke-virtual {v1, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 102
    iget-object v1, v0, Lcom/vkontakte/android/ui/posts/FooterPostDisplayItem$ViewHolder;->comments:Landroid/widget/TextView;

    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setCompoundDrawablePadding(I)V

    goto/16 :goto_1

    :cond_8
    move v1, v2

    .line 104
    goto/16 :goto_2

    .line 109
    :cond_9
    iget-object v1, v0, Lcom/vkontakte/android/ui/posts/FooterPostDisplayItem$ViewHolder;->likes:Landroid/widget/TextView;

    const-string/jumbo v4, ""

    invoke-virtual {v1, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 110
    iget-object v1, v0, Lcom/vkontakte/android/ui/posts/FooterPostDisplayItem$ViewHolder;->likes:Landroid/widget/TextView;

    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setCompoundDrawablePadding(I)V

    goto/16 :goto_3

    .line 116
    :cond_a
    iget-object v1, v0, Lcom/vkontakte/android/ui/posts/FooterPostDisplayItem$ViewHolder;->reposts:Landroid/widget/TextView;

    const-string/jumbo v4, ""

    invoke-virtual {v1, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 117
    iget-object v1, v0, Lcom/vkontakte/android/ui/posts/FooterPostDisplayItem$ViewHolder;->reposts:Landroid/widget/TextView;

    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setCompoundDrawablePadding(I)V

    goto :goto_4

    .line 123
    :cond_b
    iget-object v1, v0, Lcom/vkontakte/android/ui/posts/FooterPostDisplayItem$ViewHolder;->likes:Landroid/widget/TextView;

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setVisibility(I)V

    .line 124
    iget-object v1, v0, Lcom/vkontakte/android/ui/posts/FooterPostDisplayItem$ViewHolder;->reposts:Landroid/widget/TextView;

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setVisibility(I)V

    goto :goto_5
.end method

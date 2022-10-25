.class public Lcom/vkontakte/android/ui/posts/FriendsRecommPostDisplayItem;
.super Lcom/vkontakte/android/ui/posts/PostDisplayItem;
.source "FriendsRecommPostDisplayItem.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vkontakte/android/ui/posts/FriendsRecommPostDisplayItem$FriendsRecommAdapter;,
        Lcom/vkontakte/android/ui/posts/FriendsRecommPostDisplayItem$FriendsRecommViewHolder;
    }
.end annotation


# instance fields
.field public att:Lcom/vkontakte/android/attachments/FriendsRecommAttachment;

.field public listPosition:I

.field private position:I

.field private positionOffset:I

.field private post:Lcom/vkontakte/android/NewsEntry;


# direct methods
.method public constructor <init>(Lcom/vkontakte/android/attachments/FriendsRecommAttachment;Lcom/vkontakte/android/NewsEntry;I)V
    .locals 0
    .param p1, "att"    # Lcom/vkontakte/android/attachments/FriendsRecommAttachment;
    .param p2, "post"    # Lcom/vkontakte/android/NewsEntry;
    .param p3, "listPosition"    # I

    .prologue
    .line 54
    invoke-direct {p0, p2}, Lcom/vkontakte/android/ui/posts/PostDisplayItem;-><init>(Lcom/vkontakte/android/NewsEntry;)V

    .line 55
    iput-object p1, p0, Lcom/vkontakte/android/ui/posts/FriendsRecommPostDisplayItem;->att:Lcom/vkontakte/android/attachments/FriendsRecommAttachment;

    .line 56
    iput-object p2, p0, Lcom/vkontakte/android/ui/posts/FriendsRecommPostDisplayItem;->post:Lcom/vkontakte/android/NewsEntry;

    .line 57
    iput p3, p0, Lcom/vkontakte/android/ui/posts/FriendsRecommPostDisplayItem;->listPosition:I

    .line 58
    return-void
.end method

.method static synthetic access$000(Lcom/vkontakte/android/ui/posts/FriendsRecommPostDisplayItem;)I
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/ui/posts/FriendsRecommPostDisplayItem;

    .prologue
    .line 46
    iget v0, p0, Lcom/vkontakte/android/ui/posts/FriendsRecommPostDisplayItem;->position:I

    return v0
.end method

.method static synthetic access$002(Lcom/vkontakte/android/ui/posts/FriendsRecommPostDisplayItem;I)I
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/ui/posts/FriendsRecommPostDisplayItem;
    .param p1, "x1"    # I

    .prologue
    .line 46
    iput p1, p0, Lcom/vkontakte/android/ui/posts/FriendsRecommPostDisplayItem;->position:I

    return p1
.end method

.method static synthetic access$100(Lcom/vkontakte/android/ui/posts/FriendsRecommPostDisplayItem;)I
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/ui/posts/FriendsRecommPostDisplayItem;

    .prologue
    .line 46
    iget v0, p0, Lcom/vkontakte/android/ui/posts/FriendsRecommPostDisplayItem;->positionOffset:I

    return v0
.end method

.method static synthetic access$102(Lcom/vkontakte/android/ui/posts/FriendsRecommPostDisplayItem;I)I
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/ui/posts/FriendsRecommPostDisplayItem;
    .param p1, "x1"    # I

    .prologue
    .line 46
    iput p1, p0, Lcom/vkontakte/android/ui/posts/FriendsRecommPostDisplayItem;->positionOffset:I

    return p1
.end method

.method static synthetic access$1100(Lcom/vkontakte/android/ui/posts/FriendsRecommPostDisplayItem;)Lcom/vkontakte/android/NewsEntry;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/ui/posts/FriendsRecommPostDisplayItem;

    .prologue
    .line 46
    iget-object v0, p0, Lcom/vkontakte/android/ui/posts/FriendsRecommPostDisplayItem;->post:Lcom/vkontakte/android/NewsEntry;

    return-object v0
.end method

.method public static createView(Landroid/content/Context;)Landroid/view/View;
    .locals 5
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    const/4 v4, 0x0

    .line 66
    const v2, 0x7f0301b4

    const/4 v3, 0x0

    invoke-static {p0, v2, v3}, Landroid/view/View;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v1

    .line 67
    .local v1, "v":Landroid/view/View;
    const v2, 0x7f1004c3

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lme/grishka/appkit/views/UsableRecyclerView;

    .line 68
    .local v0, "r":Lme/grishka/appkit/views/UsableRecyclerView;
    new-instance v2, Landroid/support/v7/widget/LinearLayoutManager;

    invoke-direct {v2, p0, v4, v4}, Landroid/support/v7/widget/LinearLayoutManager;-><init>(Landroid/content/Context;IZ)V

    invoke-virtual {v0, v2}, Lme/grishka/appkit/views/UsableRecyclerView;->setLayoutManager(Landroid/support/v7/widget/RecyclerView$LayoutManager;)V

    .line 69
    new-instance v2, Lcom/vkontakte/android/ui/posts/FriendsRecommPostDisplayItem$1;

    invoke-direct {v2}, Lcom/vkontakte/android/ui/posts/FriendsRecommPostDisplayItem$1;-><init>()V

    invoke-virtual {v0, v2}, Lme/grishka/appkit/views/UsableRecyclerView;->addItemDecoration(Landroid/support/v7/widget/RecyclerView$ItemDecoration;)V

    .line 77
    const v2, 0x7f020146

    invoke-virtual {v0, v2}, Lme/grishka/appkit/views/UsableRecyclerView;->setSelector(I)V

    .line 78
    const/4 v2, 0x1

    invoke-virtual {v0, v2}, Lme/grishka/appkit/views/UsableRecyclerView;->setDrawSelectorOnTop(Z)V

    .line 79
    const v2, 0x7f1004c4

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    new-instance v3, Lcom/vkontakte/android/ui/posts/FriendsRecommPostDisplayItem$2;

    invoke-direct {v3}, Lcom/vkontakte/android/ui/posts/FriendsRecommPostDisplayItem$2;-><init>()V

    invoke-virtual {v2, v3}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 86
    return-object v1
.end method


# virtual methods
.method public getImageCount()I
    .locals 1

    .prologue
    .line 113
    const/4 v0, 0x0

    return v0
.end method

.method public getImageURL(I)Ljava/lang/String;
    .locals 1
    .param p1, "image"    # I

    .prologue
    .line 118
    const/4 v0, 0x0

    return-object v0
.end method

.method public getType()I
    .locals 1

    .prologue
    .line 62
    const/16 v0, 0xd

    return v0
.end method

.method public onBindView(Landroid/view/View;)V
    .locals 6
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 91
    const v2, 0x7f1004c3

    invoke-virtual {p1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lme/grishka/appkit/views/UsableRecyclerView;

    .line 92
    .local v1, "r":Lme/grishka/appkit/views/UsableRecyclerView;
    new-instance v0, Lcom/vkontakte/android/ui/posts/FriendsRecommPostDisplayItem$FriendsRecommAdapter;

    iget-object v2, p0, Lcom/vkontakte/android/ui/posts/FriendsRecommPostDisplayItem;->att:Lcom/vkontakte/android/attachments/FriendsRecommAttachment;

    iget-object v2, v2, Lcom/vkontakte/android/attachments/FriendsRecommAttachment;->profiles:Ljava/util/ArrayList;

    invoke-direct {v0, p0, v2}, Lcom/vkontakte/android/ui/posts/FriendsRecommPostDisplayItem$FriendsRecommAdapter;-><init>(Lcom/vkontakte/android/ui/posts/FriendsRecommPostDisplayItem;Ljava/util/List;)V

    .line 93
    .local v0, "adapter":Lcom/vkontakte/android/ui/posts/FriendsRecommPostDisplayItem$FriendsRecommAdapter;
    invoke-virtual {v1, v0}, Lme/grishka/appkit/views/UsableRecyclerView;->setAdapter(Landroid/support/v7/widget/RecyclerView$Adapter;)V

    .line 94
    new-instance v2, Lcom/vkontakte/android/ui/posts/FriendsRecommPostDisplayItem$3;

    invoke-direct {v2, p0, v1, v0}, Lcom/vkontakte/android/ui/posts/FriendsRecommPostDisplayItem$3;-><init>(Lcom/vkontakte/android/ui/posts/FriendsRecommPostDisplayItem;Lme/grishka/appkit/views/UsableRecyclerView;Lcom/vkontakte/android/ui/posts/FriendsRecommPostDisplayItem$FriendsRecommAdapter;)V

    invoke-virtual {v1, v2}, Lme/grishka/appkit/views/UsableRecyclerView;->addOnAttachStateChangeListener(Landroid/view/View$OnAttachStateChangeListener;)V

    .line 108
    const-string/jumbo v2, "view_block"

    invoke-static {v2}, Lcom/vkontakte/android/data/Analytics;->track(Ljava/lang/String;)Lcom/vkontakte/android/data/Analytics$EventBuilder;

    move-result-object v2

    invoke-virtual {v2}, Lcom/vkontakte/android/data/Analytics$EventBuilder;->collapse()Lcom/vkontakte/android/data/Analytics$EventBuilder;

    move-result-object v2

    invoke-virtual {v2}, Lcom/vkontakte/android/data/Analytics$EventBuilder;->unique()Lcom/vkontakte/android/data/Analytics$EventBuilder;

    move-result-object v2

    const-string/jumbo v3, "blocks"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "friends_recomm|"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget v5, p0, Lcom/vkontakte/android/ui/posts/FriendsRecommPostDisplayItem;->listPosition:I

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string/jumbo v5, "|"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lcom/vkontakte/android/ui/posts/FriendsRecommPostDisplayItem;->post:Lcom/vkontakte/android/NewsEntry;

    iget v5, v5, Lcom/vkontakte/android/NewsEntry;->time:I

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Lcom/vkontakte/android/data/Analytics$EventBuilder;->addParam(Ljava/lang/String;Ljava/lang/Object;)Lcom/vkontakte/android/data/Analytics$EventBuilder;

    move-result-object v2

    invoke-virtual {v2}, Lcom/vkontakte/android/data/Analytics$EventBuilder;->commit()Lcom/vkontakte/android/data/Analytics$EventBuilder;

    .line 109
    return-void
.end method

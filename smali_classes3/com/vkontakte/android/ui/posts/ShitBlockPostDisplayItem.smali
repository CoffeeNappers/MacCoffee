.class public Lcom/vkontakte/android/ui/posts/ShitBlockPostDisplayItem;
.super Lcom/vkontakte/android/ui/posts/AdBlockPostDisplayItem;
.source "ShitBlockPostDisplayItem.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vkontakte/android/ui/posts/ShitBlockPostDisplayItem$ViewHolderItem;,
        Lcom/vkontakte/android/ui/posts/ShitBlockPostDisplayItem$ViewHolder;
    }
.end annotation


# instance fields
.field private final postInteract:Lcom/vkontakte/android/data/PostInteract;

.field private final referrer:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lcom/vkontakte/android/NewsEntry;Ljava/lang/String;Lcom/vkontakte/android/data/PostInteract;)V
    .locals 0
    .param p1, "_post"    # Lcom/vkontakte/android/NewsEntry;
    .param p2, "referrer"    # Ljava/lang/String;
    .param p3, "postInteract"    # Lcom/vkontakte/android/data/PostInteract;

    .prologue
    .line 39
    invoke-direct {p0, p1}, Lcom/vkontakte/android/ui/posts/AdBlockPostDisplayItem;-><init>(Lcom/vkontakte/android/NewsEntry;)V

    .line 40
    iput-object p2, p0, Lcom/vkontakte/android/ui/posts/ShitBlockPostDisplayItem;->referrer:Ljava/lang/String;

    .line 41
    iput-object p3, p0, Lcom/vkontakte/android/ui/posts/ShitBlockPostDisplayItem;->postInteract:Lcom/vkontakte/android/data/PostInteract;

    .line 42
    return-void
.end method

.method static synthetic access$000(Lcom/vkontakte/android/ui/posts/ShitBlockPostDisplayItem;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/ui/posts/ShitBlockPostDisplayItem;

    .prologue
    .line 33
    iget-object v0, p0, Lcom/vkontakte/android/ui/posts/ShitBlockPostDisplayItem;->referrer:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$100(Lcom/vkontakte/android/ui/posts/ShitBlockPostDisplayItem;)Lcom/vkontakte/android/data/PostInteract;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/ui/posts/ShitBlockPostDisplayItem;

    .prologue
    .line 33
    iget-object v0, p0, Lcom/vkontakte/android/ui/posts/ShitBlockPostDisplayItem;->postInteract:Lcom/vkontakte/android/data/PostInteract;

    return-object v0
.end method

.method public static createView(Landroid/content/Context;)Landroid/view/View;
    .locals 1
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 121
    new-instance v0, Lcom/vkontakte/android/ui/posts/ShitBlockPostDisplayItem$ViewHolder;

    invoke-direct {v0, p0}, Lcom/vkontakte/android/ui/posts/ShitBlockPostDisplayItem$ViewHolder;-><init>(Landroid/content/Context;)V

    iget-object v0, v0, Lcom/vkontakte/android/ui/posts/ShitBlockPostDisplayItem$ViewHolder;->itemView:Landroid/view/View;

    return-object v0
.end method


# virtual methods
.method public getAutoPlayItem()Lcom/vkontakte/android/media/AutoPlay;
    .locals 5

    .prologue
    .line 110
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 111
    .local v2, "playList":Ljava/util/List;, "Ljava/util/List<Lcom/vkontakte/android/media/AutoPlay;>;"
    iget-object v3, p0, Lcom/vkontakte/android/ui/posts/ShitBlockPostDisplayItem;->post:Lcom/vkontakte/android/NewsEntry;

    iget-object v3, v3, Lcom/vkontakte/android/NewsEntry;->attachments:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_0
    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vkontakte/android/attachments/Attachment;

    .local v1, "att":Lcom/vkontakte/android/attachments/Attachment;
    move-object v0, v1

    .line 112
    check-cast v0, Lcom/vkontakte/android/attachments/ShitAttachment;

    .line 113
    .local v0, "a":Lcom/vkontakte/android/attachments/ShitAttachment;
    iget-object v4, v0, Lcom/vkontakte/android/attachments/ShitAttachment;->video:Lcom/vkontakte/android/attachments/VideoAttachment;

    if-eqz v4, :cond_0

    .line 114
    iget-object v4, v0, Lcom/vkontakte/android/attachments/ShitAttachment;->video:Lcom/vkontakte/android/attachments/VideoAttachment;

    invoke-interface {v2, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 117
    .end local v0    # "a":Lcom/vkontakte/android/attachments/ShitAttachment;
    .end local v1    # "att":Lcom/vkontakte/android/attachments/Attachment;
    :cond_1
    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v3

    const/4 v4, 0x1

    if-ne v3, v4, :cond_2

    const/4 v3, 0x0

    invoke-interface {v2, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/vkontakte/android/media/AutoPlay;

    :goto_1
    return-object v3

    :cond_2
    const/4 v3, 0x0

    goto :goto_1
.end method

.method public getImageCount()I
    .locals 1

    .prologue
    .line 51
    iget-object v0, p0, Lcom/vkontakte/android/ui/posts/ShitBlockPostDisplayItem;->post:Lcom/vkontakte/android/NewsEntry;

    iget-object v0, v0, Lcom/vkontakte/android/NewsEntry;->attachments:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    mul-int/lit8 v0, v0, 0x2

    return v0
.end method

.method public getImageURL(I)Ljava/lang/String;
    .locals 4
    .param p1, "image"    # I

    .prologue
    .line 95
    div-int/lit8 v1, p1, 0x2

    .line 96
    .local v1, "idx":I
    iget-object v2, p0, Lcom/vkontakte/android/ui/posts/ShitBlockPostDisplayItem;->post:Lcom/vkontakte/android/NewsEntry;

    iget-object v2, v2, Lcom/vkontakte/android/NewsEntry;->attachments:Ljava/util/ArrayList;

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/attachments/ShitAttachment;

    .line 97
    .local v0, "a":Lcom/vkontakte/android/attachments/ShitAttachment;
    rem-int/lit8 v2, p1, 0x2

    const/4 v3, 0x1

    if-ne v2, v3, :cond_2

    .line 98
    iget-object v2, v0, Lcom/vkontakte/android/attachments/ShitAttachment;->video:Lcom/vkontakte/android/attachments/VideoAttachment;

    if-nez v2, :cond_1

    .line 99
    iget-object v2, v0, Lcom/vkontakte/android/attachments/ShitAttachment;->photo:Lcom/vkontakte/android/attachments/PhotoAttachment;

    if-eqz v2, :cond_0

    iget-object v2, v0, Lcom/vkontakte/android/attachments/ShitAttachment;->photo:Lcom/vkontakte/android/attachments/PhotoAttachment;

    invoke-virtual {v2}, Lcom/vkontakte/android/attachments/PhotoAttachment;->getThumbURL()Ljava/lang/String;

    move-result-object v2

    .line 104
    :goto_0
    return-object v2

    .line 99
    :cond_0
    const/4 v2, 0x0

    goto :goto_0

    .line 101
    :cond_1
    iget-object v2, v0, Lcom/vkontakte/android/attachments/ShitAttachment;->video:Lcom/vkontakte/android/attachments/VideoAttachment;

    invoke-virtual {v2}, Lcom/vkontakte/android/attachments/VideoAttachment;->getImageURL()Ljava/lang/String;

    move-result-object v2

    goto :goto_0

    .line 104
    :cond_2
    iget-object v2, v0, Lcom/vkontakte/android/attachments/ShitAttachment;->userPhoto:Ljava/lang/String;

    goto :goto_0
.end method

.method public getType()I
    .locals 1

    .prologue
    .line 46
    const/16 v0, 0xe

    return v0
.end method

.method public onBindView(Landroid/view/View;)V
    .locals 5
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 56
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/vkontakte/android/ui/posts/ShitBlockPostDisplayItem$ViewHolder;

    .line 57
    .local v2, "viewHolder":Lcom/vkontakte/android/ui/posts/ShitBlockPostDisplayItem$ViewHolder;
    iget-object v3, p0, Lcom/vkontakte/android/ui/posts/ShitBlockPostDisplayItem;->post:Lcom/vkontakte/android/NewsEntry;

    invoke-virtual {v2, v3, p0}, Lcom/vkontakte/android/ui/posts/ShitBlockPostDisplayItem$ViewHolder;->bind(Lcom/vkontakte/android/NewsEntry;Lcom/vkontakte/android/ui/posts/ShitBlockPostDisplayItem;)V

    .line 61
    iget-object v3, p0, Lcom/vkontakte/android/ui/posts/ShitBlockPostDisplayItem;->post:Lcom/vkontakte/android/NewsEntry;

    iget-object v3, v3, Lcom/vkontakte/android/NewsEntry;->attachments:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v0

    .line 62
    .local v0, "count":I
    iget-object v3, v2, Lcom/vkontakte/android/ui/posts/ShitBlockPostDisplayItem$ViewHolder;->scroller:Landroid/widget/HorizontalScrollView;

    invoke-virtual {v3}, Landroid/widget/HorizontalScrollView;->getTag()Ljava/lang/Object;

    move-result-object v3

    if-eqz v3, :cond_0

    .line 63
    iget-object v4, v2, Lcom/vkontakte/android/ui/posts/ShitBlockPostDisplayItem$ViewHolder;->scroller:Landroid/widget/HorizontalScrollView;

    iget-object v3, v2, Lcom/vkontakte/android/ui/posts/ShitBlockPostDisplayItem$ViewHolder;->scroller:Landroid/widget/HorizontalScrollView;

    invoke-virtual {v3}, Landroid/widget/HorizontalScrollView;->getTag()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/view/View$OnLayoutChangeListener;

    invoke-virtual {v4, v3}, Landroid/widget/HorizontalScrollView;->removeOnLayoutChangeListener(Landroid/view/View$OnLayoutChangeListener;)V

    .line 64
    iget-object v3, v2, Lcom/vkontakte/android/ui/posts/ShitBlockPostDisplayItem$ViewHolder;->scroller:Landroid/widget/HorizontalScrollView;

    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Landroid/widget/HorizontalScrollView;->setTag(Ljava/lang/Object;)V

    .line 66
    :cond_0
    const/4 v3, 0x1

    if-ne v0, v3, :cond_1

    .line 67
    new-instance v1, Lcom/vkontakte/android/ui/posts/ShitBlockPostDisplayItem$1;

    invoke-direct {v1, p0, v2}, Lcom/vkontakte/android/ui/posts/ShitBlockPostDisplayItem$1;-><init>(Lcom/vkontakte/android/ui/posts/ShitBlockPostDisplayItem;Lcom/vkontakte/android/ui/posts/ShitBlockPostDisplayItem$ViewHolder;)V

    .line 88
    .local v1, "layoutChangeListener":Landroid/view/View$OnLayoutChangeListener;
    iget-object v3, v2, Lcom/vkontakte/android/ui/posts/ShitBlockPostDisplayItem$ViewHolder;->scroller:Landroid/widget/HorizontalScrollView;

    invoke-virtual {v3, v1}, Landroid/widget/HorizontalScrollView;->addOnLayoutChangeListener(Landroid/view/View$OnLayoutChangeListener;)V

    .line 89
    iget-object v3, v2, Lcom/vkontakte/android/ui/posts/ShitBlockPostDisplayItem$ViewHolder;->scroller:Landroid/widget/HorizontalScrollView;

    invoke-virtual {v3, v1}, Landroid/widget/HorizontalScrollView;->setTag(Ljava/lang/Object;)V

    .line 91
    .end local v1    # "layoutChangeListener":Landroid/view/View$OnLayoutChangeListener;
    :cond_1
    return-void
.end method

.class public Lcom/vkontakte/android/ui/posts/AttachContainerPostDisplayItem;
.super Lcom/vkontakte/android/ui/posts/PostDisplayItem;
.source "AttachContainerPostDisplayItem.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vkontakte/android/ui/posts/AttachContainerPostDisplayItem$ViewHolder;
    }
.end annotation


# instance fields
.field public atts:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vkontakte/android/attachments/Attachment;",
            ">;"
        }
    .end annotation
.end field

.field private fromList:Z

.field private sidePadding:Z


# direct methods
.method public constructor <init>(Lcom/vkontakte/android/NewsEntry;Ljava/util/ArrayList;ZZ)V
    .locals 1
    .param p1, "entry"    # Lcom/vkontakte/android/NewsEntry;
    .param p3, "list"    # Z
    .param p4, "sidePadding"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/vkontakte/android/NewsEntry;",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vkontakte/android/attachments/Attachment;",
            ">;ZZ)V"
        }
    .end annotation

    .prologue
    .line 25
    .local p2, "_atts":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/attachments/Attachment;>;"
    invoke-direct {p0, p1}, Lcom/vkontakte/android/ui/posts/PostDisplayItem;-><init>(Lcom/vkontakte/android/NewsEntry;)V

    .line 20
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/ui/posts/AttachContainerPostDisplayItem;->atts:Ljava/util/ArrayList;

    .line 26
    iget-object v0, p0, Lcom/vkontakte/android/ui/posts/AttachContainerPostDisplayItem;->atts:Ljava/util/ArrayList;

    invoke-virtual {v0, p2}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 28
    iput-boolean p3, p0, Lcom/vkontakte/android/ui/posts/AttachContainerPostDisplayItem;->fromList:Z

    .line 29
    iput-boolean p4, p0, Lcom/vkontakte/android/ui/posts/AttachContainerPostDisplayItem;->sidePadding:Z

    .line 30
    return-void
.end method

.method public static createView(Landroid/content/Context;)Landroid/view/View;
    .locals 4
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 65
    new-instance v2, Landroid/widget/FrameLayout;

    invoke-direct {v2, p0}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 66
    .local v2, "view":Landroid/view/View;
    new-instance v0, Lcom/vkontakte/android/ui/FlowLayout;

    invoke-direct {v0, p0}, Lcom/vkontakte/android/ui/FlowLayout;-><init>(Landroid/content/Context;)V

    .local v0, "fl":Lcom/vkontakte/android/ui/FlowLayout;
    move-object v3, v2

    .line 67
    check-cast v3, Landroid/widget/FrameLayout;

    invoke-virtual {v3, v0}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;)V

    .line 68
    new-instance v1, Lcom/vkontakte/android/ui/posts/AttachContainerPostDisplayItem$ViewHolder;

    const/4 v3, 0x0

    invoke-direct {v1, v3}, Lcom/vkontakte/android/ui/posts/AttachContainerPostDisplayItem$ViewHolder;-><init>(Lcom/vkontakte/android/ui/posts/AttachContainerPostDisplayItem$1;)V

    .line 69
    .local v1, "holder":Lcom/vkontakte/android/ui/posts/AttachContainerPostDisplayItem$ViewHolder;
    iput-object v0, v1, Lcom/vkontakte/android/ui/posts/AttachContainerPostDisplayItem$ViewHolder;->flowLayout:Lcom/vkontakte/android/ui/FlowLayout;

    .line 70
    invoke-virtual {v2, v1}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 71
    return-object v2
.end method


# virtual methods
.method public getAutoPlayItem()Lcom/vkontakte/android/media/AutoPlay;
    .locals 4

    .prologue
    const/4 v2, 0x0

    .line 107
    iget-object v1, p0, Lcom/vkontakte/android/ui/posts/AttachContainerPostDisplayItem;->atts:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    const/4 v3, 0x1

    if-ne v1, v3, :cond_1

    .line 108
    iget-object v1, p0, Lcom/vkontakte/android/ui/posts/AttachContainerPostDisplayItem;->atts:Ljava/util/ArrayList;

    const/4 v3, 0x0

    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/attachments/Attachment;

    .line 109
    .local v0, "att":Lcom/vkontakte/android/attachments/Attachment;
    instance-of v1, v0, Lcom/vkontakte/android/media/AutoPlay;

    if-eqz v1, :cond_0

    move-object v1, v0

    check-cast v1, Lcom/vkontakte/android/media/AutoPlay;

    invoke-interface {v1}, Lcom/vkontakte/android/media/AutoPlay;->canAutoPlay()Z

    move-result v1

    if-eqz v1, :cond_0

    check-cast v0, Lcom/vkontakte/android/media/AutoPlay;

    .line 111
    .end local v0    # "att":Lcom/vkontakte/android/attachments/Attachment;
    :goto_0
    return-object v0

    .restart local v0    # "att":Lcom/vkontakte/android/attachments/Attachment;
    :cond_0
    move-object v0, v2

    .line 109
    goto :goto_0

    .end local v0    # "att":Lcom/vkontakte/android/attachments/Attachment;
    :cond_1
    move-object v0, v2

    .line 111
    goto :goto_0
.end method

.method public getImageCount()I
    .locals 4

    .prologue
    .line 39
    const/4 v1, 0x0

    .line 40
    .local v1, "count":I
    iget-object v2, p0, Lcom/vkontakte/android/ui/posts/AttachContainerPostDisplayItem;->atts:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_0
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/attachments/Attachment;

    .line 41
    .local v0, "att":Lcom/vkontakte/android/attachments/Attachment;
    instance-of v3, v0, Lcom/vkontakte/android/attachments/ImageAttachment;

    if-eqz v3, :cond_0

    .line 42
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 45
    .end local v0    # "att":Lcom/vkontakte/android/attachments/Attachment;
    :cond_1
    return v1
.end method

.method public getImageURL(I)Ljava/lang/String;
    .locals 4
    .param p1, "image"    # I

    .prologue
    .line 50
    const/4 v1, 0x0

    .line 51
    .local v1, "count":I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    iget-object v3, p0, Lcom/vkontakte/android/ui/posts/AttachContainerPostDisplayItem;->atts:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v3

    if-ge v2, v3, :cond_2

    .line 52
    iget-object v3, p0, Lcom/vkontakte/android/ui/posts/AttachContainerPostDisplayItem;->atts:Ljava/util/ArrayList;

    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/attachments/Attachment;

    .line 53
    .local v0, "att":Lcom/vkontakte/android/attachments/Attachment;
    instance-of v3, v0, Lcom/vkontakte/android/attachments/ImageAttachment;

    if-eqz v3, :cond_1

    .line 54
    if-ne v1, p1, :cond_0

    .line 55
    check-cast v0, Lcom/vkontakte/android/attachments/ImageAttachment;

    .end local v0    # "att":Lcom/vkontakte/android/attachments/Attachment;
    invoke-interface {v0}, Lcom/vkontakte/android/attachments/ImageAttachment;->getImageURL()Ljava/lang/String;

    move-result-object v3

    .line 60
    :goto_1
    return-object v3

    .line 57
    .restart local v0    # "att":Lcom/vkontakte/android/attachments/Attachment;
    :cond_0
    add-int/lit8 v1, v1, 0x1

    .line 51
    :cond_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 60
    .end local v0    # "att":Lcom/vkontakte/android/attachments/Attachment;
    :cond_2
    const/4 v3, 0x0

    goto :goto_1
.end method

.method public getType()I
    .locals 1

    .prologue
    .line 34
    const/16 v0, 0x9

    return v0
.end method

.method public onBindView(Landroid/view/View;)V
    .locals 11
    .param p1, "view"    # Landroid/view/View;

    .prologue
    const v10, 0x7f090027

    const/4 v7, 0x0

    const/high16 v9, 0x41000000    # 8.0f

    .line 76
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/vkontakte/android/ui/posts/AttachContainerPostDisplayItem$ViewHolder;

    .line 77
    .local v2, "holder":Lcom/vkontakte/android/ui/posts/AttachContainerPostDisplayItem$ViewHolder;
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_0
    iget-object v6, v2, Lcom/vkontakte/android/ui/posts/AttachContainerPostDisplayItem$ViewHolder;->flowLayout:Lcom/vkontakte/android/ui/FlowLayout;

    invoke-virtual {v6}, Lcom/vkontakte/android/ui/FlowLayout;->getChildCount()I

    move-result v6

    if-ge v3, v6, :cond_2

    .line 78
    iget-object v6, v2, Lcom/vkontakte/android/ui/posts/AttachContainerPostDisplayItem$ViewHolder;->flowLayout:Lcom/vkontakte/android/ui/FlowLayout;

    invoke-virtual {v6, v3}, Lcom/vkontakte/android/ui/FlowLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    .line 79
    .local v1, "att":Landroid/view/View;
    invoke-virtual {v1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v5

    .line 80
    .local v5, "tag":Ljava/lang/Object;
    instance-of v6, v5, Ljava/lang/String;

    if-nez v6, :cond_0

    instance-of v6, v5, Lcom/vkontakte/android/attachments/AttachmentViewHolder;

    if-eqz v6, :cond_1

    .line 81
    :cond_0
    invoke-virtual {v1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v1, v6}, Lcom/vkontakte/android/attachments/Attachment;->reuseView(Landroid/view/View;Ljava/lang/String;)V

    .line 77
    :cond_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 84
    .end local v1    # "att":Landroid/view/View;
    .end local v5    # "tag":Ljava/lang/Object;
    :cond_2
    iget-object v6, v2, Lcom/vkontakte/android/ui/posts/AttachContainerPostDisplayItem$ViewHolder;->flowLayout:Lcom/vkontakte/android/ui/FlowLayout;

    invoke-virtual {v6}, Lcom/vkontakte/android/ui/FlowLayout;->removeAllViews()V

    .line 85
    iget-boolean v6, p0, Lcom/vkontakte/android/ui/posts/AttachContainerPostDisplayItem;->sidePadding:Z

    if-eqz v6, :cond_4

    .line 86
    invoke-virtual {p1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v6

    invoke-virtual {v6, v10}, Landroid/content/res/Resources;->getDimensionPixelOffset(I)I

    move-result v6

    invoke-static {v9}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v7

    invoke-virtual {p1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    invoke-virtual {v8, v10}, Landroid/content/res/Resources;->getDimensionPixelOffset(I)I

    move-result v8

    invoke-static {v9}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v9

    invoke-virtual {p1, v6, v7, v8, v9}, Landroid/view/View;->setPadding(IIII)V

    .line 90
    :goto_1
    const/4 v3, 0x0

    :goto_2
    iget-object v6, p0, Lcom/vkontakte/android/ui/posts/AttachContainerPostDisplayItem;->atts:Ljava/util/ArrayList;

    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    move-result v6

    if-ge v3, v6, :cond_7

    .line 91
    iget-object v6, p0, Lcom/vkontakte/android/ui/posts/AttachContainerPostDisplayItem;->atts:Ljava/util/ArrayList;

    invoke-virtual {v6, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vkontakte/android/attachments/Attachment;

    .line 92
    .local v1, "att":Lcom/vkontakte/android/attachments/Attachment;
    invoke-virtual {v1}, Lcom/vkontakte/android/attachments/Attachment;->overrideLayoutParams()Lcom/vkontakte/android/ui/FlowLayout$LayoutParams;

    move-result-object v4

    .line 93
    .local v4, "lp":Lcom/vkontakte/android/ui/FlowLayout$LayoutParams;
    iget-boolean v6, p0, Lcom/vkontakte/android/ui/posts/AttachContainerPostDisplayItem;->fromList:Z

    if-eqz v6, :cond_5

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v6

    const/4 v7, 0x0

    invoke-virtual {v1, v6, v7}, Lcom/vkontakte/android/attachments/Attachment;->getViewForList(Landroid/content/Context;Landroid/view/View;)Landroid/view/View;

    move-result-object v0

    .line 94
    .local v0, "addingView":Landroid/view/View;
    :goto_3
    if-eqz v4, :cond_6

    .line 95
    iget-object v6, v2, Lcom/vkontakte/android/ui/posts/AttachContainerPostDisplayItem$ViewHolder;->flowLayout:Lcom/vkontakte/android/ui/FlowLayout;

    invoke-virtual {v6, v0, v4}, Lcom/vkontakte/android/ui/FlowLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 99
    :goto_4
    instance-of v6, v1, Lcom/vkontakte/android/attachments/ImageAttachment;

    if-eqz v6, :cond_3

    .line 100
    check-cast v1, Lcom/vkontakte/android/attachments/ImageAttachment;

    .end local v1    # "att":Lcom/vkontakte/android/attachments/Attachment;
    invoke-interface {v1, v0}, Lcom/vkontakte/android/attachments/ImageAttachment;->bind(Landroid/view/View;)V

    .line 90
    :cond_3
    add-int/lit8 v3, v3, 0x1

    goto :goto_2

    .line 88
    .end local v0    # "addingView":Landroid/view/View;
    .end local v4    # "lp":Lcom/vkontakte/android/ui/FlowLayout$LayoutParams;
    :cond_4
    invoke-static {v9}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v6

    invoke-virtual {p1, v7, v6, v7, v7}, Landroid/view/View;->setPadding(IIII)V

    goto :goto_1

    .line 93
    .restart local v1    # "att":Lcom/vkontakte/android/attachments/Attachment;
    .restart local v4    # "lp":Lcom/vkontakte/android/ui/FlowLayout$LayoutParams;
    :cond_5
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v6

    invoke-virtual {v1, v6}, Lcom/vkontakte/android/attachments/Attachment;->getFullView(Landroid/content/Context;)Landroid/view/View;

    move-result-object v0

    goto :goto_3

    .line 97
    .restart local v0    # "addingView":Landroid/view/View;
    :cond_6
    iget-object v6, v2, Lcom/vkontakte/android/ui/posts/AttachContainerPostDisplayItem$ViewHolder;->flowLayout:Lcom/vkontakte/android/ui/FlowLayout;

    invoke-virtual {v6, v0}, Lcom/vkontakte/android/ui/FlowLayout;->addView(Landroid/view/View;)V

    goto :goto_4

    .line 103
    .end local v0    # "addingView":Landroid/view/View;
    .end local v1    # "att":Lcom/vkontakte/android/attachments/Attachment;
    .end local v4    # "lp":Lcom/vkontakte/android/ui/FlowLayout$LayoutParams;
    :cond_7
    return-void
.end method

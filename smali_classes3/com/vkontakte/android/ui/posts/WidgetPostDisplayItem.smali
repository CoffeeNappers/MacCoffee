.class public Lcom/vkontakte/android/ui/posts/WidgetPostDisplayItem;
.super Lcom/vkontakte/android/ui/posts/PostDisplayItem;
.source "WidgetPostDisplayItem.java"


# instance fields
.field private final entry:Lcom/vkontakte/android/NewsEntry;


# direct methods
.method public constructor <init>(Lcom/vkontakte/android/NewsEntry;)V
    .locals 1
    .param p1, "entry"    # Lcom/vkontakte/android/NewsEntry;

    .prologue
    .line 16
    invoke-direct {p0, p1}, Lcom/vkontakte/android/ui/posts/PostDisplayItem;-><init>(Lcom/vkontakte/android/NewsEntry;)V

    .line 17
    iput-object p1, p0, Lcom/vkontakte/android/ui/posts/WidgetPostDisplayItem;->entry:Lcom/vkontakte/android/NewsEntry;

    .line 18
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/vkontakte/android/ui/posts/WidgetPostDisplayItem;->clickable:Z

    .line 19
    return-void
.end method

.method public static createView(Landroid/content/Context;)Landroid/view/View;
    .locals 1
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 58
    new-instance v0, Landroid/widget/FrameLayout;

    invoke-direct {v0, p0}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    return-object v0
.end method


# virtual methods
.method public getImageCount()I
    .locals 1

    .prologue
    .line 49
    const/4 v0, 0x0

    return v0
.end method

.method public getImageURL(I)Ljava/lang/String;
    .locals 1
    .param p1, "image"    # I

    .prologue
    .line 54
    const/4 v0, 0x0

    return-object v0
.end method

.method public getType()I
    .locals 1

    .prologue
    .line 23
    const/16 v0, 0x16

    return v0
.end method

.method public onBindView(Landroid/view/View;)V
    .locals 7
    .param p1, "view"    # Landroid/view/View;

    .prologue
    const/4 v6, 0x0

    .line 28
    const/4 v1, 0x0

    .local v1, "attachView":Landroid/view/View;
    move-object v5, p1

    .line 29
    check-cast v5, Landroid/view/ViewGroup;

    invoke-virtual {v5}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v5

    if-lez v5, :cond_1

    move-object v5, p1

    .line 30
    check-cast v5, Landroid/widget/FrameLayout;

    invoke-virtual {v5, v6}, Landroid/widget/FrameLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    .line 31
    invoke-virtual {v1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v4

    .line 32
    .local v4, "tag":Ljava/lang/Object;
    instance-of v5, v4, Ljava/lang/String;

    if-nez v5, :cond_0

    instance-of v5, v4, Lcom/vkontakte/android/attachments/AttachmentViewHolder;

    if-eqz v5, :cond_1

    .line 33
    :cond_0
    invoke-virtual {v4}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v1, v5}, Lcom/vkontakte/android/attachments/Attachment;->reuseView(Landroid/view/View;Ljava/lang/String;)V

    .line 36
    .end local v4    # "tag":Ljava/lang/Object;
    :cond_1
    iget-object v5, p0, Lcom/vkontakte/android/ui/posts/WidgetPostDisplayItem;->entry:Lcom/vkontakte/android/NewsEntry;

    iget-object v5, v5, Lcom/vkontakte/android/NewsEntry;->attachments:Ljava/util/ArrayList;

    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    move-result v5

    if-lez v5, :cond_2

    .line 37
    iget-object v5, p0, Lcom/vkontakte/android/ui/posts/WidgetPostDisplayItem;->entry:Lcom/vkontakte/android/NewsEntry;

    iget-object v5, v5, Lcom/vkontakte/android/NewsEntry;->attachments:Ljava/util/ArrayList;

    invoke-virtual {v5, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/attachments/Attachment;

    .line 38
    .local v0, "att":Lcom/vkontakte/android/attachments/Attachment;
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v5

    invoke-virtual {v0, v5, v1}, Lcom/vkontakte/android/attachments/Attachment;->getViewForList(Landroid/content/Context;Landroid/view/View;)Landroid/view/View;

    move-result-object v2

    .line 39
    .local v2, "av":Landroid/view/View;
    if-eq v1, v2, :cond_2

    move-object v3, p1

    .line 40
    check-cast v3, Landroid/widget/FrameLayout;

    .line 41
    .local v3, "layout":Landroid/widget/FrameLayout;
    invoke-virtual {v3}, Landroid/widget/FrameLayout;->removeAllViews()V

    .line 42
    invoke-virtual {v3, v2}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;)V

    .line 45
    .end local v0    # "att":Lcom/vkontakte/android/attachments/Attachment;
    .end local v2    # "av":Landroid/view/View;
    .end local v3    # "layout":Landroid/widget/FrameLayout;
    :cond_2
    return-void
.end method

.class public Lcom/vkontakte/android/ui/posts/CommonAttachmentPostDisplayItem;
.super Lcom/vkontakte/android/ui/posts/PostDisplayItem;
.source "CommonAttachmentPostDisplayItem.java"


# instance fields
.field public att:Lcom/vkontakte/android/attachments/Attachment;


# direct methods
.method public constructor <init>(Lcom/vkontakte/android/NewsEntry;Lcom/vkontakte/android/attachments/Attachment;)V
    .locals 0
    .param p1, "e"    # Lcom/vkontakte/android/NewsEntry;
    .param p2, "_att"    # Lcom/vkontakte/android/attachments/Attachment;

    .prologue
    .line 22
    invoke-direct {p0, p1}, Lcom/vkontakte/android/ui/posts/PostDisplayItem;-><init>(Lcom/vkontakte/android/NewsEntry;)V

    .line 23
    iput-object p2, p0, Lcom/vkontakte/android/ui/posts/CommonAttachmentPostDisplayItem;->att:Lcom/vkontakte/android/attachments/Attachment;

    .line 24
    return-void
.end method

.method public static createView(Landroid/content/Context;)Landroid/view/View;
    .locals 1
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 42
    new-instance v0, Landroid/widget/FrameLayout;

    invoke-direct {v0, p0}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    return-object v0
.end method


# virtual methods
.method public getImageCount()I
    .locals 1

    .prologue
    .line 33
    iget-object v0, p0, Lcom/vkontakte/android/ui/posts/CommonAttachmentPostDisplayItem;->att:Lcom/vkontakte/android/attachments/Attachment;

    instance-of v0, v0, Lcom/vkontakte/android/attachments/ImageAttachment;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getImageURL(I)Ljava/lang/String;
    .locals 1
    .param p1, "image"    # I

    .prologue
    .line 38
    iget-object v0, p0, Lcom/vkontakte/android/ui/posts/CommonAttachmentPostDisplayItem;->att:Lcom/vkontakte/android/attachments/Attachment;

    instance-of v0, v0, Lcom/vkontakte/android/attachments/ImageAttachment;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/vkontakte/android/ui/posts/CommonAttachmentPostDisplayItem;->att:Lcom/vkontakte/android/attachments/Attachment;

    check-cast v0, Lcom/vkontakte/android/attachments/ImageAttachment;

    invoke-interface {v0}, Lcom/vkontakte/android/attachments/ImageAttachment;->getImageURL()Ljava/lang/String;

    move-result-object v0

    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getType()I
    .locals 1

    .prologue
    .line 28
    const/4 v0, 0x7

    return v0
.end method

.method public onBindView(Landroid/view/View;)V
    .locals 7
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 47
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v2

    .line 49
    .local v2, "context":Landroid/content/Context;
    const/4 v0, 0x0

    .local v0, "attachView":Landroid/view/View;
    move-object v4, p1

    .line 50
    check-cast v4, Landroid/view/ViewGroup;

    invoke-virtual {v4}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v4

    if-lez v4, :cond_0

    move-object v4, p1

    .line 51
    check-cast v4, Landroid/widget/FrameLayout;

    const/4 v5, 0x0

    invoke-virtual {v4, v5}, Landroid/widget/FrameLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .line 54
    :cond_0
    new-instance v3, Landroid/widget/FrameLayout$LayoutParams;

    const/4 v4, -0x1

    const/4 v5, -0x2

    const/16 v6, 0x11

    invoke-direct {v3, v4, v5, v6}, Landroid/widget/FrameLayout$LayoutParams;-><init>(III)V

    .line 55
    .local v3, "lp":Landroid/widget/FrameLayout$LayoutParams;
    invoke-virtual {p1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    const v5, 0x7f090027

    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getDimensionPixelOffset(I)I

    move-result v4

    iput v4, v3, Landroid/widget/FrameLayout$LayoutParams;->rightMargin:I

    iput v4, v3, Landroid/widget/FrameLayout$LayoutParams;->leftMargin:I

    .line 56
    iget-object v4, p0, Lcom/vkontakte/android/ui/posts/CommonAttachmentPostDisplayItem;->att:Lcom/vkontakte/android/attachments/Attachment;

    invoke-virtual {v4, v2, v0}, Lcom/vkontakte/android/attachments/Attachment;->getViewForList(Landroid/content/Context;Landroid/view/View;)Landroid/view/View;

    move-result-object v1

    .line 58
    .local v1, "av":Landroid/view/View;
    if-nez v0, :cond_1

    .line 59
    invoke-virtual {v1, v3}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 60
    check-cast p1, Landroid/widget/FrameLayout;

    .end local p1    # "view":Landroid/view/View;
    invoke-virtual {p1, v1}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;)V

    .line 63
    :cond_1
    if-eqz v0, :cond_2

    iget-object v4, p0, Lcom/vkontakte/android/ui/posts/CommonAttachmentPostDisplayItem;->att:Lcom/vkontakte/android/attachments/Attachment;

    instance-of v4, v4, Lcom/vkontakte/android/attachments/ImageAttachment;

    if-eqz v4, :cond_2

    .line 64
    iget-object v4, p0, Lcom/vkontakte/android/ui/posts/CommonAttachmentPostDisplayItem;->att:Lcom/vkontakte/android/attachments/Attachment;

    check-cast v4, Lcom/vkontakte/android/attachments/ImageAttachment;

    invoke-interface {v4, v0}, Lcom/vkontakte/android/attachments/ImageAttachment;->bind(Landroid/view/View;)V

    .line 66
    :cond_2
    return-void
.end method

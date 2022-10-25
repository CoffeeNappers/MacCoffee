.class public Lcom/vkontakte/android/ui/posts/SignaturePostDisplayItem;
.super Lcom/vkontakte/android/ui/posts/PostDisplayItem;
.source "SignaturePostDisplayItem.java"


# instance fields
.field public att:Lcom/vkontakte/android/attachments/Attachment;


# direct methods
.method public constructor <init>(Lcom/vkontakte/android/NewsEntry;Lcom/vkontakte/android/attachments/Attachment;)V
    .locals 0
    .param p1, "entry"    # Lcom/vkontakte/android/NewsEntry;
    .param p2, "_att"    # Lcom/vkontakte/android/attachments/Attachment;

    .prologue
    .line 18
    invoke-direct {p0, p1}, Lcom/vkontakte/android/ui/posts/PostDisplayItem;-><init>(Lcom/vkontakte/android/NewsEntry;)V

    .line 19
    iput-object p2, p0, Lcom/vkontakte/android/ui/posts/SignaturePostDisplayItem;->att:Lcom/vkontakte/android/attachments/Attachment;

    .line 20
    return-void
.end method

.method public static createView(Landroid/content/Context;)Landroid/view/View;
    .locals 1
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 38
    new-instance v0, Landroid/widget/FrameLayout;

    invoke-direct {v0, p0}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    return-object v0
.end method


# virtual methods
.method public getImageCount()I
    .locals 1

    .prologue
    .line 29
    const/4 v0, 0x0

    return v0
.end method

.method public getImageURL(I)Ljava/lang/String;
    .locals 1
    .param p1, "image"    # I

    .prologue
    .line 34
    const/4 v0, 0x0

    return-object v0
.end method

.method public getType()I
    .locals 1

    .prologue
    .line 24
    const/16 v0, 0x8

    return v0
.end method

.method public onBindView(Landroid/view/View;)V
    .locals 6
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 43
    const/4 v0, 0x0

    .local v0, "attachView":Landroid/view/View;
    move-object v3, p1

    .line 44
    check-cast v3, Landroid/view/ViewGroup;

    invoke-virtual {v3}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v3

    if-lez v3, :cond_0

    move-object v3, p1

    .line 45
    check-cast v3, Landroid/widget/FrameLayout;

    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Landroid/widget/FrameLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .line 47
    :cond_0
    new-instance v2, Landroid/widget/FrameLayout$LayoutParams;

    const/4 v3, -0x1

    const/4 v4, -0x2

    const/16 v5, 0x11

    invoke-direct {v2, v3, v4, v5}, Landroid/widget/FrameLayout$LayoutParams;-><init>(III)V

    .line 50
    .local v2, "lp":Landroid/widget/FrameLayout$LayoutParams;
    iget-object v3, p0, Lcom/vkontakte/android/ui/posts/SignaturePostDisplayItem;->att:Lcom/vkontakte/android/attachments/Attachment;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-virtual {v3, v4, v0}, Lcom/vkontakte/android/attachments/Attachment;->getViewForList(Landroid/content/Context;Landroid/view/View;)Landroid/view/View;

    move-result-object v1

    .line 51
    .local v1, "av":Landroid/view/View;
    if-nez v0, :cond_1

    .line 52
    invoke-virtual {v1, v2}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 53
    check-cast p1, Landroid/widget/FrameLayout;

    .end local p1    # "view":Landroid/view/View;
    invoke-virtual {p1, v1}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;)V

    .line 55
    :cond_1
    return-void
.end method

.class public Lcom/vkontakte/android/ui/posts/PaddingPostDisplayItem;
.super Lcom/vkontakte/android/ui/posts/PostDisplayItem;
.source "PaddingPostDisplayItem.java"


# instance fields
.field private padding:I


# direct methods
.method public constructor <init>(Lcom/vkontakte/android/NewsEntry;I)V
    .locals 0
    .param p1, "entry"    # Lcom/vkontakte/android/NewsEntry;
    .param p2, "_padding"    # I

    .prologue
    .line 19
    invoke-direct {p0, p1}, Lcom/vkontakte/android/ui/posts/PostDisplayItem;-><init>(Lcom/vkontakte/android/NewsEntry;)V

    .line 20
    iput p2, p0, Lcom/vkontakte/android/ui/posts/PaddingPostDisplayItem;->padding:I

    .line 21
    return-void
.end method

.method public static createView(Landroid/content/Context;)Landroid/view/View;
    .locals 1
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 44
    new-instance v0, Landroid/view/View;

    invoke-direct {v0, p0}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    return-object v0
.end method


# virtual methods
.method public getImageCount()I
    .locals 1

    .prologue
    .line 35
    const/4 v0, 0x0

    return v0
.end method

.method public getImageURL(I)Ljava/lang/String;
    .locals 1
    .param p1, "image"    # I

    .prologue
    .line 40
    const/4 v0, 0x0

    return-object v0
.end method

.method public getType()I
    .locals 1

    .prologue
    .line 25
    const/16 v0, 0x11

    return v0
.end method

.method public onBindView(Landroid/view/View;)V
    .locals 3
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 30
    new-instance v0, Landroid/support/v7/widget/RecyclerView$LayoutParams;

    const/4 v1, -0x1

    iget v2, p0, Lcom/vkontakte/android/ui/posts/PaddingPostDisplayItem;->padding:I

    invoke-direct {v0, v1, v2}, Landroid/support/v7/widget/RecyclerView$LayoutParams;-><init>(II)V

    invoke-virtual {p1, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 31
    return-void
.end method

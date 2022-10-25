.class public Lcom/vkontakte/android/ui/posts/MarkedAsAdsPostDisplayItem;
.super Lcom/vkontakte/android/ui/posts/PostDisplayItem;
.source "MarkedAsAdsPostDisplayItem.java"


# direct methods
.method public constructor <init>(Lcom/vkontakte/android/NewsEntry;)V
    .locals 0
    .param p1, "e"    # Lcom/vkontakte/android/NewsEntry;

    .prologue
    .line 13
    invoke-direct {p0, p1}, Lcom/vkontakte/android/ui/posts/PostDisplayItem;-><init>(Lcom/vkontakte/android/NewsEntry;)V

    .line 14
    return-void
.end method

.method public static createView(Landroid/content/Context;)Landroid/view/View;
    .locals 3
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 26
    invoke-static {p0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    const v1, 0x7f0300fd

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public getImageCount()I
    .locals 1

    .prologue
    .line 31
    const/4 v0, 0x0

    return v0
.end method

.method public getImageURL(I)Ljava/lang/String;
    .locals 1
    .param p1, "image"    # I

    .prologue
    .line 36
    const/4 v0, 0x0

    return-object v0
.end method

.method public getType()I
    .locals 1

    .prologue
    .line 18
    const/16 v0, 0x15

    return v0
.end method

.method public onBindView(Landroid/view/View;)V
    .locals 0
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 23
    return-void
.end method

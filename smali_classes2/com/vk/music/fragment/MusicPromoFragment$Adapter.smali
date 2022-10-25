.class Lcom/vk/music/fragment/MusicPromoFragment$Adapter;
.super Landroid/support/v4/view/PagerAdapter;
.source "MusicPromoFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vk/music/fragment/MusicPromoFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "Adapter"
.end annotation


# instance fields
.field final items:[Lcom/vk/music/fragment/MusicPromoFragment$Item;


# direct methods
.method public constructor <init>([Lcom/vk/music/fragment/MusicPromoFragment$Item;)V
    .locals 0
    .param p1, "items"    # [Lcom/vk/music/fragment/MusicPromoFragment$Item;

    .prologue
    .line 164
    invoke-direct {p0}, Landroid/support/v4/view/PagerAdapter;-><init>()V

    .line 165
    iput-object p1, p0, Lcom/vk/music/fragment/MusicPromoFragment$Adapter;->items:[Lcom/vk/music/fragment/MusicPromoFragment$Item;

    .line 166
    return-void
.end method


# virtual methods
.method public destroyItem(Landroid/view/ViewGroup;ILjava/lang/Object;)V
    .locals 0
    .param p1, "container"    # Landroid/view/ViewGroup;
    .param p2, "position"    # I
    .param p3, "object"    # Ljava/lang/Object;

    .prologue
    .line 194
    check-cast p3, Landroid/view/View;

    .end local p3    # "object":Ljava/lang/Object;
    invoke-virtual {p1, p3}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 195
    return-void
.end method

.method public getCount()I
    .locals 1

    .prologue
    .line 170
    iget-object v0, p0, Lcom/vk/music/fragment/MusicPromoFragment$Adapter;->items:[Lcom/vk/music/fragment/MusicPromoFragment$Item;

    array-length v0, v0

    return v0
.end method

.method public instantiateItem(Landroid/view/ViewGroup;I)Ljava/lang/Object;
    .locals 5
    .param p1, "container"    # Landroid/view/ViewGroup;
    .param p2, "position"    # I

    .prologue
    .line 180
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-static {v2}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v2

    const v3, 0x7f030147

    const/4 v4, 0x0

    invoke-virtual {v2, v3, p1, v4}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v1

    .line 181
    .local v1, "view":Landroid/view/View;
    const v2, 0x7f100128

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    iget-object v3, p0, Lcom/vk/music/fragment/MusicPromoFragment$Adapter;->items:[Lcom/vk/music/fragment/MusicPromoFragment$Item;

    aget-object v3, v3, p2

    iget v3, v3, Lcom/vk/music/fragment/MusicPromoFragment$Item;->title:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/vkontakte/android/ViewUtils;->setText(Landroid/widget/TextView;Ljava/lang/Object;)V

    .line 182
    const v2, 0x7f1001c3

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    iget-object v3, p0, Lcom/vk/music/fragment/MusicPromoFragment$Adapter;->items:[Lcom/vk/music/fragment/MusicPromoFragment$Item;

    aget-object v3, v3, p2

    iget v3, v3, Lcom/vk/music/fragment/MusicPromoFragment$Item;->text:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/vkontakte/android/ViewUtils;->setText(Landroid/widget/TextView;Ljava/lang/Object;)V

    .line 183
    const v2, 0x7f100124

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/vk/music/view/MusicPromoImage;

    .line 184
    .local v0, "musicPromoImage":Lcom/vk/music/view/MusicPromoImage;
    const v2, 0x7f020311

    iget-object v3, p0, Lcom/vk/music/fragment/MusicPromoFragment$Adapter;->items:[Lcom/vk/music/fragment/MusicPromoFragment$Item;

    aget-object v3, v3, p2

    iget v3, v3, Lcom/vk/music/fragment/MusicPromoFragment$Item;->image:I

    const v4, 0x7f020314

    invoke-virtual {v0, v2, v3, v4}, Lcom/vk/music/view/MusicPromoImage;->initialize(III)V

    .line 188
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 189
    return-object v1
.end method

.method public isViewFromObject(Landroid/view/View;Ljava/lang/Object;)Z
    .locals 1
    .param p1, "view"    # Landroid/view/View;
    .param p2, "object"    # Ljava/lang/Object;

    .prologue
    .line 175
    if-ne p1, p2, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

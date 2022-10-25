.class public Lcom/vkontakte/android/ui/posts/GoodsBlockPostDisplayItem;
.super Lcom/vkontakte/android/ui/posts/AdBlockPostDisplayItem;
.source "GoodsBlockPostDisplayItem.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vkontakte/android/ui/posts/GoodsBlockPostDisplayItem$CardViewHolder;,
        Lcom/vkontakte/android/ui/posts/GoodsBlockPostDisplayItem$Adapter;,
        Lcom/vkontakte/android/ui/posts/GoodsBlockPostDisplayItem$ViewHolder;
    }
.end annotation


# direct methods
.method public constructor <init>(Lcom/vkontakte/android/NewsEntry;)V
    .locals 4
    .param p1, "_post"    # Lcom/vkontakte/android/NewsEntry;

    .prologue
    .line 47
    invoke-direct {p0, p1}, Lcom/vkontakte/android/ui/posts/AdBlockPostDisplayItem;-><init>(Lcom/vkontakte/android/NewsEntry;)V

    .line 48
    iget-object v1, p1, Lcom/vkontakte/android/NewsEntry;->attachments:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v0

    .line 49
    .local v0, "size":I
    const/4 v1, 0x1

    if-le v0, v1, :cond_0

    .line 50
    const-string/jumbo v1, "vk"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "Goods type display item support is only one attachment. Attachments got count: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/vkontakte/android/Log;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 52
    :cond_0
    return-void
.end method

.method static synthetic access$100(Lcom/vkontakte/android/ui/posts/GoodsBlockPostDisplayItem;Lcom/vkontakte/android/attachments/ShitAttachment;Lcom/vkontakte/android/attachments/ShitAttachment$Card;Landroid/view/View;)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/ui/posts/GoodsBlockPostDisplayItem;
    .param p1, "x1"    # Lcom/vkontakte/android/attachments/ShitAttachment;
    .param p2, "x2"    # Lcom/vkontakte/android/attachments/ShitAttachment$Card;
    .param p3, "x3"    # Landroid/view/View;

    .prologue
    .line 30
    invoke-direct {p0, p1, p2, p3}, Lcom/vkontakte/android/ui/posts/GoodsBlockPostDisplayItem;->onCardClicked(Lcom/vkontakte/android/attachments/ShitAttachment;Lcom/vkontakte/android/attachments/ShitAttachment$Card;Landroid/view/View;)V

    return-void
.end method

.method static synthetic access$700(Lcom/vkontakte/android/attachments/ShitAttachment$Card;)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/attachments/ShitAttachment$Card;

    .prologue
    .line 30
    invoke-static {p0}, Lcom/vkontakte/android/ui/posts/GoodsBlockPostDisplayItem;->trackCardsImpression(Lcom/vkontakte/android/attachments/ShitAttachment$Card;)V

    return-void
.end method

.method public static createView(Landroid/content/Context;)Landroid/view/View;
    .locals 1
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 82
    new-instance v0, Lcom/vkontakte/android/ui/posts/GoodsBlockPostDisplayItem$ViewHolder;

    invoke-direct {v0, p0}, Lcom/vkontakte/android/ui/posts/GoodsBlockPostDisplayItem$ViewHolder;-><init>(Landroid/content/Context;)V

    iget-object v0, v0, Lcom/vkontakte/android/ui/posts/GoodsBlockPostDisplayItem$ViewHolder;->itemView:Landroid/view/View;

    return-object v0
.end method

.method private onCardClicked(Lcom/vkontakte/android/attachments/ShitAttachment;Lcom/vkontakte/android/attachments/ShitAttachment$Card;Landroid/view/View;)V
    .locals 7
    .param p1, "ad"    # Lcom/vkontakte/android/attachments/ShitAttachment;
    .param p2, "card"    # Lcom/vkontakte/android/attachments/ShitAttachment$Card;
    .param p3, "v"    # Landroid/view/View;

    .prologue
    .line 33
    invoke-virtual {p3}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Lcom/vkontakte/android/utils/Utils;->castToActivity(Landroid/content/Context;)Landroid/app/Activity;

    move-result-object v0

    .line 34
    .local v0, "activity":Landroid/app/Activity;
    if-nez v0, :cond_0

    .line 44
    :goto_0
    return-void

    .line 36
    :cond_0
    const-string/jumbo v1, "click"

    invoke-virtual {p2, v1}, Lcom/vkontakte/android/attachments/ShitAttachment$Card;->getStatisticByType(Ljava/lang/String;)Ljava/util/List;

    move-result-object v1

    iget-object v2, p2, Lcom/vkontakte/android/attachments/ShitAttachment$Card;->deepLink:Ljava/lang/String;

    iget-boolean v3, p1, Lcom/vkontakte/android/attachments/ShitAttachment;->installed:Z

    invoke-static {v1, v2, v3}, Lcom/vkontakte/android/utils/AdsUtil;->trackClicks(Ljava/util/List;Ljava/lang/String;Z)V

    .line 38
    iget-object v1, p1, Lcom/vkontakte/android/attachments/ShitAttachment;->appPackage:Ljava/lang/String;

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_1

    iget-boolean v1, p1, Lcom/vkontakte/android/attachments/ShitAttachment;->installed:Z

    if-nez v1, :cond_2

    .line 39
    :cond_1
    iget-object v1, p1, Lcom/vkontakte/android/attachments/ShitAttachment;->data:Ljava/lang/String;

    iget v2, p2, Lcom/vkontakte/android/attachments/ShitAttachment$Card;->linkTarget:I

    iget-object v3, p2, Lcom/vkontakte/android/attachments/ShitAttachment$Card;->link:Ljava/lang/String;

    invoke-static {v0, v1, v2, v3}, Lcom/vkontakte/android/utils/AdsUtil;->processClickWithoutApp(Landroid/content/Context;Ljava/lang/String;ILjava/lang/String;)V

    goto :goto_0

    .line 41
    :cond_2
    iget-object v1, p1, Lcom/vkontakte/android/attachments/ShitAttachment;->data:Ljava/lang/String;

    const-string/jumbo v2, "click_deeplink"

    invoke-virtual {p2, v2}, Lcom/vkontakte/android/attachments/ShitAttachment$Card;->getStatisticByType(Ljava/lang/String;)Ljava/util/List;

    move-result-object v2

    iget-object v3, p2, Lcom/vkontakte/android/attachments/ShitAttachment$Card;->appPackage:Ljava/lang/String;

    iget-object v4, p2, Lcom/vkontakte/android/attachments/ShitAttachment$Card;->deepLink:Ljava/lang/String;

    iget-object v5, p2, Lcom/vkontakte/android/attachments/ShitAttachment$Card;->link:Ljava/lang/String;

    iget-boolean v6, p1, Lcom/vkontakte/android/attachments/ShitAttachment;->installed:Z

    invoke-static/range {v0 .. v6}, Lcom/vkontakte/android/utils/AdsUtil;->processClickWithApp(Landroid/content/Context;Ljava/lang/String;Ljava/util/List;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)V

    goto :goto_0
.end method

.method private static trackCardsImpression(Lcom/vkontakte/android/attachments/ShitAttachment$Card;)V
    .locals 3
    .param p0, "card"    # Lcom/vkontakte/android/attachments/ShitAttachment$Card;

    .prologue
    .line 76
    const-string/jumbo v1, "impression"

    invoke-virtual {p0, v1}, Lcom/vkontakte/android/attachments/ShitAttachment$Card;->getStatisticByType(Ljava/lang/String;)Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/statistics/StatisticUrl;

    .line 77
    .local v0, "url":Lcom/vkontakte/android/statistics/StatisticUrl;
    invoke-static {v0}, Lcom/vkontakte/android/data/Analytics;->trackExternal(Lcom/vkontakte/android/statistics/StatisticUrl;)V

    goto :goto_0

    .line 79
    .end local v0    # "url":Lcom/vkontakte/android/statistics/StatisticUrl;
    :cond_0
    return-void
.end method


# virtual methods
.method public getImageCount()I
    .locals 2

    .prologue
    .line 61
    iget-object v0, p0, Lcom/vkontakte/android/ui/posts/GoodsBlockPostDisplayItem;->post:Lcom/vkontakte/android/NewsEntry;

    iget-object v0, v0, Lcom/vkontakte/android/NewsEntry;->attachments:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/ui/posts/GoodsBlockPostDisplayItem;->post:Lcom/vkontakte/android/NewsEntry;

    iget-object v0, v0, Lcom/vkontakte/android/NewsEntry;->attachments:Ljava/util/ArrayList;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/attachments/ShitAttachment;

    iget-object v0, v0, Lcom/vkontakte/android/attachments/ShitAttachment;->cards:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method public getImageURL(I)Ljava/lang/String;
    .locals 3
    .param p1, "image"    # I

    .prologue
    .line 66
    iget-object v1, p0, Lcom/vkontakte/android/ui/posts/GoodsBlockPostDisplayItem;->post:Lcom/vkontakte/android/NewsEntry;

    iget-object v1, v1, Lcom/vkontakte/android/NewsEntry;->attachments:Ljava/util/ArrayList;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/attachments/ShitAttachment;

    .line 67
    .local v0, "att":Lcom/vkontakte/android/attachments/ShitAttachment;
    if-nez p1, :cond_0

    iget-object v1, v0, Lcom/vkontakte/android/attachments/ShitAttachment;->userPhoto:Ljava/lang/String;

    :goto_0
    return-object v1

    :cond_0
    iget-object v1, v0, Lcom/vkontakte/android/attachments/ShitAttachment;->cards:Ljava/util/ArrayList;

    add-int/lit8 v2, p1, -0x1

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vkontakte/android/attachments/ShitAttachment$Card;

    iget-object v1, v1, Lcom/vkontakte/android/attachments/ShitAttachment$Card;->photo:Lcom/vkontakte/android/attachments/PhotoAttachment;

    invoke-virtual {v1}, Lcom/vkontakte/android/attachments/PhotoAttachment;->getThumbURL()Ljava/lang/String;

    move-result-object v1

    goto :goto_0
.end method

.method public getType()I
    .locals 1

    .prologue
    .line 56
    const/16 v0, 0xf

    return v0
.end method

.method public onBindView(Landroid/view/View;)V
    .locals 2
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 72
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/ui/posts/GoodsBlockPostDisplayItem$ViewHolder;

    iget-object v1, p0, Lcom/vkontakte/android/ui/posts/GoodsBlockPostDisplayItem;->post:Lcom/vkontakte/android/NewsEntry;

    invoke-virtual {v0, v1, p0}, Lcom/vkontakte/android/ui/posts/GoodsBlockPostDisplayItem$ViewHolder;->bind(Lcom/vkontakte/android/NewsEntry;Lcom/vkontakte/android/ui/posts/GoodsBlockPostDisplayItem;)V

    .line 73
    return-void
.end method

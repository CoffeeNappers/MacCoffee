.class public Lcom/vkontakte/android/ui/holder/money/SubscriptionHeaderHolder;
.super Lcom/vkontakte/android/ui/holder/RecyclerHolder;
.source "SubscriptionHeaderHolder.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/ui/holder/RecyclerHolder",
        "<",
        "Lcom/vkontakte/android/data/Subscription;",
        ">;"
    }
.end annotation


# instance fields
.field private final billing_type:Landroid/widget/TextView;

.field private final cost:Landroid/widget/TextView;

.field private final description:Landroid/widget/TextView;

.field private final icon:Lcom/vk/imageloader/view/VKImageView;

.field private final nextBillTitle:Landroid/view/View;

.field private final not_purchased_block:Landroid/view/View;

.field private final purchased_block:Landroid/view/View;

.field private final subtitle:Landroid/widget/TextView;

.field private final tillDate:Landroid/widget/TextView;

.field private final title:Landroid/widget/TextView;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1, "ctx"    # Landroid/content/Context;

    .prologue
    .line 25
    const v0, 0x7f030208

    invoke-direct {p0, v0, p1}, Lcom/vkontakte/android/ui/holder/RecyclerHolder;-><init>(ILandroid/content/Context;)V

    .line 26
    const v0, 0x7f100128

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/ui/holder/money/SubscriptionHeaderHolder;->$(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/vkontakte/android/ui/holder/money/SubscriptionHeaderHolder;->title:Landroid/widget/TextView;

    .line 27
    const v0, 0x7f10019c

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/ui/holder/money/SubscriptionHeaderHolder;->$(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/vkontakte/android/ui/holder/money/SubscriptionHeaderHolder;->subtitle:Landroid/widget/TextView;

    .line 28
    const v0, 0x7f1001cc

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/ui/holder/money/SubscriptionHeaderHolder;->$(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/vkontakte/android/ui/holder/money/SubscriptionHeaderHolder;->description:Landroid/widget/TextView;

    .line 29
    const v0, 0x7f10054d

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/ui/holder/money/SubscriptionHeaderHolder;->$(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/vkontakte/android/ui/holder/money/SubscriptionHeaderHolder;->billing_type:Landroid/widget/TextView;

    .line 30
    const v0, 0x7f10054c

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/ui/holder/money/SubscriptionHeaderHolder;->$(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/vkontakte/android/ui/holder/money/SubscriptionHeaderHolder;->tillDate:Landroid/widget/TextView;

    .line 31
    const v0, 0x7f10054b

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/ui/holder/money/SubscriptionHeaderHolder;->$(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/ui/holder/money/SubscriptionHeaderHolder;->nextBillTitle:Landroid/view/View;

    .line 32
    const v0, 0x1020006

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/ui/holder/money/SubscriptionHeaderHolder;->$(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/vk/imageloader/view/VKImageView;

    iput-object v0, p0, Lcom/vkontakte/android/ui/holder/money/SubscriptionHeaderHolder;->icon:Lcom/vk/imageloader/view/VKImageView;

    .line 33
    const v0, 0x7f10054e

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/ui/holder/money/SubscriptionHeaderHolder;->$(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/ui/holder/money/SubscriptionHeaderHolder;->not_purchased_block:Landroid/view/View;

    .line 34
    const v0, 0x7f10054a

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/ui/holder/money/SubscriptionHeaderHolder;->$(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/ui/holder/money/SubscriptionHeaderHolder;->purchased_block:Landroid/view/View;

    .line 35
    const v0, 0x7f10054f

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/ui/holder/money/SubscriptionHeaderHolder;->$(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/vkontakte/android/ui/holder/money/SubscriptionHeaderHolder;->cost:Landroid/widget/TextView;

    .line 36
    return-void
.end method

.method private static getExpiredDateText(Lcom/vkontakte/android/ui/holder/RecyclerHolder;Lcom/vkontakte/android/data/Subscription;)Ljava/lang/String;
    .locals 10
    .param p0, "holder"    # Lcom/vkontakte/android/ui/holder/RecyclerHolder;
    .param p1, "subscription"    # Lcom/vkontakte/android/data/Subscription;

    .prologue
    .line 65
    iget-wide v6, p1, Lcom/vkontakte/android/data/Subscription;->expiredDate:J

    const-wide/16 v8, 0x0

    cmp-long v5, v6, v8

    if-gtz v5, :cond_0

    .line 66
    const/4 v5, 0x0

    .line 77
    :goto_0
    return-object v5

    .line 68
    :cond_0
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v0

    .line 69
    .local v0, "calendar":Ljava/util/Calendar;
    const/4 v5, 0x1

    invoke-virtual {v0, v5}, Ljava/util/Calendar;->get(I)I

    move-result v1

    .line 70
    .local v1, "currentYear":I
    iget-wide v6, p1, Lcom/vkontakte/android/data/Subscription;->expiredDate:J

    const-wide/16 v8, 0x3e8

    mul-long/2addr v6, v8

    invoke-virtual {v0, v6, v7}, Ljava/util/Calendar;->setTimeInMillis(J)V

    .line 71
    const/4 v5, 0x5

    invoke-virtual {v0, v5}, Ljava/util/Calendar;->get(I)I

    move-result v2

    .line 72
    .local v2, "day":I
    const/4 v5, 0x2

    invoke-virtual {v0, v5}, Ljava/util/Calendar;->get(I)I

    move-result v3

    .line 73
    .local v3, "month":I
    const/4 v5, 0x1

    invoke-virtual {v0, v5}, Ljava/util/Calendar;->get(I)I

    move-result v4

    .line 74
    .local v4, "year":I
    if-eq v1, v4, :cond_1

    .line 75
    const-string/jumbo v5, "%d %s %d"

    const/4 v6, 0x3

    new-array v6, v6, [Ljava/lang/Object;

    const/4 v7, 0x0

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    aput-object v8, v6, v7

    const/4 v7, 0x1

    invoke-virtual {p0}, Lcom/vkontakte/android/ui/holder/RecyclerHolder;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    const v9, 0x7f0c0016

    invoke-virtual {v8, v9}, Landroid/content/res/Resources;->getStringArray(I)[Ljava/lang/String;

    move-result-object v8

    const/16 v9, 0xb

    invoke-static {v9, v3}, Ljava/lang/Math;->min(II)I

    move-result v9

    aget-object v8, v8, v9

    aput-object v8, v6, v7

    const/4 v7, 0x2

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    aput-object v8, v6, v7

    invoke-static {v5, v6}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    goto :goto_0

    .line 77
    :cond_1
    const-string/jumbo v5, "%d %s"

    const/4 v6, 0x2

    new-array v6, v6, [Ljava/lang/Object;

    const/4 v7, 0x0

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    aput-object v8, v6, v7

    const/4 v7, 0x1

    invoke-virtual {p0}, Lcom/vkontakte/android/ui/holder/RecyclerHolder;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    const v9, 0x7f0c0016

    invoke-virtual {v8, v9}, Landroid/content/res/Resources;->getStringArray(I)[Ljava/lang/String;

    move-result-object v8

    const/16 v9, 0xb

    invoke-static {v9, v3}, Ljava/lang/Math;->min(II)I

    move-result v9

    aget-object v8, v8, v9

    aput-object v8, v6, v7

    invoke-static {v5, v6}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    goto :goto_0
.end method


# virtual methods
.method public onBind(Lcom/vkontakte/android/data/Subscription;)V
    .locals 8
    .param p1, "item"    # Lcom/vkontakte/android/data/Subscription;

    .prologue
    const/4 v6, 0x1

    const/16 v4, 0x8

    const/4 v3, 0x0

    .line 40
    iget-object v2, p0, Lcom/vkontakte/android/ui/holder/money/SubscriptionHeaderHolder;->title:Landroid/widget/TextView;

    iget-object v5, p1, Lcom/vkontakte/android/data/Subscription;->title:Ljava/lang/String;

    invoke-virtual {v2, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 41
    iget-object v2, p0, Lcom/vkontakte/android/ui/holder/money/SubscriptionHeaderHolder;->subtitle:Landroid/widget/TextView;

    iget-object v5, p1, Lcom/vkontakte/android/data/Subscription;->subtitle:Ljava/lang/String;

    invoke-static {v2, v5, v6}, Lcom/vkontakte/android/ViewUtils;->setText(Landroid/widget/TextView;Ljava/lang/Object;Z)V

    .line 42
    iget-object v2, p0, Lcom/vkontakte/android/ui/holder/money/SubscriptionHeaderHolder;->description:Landroid/widget/TextView;

    iget-object v5, p1, Lcom/vkontakte/android/data/Subscription;->description:Ljava/lang/String;

    invoke-virtual {v2, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 43
    iget-object v2, p0, Lcom/vkontakte/android/ui/holder/money/SubscriptionHeaderHolder;->billing_type:Landroid/widget/TextView;

    iget-object v5, p1, Lcom/vkontakte/android/data/Subscription;->merchant_title:Ljava/lang/String;

    invoke-virtual {v2, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 44
    iget-object v2, p1, Lcom/vkontakte/android/data/Subscription;->photo:Lcom/vkontakte/android/Photo;

    const/high16 v5, 0x42200000    # 40.0f

    invoke-static {v5}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v5

    invoke-virtual {v2, v5}, Lcom/vkontakte/android/Photo;->getImageByWidth(I)Lcom/vkontakte/android/Photo$Image;

    move-result-object v1

    .line 45
    .local v1, "image":Lcom/vkontakte/android/Photo$Image;
    if-eqz v1, :cond_1

    .line 46
    iget-object v2, p0, Lcom/vkontakte/android/ui/holder/money/SubscriptionHeaderHolder;->icon:Lcom/vk/imageloader/view/VKImageView;

    iget-object v5, v1, Lcom/vkontakte/android/Photo$Image;->url:Ljava/lang/String;

    invoke-virtual {v2, v5}, Lcom/vk/imageloader/view/VKImageView;->load(Ljava/lang/String;)V

    .line 50
    :goto_0
    invoke-static {p0, p1}, Lcom/vkontakte/android/ui/holder/money/SubscriptionHeaderHolder;->getExpiredDateText(Lcom/vkontakte/android/ui/holder/RecyclerHolder;Lcom/vkontakte/android/data/Subscription;)Ljava/lang/String;

    move-result-object v0

    .line 51
    .local v0, "expireDate":Ljava/lang/String;
    if-eqz v0, :cond_2

    .line 52
    iget-object v2, p0, Lcom/vkontakte/android/ui/holder/money/SubscriptionHeaderHolder;->tillDate:Landroid/widget/TextView;

    invoke-virtual {v2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 53
    iget-object v2, p0, Lcom/vkontakte/android/ui/holder/money/SubscriptionHeaderHolder;->tillDate:Landroid/widget/TextView;

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setVisibility(I)V

    .line 54
    iget-object v2, p0, Lcom/vkontakte/android/ui/holder/money/SubscriptionHeaderHolder;->nextBillTitle:Landroid/view/View;

    invoke-virtual {v2, v3}, Landroid/view/View;->setVisibility(I)V

    .line 59
    :goto_1
    iget-object v5, p0, Lcom/vkontakte/android/ui/holder/money/SubscriptionHeaderHolder;->not_purchased_block:Landroid/view/View;

    iget-boolean v2, p1, Lcom/vkontakte/android/data/Subscription;->purchased:Z

    if-nez v2, :cond_3

    move v2, v3

    :goto_2
    invoke-virtual {v5, v2}, Landroid/view/View;->setVisibility(I)V

    .line 60
    iget-object v2, p0, Lcom/vkontakte/android/ui/holder/money/SubscriptionHeaderHolder;->purchased_block:Landroid/view/View;

    iget-boolean v5, p1, Lcom/vkontakte/android/data/Subscription;->purchased:Z

    if-eqz v5, :cond_0

    move v4, v3

    :cond_0
    invoke-virtual {v2, v4}, Landroid/view/View;->setVisibility(I)V

    .line 61
    iget-object v2, p0, Lcom/vkontakte/android/ui/holder/money/SubscriptionHeaderHolder;->cost:Landroid/widget/TextView;

    invoke-virtual {p0}, Lcom/vkontakte/android/ui/holder/money/SubscriptionHeaderHolder;->getContext()Landroid/content/Context;

    move-result-object v4

    const v5, 0x7f0803ed

    new-array v6, v6, [Ljava/lang/Object;

    iget-object v7, p1, Lcom/vkontakte/android/data/Subscription;->priceStr:Ljava/lang/String;

    aput-object v7, v6, v3

    invoke-virtual {v4, v5, v6}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 62
    return-void

    .line 48
    .end local v0    # "expireDate":Ljava/lang/String;
    :cond_1
    iget-object v2, p0, Lcom/vkontakte/android/ui/holder/money/SubscriptionHeaderHolder;->icon:Lcom/vk/imageloader/view/VKImageView;

    invoke-virtual {v2}, Lcom/vk/imageloader/view/VKImageView;->clear()V

    goto :goto_0

    .line 56
    .restart local v0    # "expireDate":Ljava/lang/String;
    :cond_2
    iget-object v2, p0, Lcom/vkontakte/android/ui/holder/money/SubscriptionHeaderHolder;->tillDate:Landroid/widget/TextView;

    invoke-virtual {v2, v4}, Landroid/widget/TextView;->setVisibility(I)V

    .line 57
    iget-object v2, p0, Lcom/vkontakte/android/ui/holder/money/SubscriptionHeaderHolder;->nextBillTitle:Landroid/view/View;

    invoke-virtual {v2, v4}, Landroid/view/View;->setVisibility(I)V

    goto :goto_1

    :cond_3
    move v2, v4

    .line 59
    goto :goto_2
.end method

.method public bridge synthetic onBind(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 18
    check-cast p1, Lcom/vkontakte/android/data/Subscription;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/ui/holder/money/SubscriptionHeaderHolder;->onBind(Lcom/vkontakte/android/data/Subscription;)V

    return-void
.end method

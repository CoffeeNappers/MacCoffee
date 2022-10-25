.class Lcom/vkontakte/android/attachments/PrettyCardAttachment$ViewHolder;
.super Lcom/vkontakte/android/ui/holder/RecyclerHolder;
.source "PrettyCardAttachment.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/attachments/PrettyCardAttachment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "ViewHolder"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/ui/holder/RecyclerHolder",
        "<",
        "Lcom/vkontakte/android/attachments/PrettyCardAttachment$Card;",
        ">;",
        "Landroid/view/View$OnClickListener;"
    }
.end annotation


# static fields
.field private static final CLICK_EVENT:Ljava/lang/String; = "ads/click_pretty_card"


# instance fields
.field private adsButton:Landroid/widget/TextView;

.field private image:Lcom/vk/imageloader/view/VKSnippetImageView;

.field private item:Lcom/vkontakte/android/attachments/PrettyCardAttachment$Card;

.field private oldPrice:Landroid/widget/TextView;

.field private price:Landroid/widget/TextView;

.field private title:Landroid/widget/TextView;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/view/ViewGroup;)V
    .locals 3
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "parent"    # Landroid/view/ViewGroup;

    .prologue
    const/4 v2, 0x0

    .line 276
    const v0, 0x7f030052

    invoke-direct {p0, p1, v0, p2}, Lcom/vkontakte/android/ui/holder/RecyclerHolder;-><init>(Landroid/content/Context;ILandroid/view/ViewGroup;)V

    .line 278
    const v0, 0x7f100124

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/attachments/PrettyCardAttachment$ViewHolder;->$(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/vk/imageloader/view/VKSnippetImageView;

    iput-object v0, p0, Lcom/vkontakte/android/attachments/PrettyCardAttachment$ViewHolder;->image:Lcom/vk/imageloader/view/VKSnippetImageView;

    .line 279
    iget-object v0, p0, Lcom/vkontakte/android/attachments/PrettyCardAttachment$ViewHolder;->image:Lcom/vk/imageloader/view/VKSnippetImageView;

    invoke-virtual {v0, v2}, Lcom/vk/imageloader/view/VKSnippetImageView;->setDrawBorder(Z)V

    .line 280
    iget-object v0, p0, Lcom/vkontakte/android/attachments/PrettyCardAttachment$ViewHolder;->image:Lcom/vk/imageloader/view/VKSnippetImageView;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/vk/imageloader/view/VKSnippetImageView;->setType(I)V

    .line 285
    iget-object v0, p0, Lcom/vkontakte/android/attachments/PrettyCardAttachment$ViewHolder;->image:Lcom/vk/imageloader/view/VKSnippetImageView;

    invoke-virtual {v0, v2}, Lcom/vk/imageloader/view/VKSnippetImageView;->setBackgroundResource(I)V

    .line 287
    const v0, 0x7f100128

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/attachments/PrettyCardAttachment$ViewHolder;->$(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/vkontakte/android/attachments/PrettyCardAttachment$ViewHolder;->title:Landroid/widget/TextView;

    .line 288
    const v0, 0x7f1001f7

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/attachments/PrettyCardAttachment$ViewHolder;->$(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/vkontakte/android/attachments/PrettyCardAttachment$ViewHolder;->price:Landroid/widget/TextView;

    .line 290
    const v0, 0x7f1001f6

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/attachments/PrettyCardAttachment$ViewHolder;->$(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/vkontakte/android/attachments/PrettyCardAttachment$ViewHolder;->oldPrice:Landroid/widget/TextView;

    .line 291
    iget-object v0, p0, Lcom/vkontakte/android/attachments/PrettyCardAttachment$ViewHolder;->oldPrice:Landroid/widget/TextView;

    const/16 v1, 0x11

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setPaintFlags(I)V

    .line 293
    const v0, 0x7f1001f8

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/attachments/PrettyCardAttachment$ViewHolder;->$(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/vkontakte/android/attachments/PrettyCardAttachment$ViewHolder;->adsButton:Landroid/widget/TextView;

    .line 295
    iget-object v0, p0, Lcom/vkontakte/android/attachments/PrettyCardAttachment$ViewHolder;->adsButton:Landroid/widget/TextView;

    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 297
    const v0, 0x7f1001f5

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/attachments/PrettyCardAttachment$ViewHolder;->$(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 298
    return-void
.end method

.method private trackClickEvent()V
    .locals 3

    .prologue
    .line 365
    iget-object v0, p0, Lcom/vkontakte/android/attachments/PrettyCardAttachment$ViewHolder;->item:Lcom/vkontakte/android/attachments/PrettyCardAttachment$Card;

    iget-object v0, v0, Lcom/vkontakte/android/attachments/PrettyCardAttachment$Card;->postInteract:Lcom/vkontakte/android/data/PostInteract;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/vkontakte/android/attachments/PrettyCardAttachment$ViewHolder;->item:Lcom/vkontakte/android/attachments/PrettyCardAttachment$Card;

    iget-object v0, v0, Lcom/vkontakte/android/attachments/PrettyCardAttachment$Card;->postInteract:Lcom/vkontakte/android/data/PostInteract;

    iget-object v0, v0, Lcom/vkontakte/android/data/PostInteract;->adData:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/vkontakte/android/attachments/PrettyCardAttachment$ViewHolder;->item:Lcom/vkontakte/android/attachments/PrettyCardAttachment$Card;

    iget-object v0, v0, Lcom/vkontakte/android/attachments/PrettyCardAttachment$Card;->cardData:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 366
    const-string/jumbo v0, "ads/click_pretty_card"

    invoke-static {v0}, Lcom/vkontakte/android/data/Analytics;->track(Ljava/lang/String;)Lcom/vkontakte/android/data/Analytics$EventBuilder;

    move-result-object v0

    const-string/jumbo v1, "ad_data"

    iget-object v2, p0, Lcom/vkontakte/android/attachments/PrettyCardAttachment$ViewHolder;->item:Lcom/vkontakte/android/attachments/PrettyCardAttachment$Card;

    iget-object v2, v2, Lcom/vkontakte/android/attachments/PrettyCardAttachment$Card;->postInteract:Lcom/vkontakte/android/data/PostInteract;

    iget-object v2, v2, Lcom/vkontakte/android/data/PostInteract;->adData:Ljava/lang/String;

    .line 367
    invoke-virtual {v0, v1, v2}, Lcom/vkontakte/android/data/Analytics$EventBuilder;->addParam(Ljava/lang/String;Ljava/lang/Object;)Lcom/vkontakte/android/data/Analytics$EventBuilder;

    move-result-object v0

    const-string/jumbo v1, "card_data"

    iget-object v2, p0, Lcom/vkontakte/android/attachments/PrettyCardAttachment$ViewHolder;->item:Lcom/vkontakte/android/attachments/PrettyCardAttachment$Card;

    iget-object v2, v2, Lcom/vkontakte/android/attachments/PrettyCardAttachment$Card;->cardData:Ljava/lang/String;

    .line 368
    invoke-virtual {v0, v1, v2}, Lcom/vkontakte/android/data/Analytics$EventBuilder;->addParam(Ljava/lang/String;Ljava/lang/Object;)Lcom/vkontakte/android/data/Analytics$EventBuilder;

    move-result-object v0

    .line 369
    invoke-virtual {v0}, Lcom/vkontakte/android/data/Analytics$EventBuilder;->sendNow()Lcom/vkontakte/android/data/Analytics$EventBuilder;

    .line 371
    :cond_0
    return-void
.end method

.method private trackPostInteractEvent(Ljava/lang/String;)V
    .locals 2
    .param p1, "link"    # Ljava/lang/String;

    .prologue
    .line 356
    iget-object v0, p0, Lcom/vkontakte/android/attachments/PrettyCardAttachment$ViewHolder;->item:Lcom/vkontakte/android/attachments/PrettyCardAttachment$Card;

    iget-object v0, v0, Lcom/vkontakte/android/attachments/PrettyCardAttachment$Card;->postInteract:Lcom/vkontakte/android/data/PostInteract;

    if-eqz v0, :cond_0

    .line 357
    iget-object v0, p0, Lcom/vkontakte/android/attachments/PrettyCardAttachment$ViewHolder;->item:Lcom/vkontakte/android/attachments/PrettyCardAttachment$Card;

    iget-object v0, v0, Lcom/vkontakte/android/attachments/PrettyCardAttachment$Card;->postInteract:Lcom/vkontakte/android/data/PostInteract;

    .line 358
    invoke-virtual {v0, p1}, Lcom/vkontakte/android/data/PostInteract;->setLink(Ljava/lang/String;)Lcom/vkontakte/android/data/PostInteract;

    move-result-object v0

    iget-object v1, p0, Lcom/vkontakte/android/attachments/PrettyCardAttachment$ViewHolder;->item:Lcom/vkontakte/android/attachments/PrettyCardAttachment$Card;

    iget-object v1, v1, Lcom/vkontakte/android/attachments/PrettyCardAttachment$Card;->cardData:Ljava/lang/String;

    .line 359
    invoke-virtual {v0, v1}, Lcom/vkontakte/android/data/PostInteract;->setCardData(Ljava/lang/String;)Lcom/vkontakte/android/data/PostInteract;

    move-result-object v0

    sget-object v1, Lcom/vkontakte/android/data/PostInteract$Type;->click_pretty_card:Lcom/vkontakte/android/data/PostInteract$Type;

    .line 360
    invoke-virtual {v0, v1}, Lcom/vkontakte/android/data/PostInteract;->commit(Lcom/vkontakte/android/data/PostInteract$Type;)V

    .line 362
    :cond_0
    return-void
.end method


# virtual methods
.method public onBind(Lcom/vkontakte/android/attachments/PrettyCardAttachment$Card;)V
    .locals 5
    .param p1, "item"    # Lcom/vkontakte/android/attachments/PrettyCardAttachment$Card;

    .prologue
    const/4 v4, 0x1

    .line 302
    iput-object p1, p0, Lcom/vkontakte/android/attachments/PrettyCardAttachment$ViewHolder;->item:Lcom/vkontakte/android/attachments/PrettyCardAttachment$Card;

    .line 304
    iget-object v2, p0, Lcom/vkontakte/android/attachments/PrettyCardAttachment$ViewHolder;->image:Lcom/vk/imageloader/view/VKSnippetImageView;

    invoke-virtual {v2}, Lcom/vk/imageloader/view/VKSnippetImageView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v2

    iget v1, v2, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 305
    .local v1, "width":I
    iget-object v2, p1, Lcom/vkontakte/android/attachments/PrettyCardAttachment$Card;->image:Lcom/vk/core/common/Image;

    invoke-virtual {v2, v1}, Lcom/vk/core/common/Image;->getImageByWidth(I)Lcom/vk/core/common/ImageSize;

    move-result-object v0

    .line 306
    .local v0, "imageSize":Lcom/vk/core/common/ImageSize;
    if-eqz v0, :cond_0

    .line 307
    iget-object v2, p0, Lcom/vkontakte/android/attachments/PrettyCardAttachment$ViewHolder;->image:Lcom/vk/imageloader/view/VKSnippetImageView;

    invoke-virtual {v0}, Lcom/vk/core/common/ImageSize;->getUrl()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/vk/imageloader/view/VKSnippetImageView;->load(Ljava/lang/String;)V

    .line 310
    :cond_0
    iget-object v2, p0, Lcom/vkontakte/android/attachments/PrettyCardAttachment$ViewHolder;->title:Landroid/widget/TextView;

    iget-object v3, p1, Lcom/vkontakte/android/attachments/PrettyCardAttachment$Card;->title:Ljava/lang/String;

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 312
    iget-object v2, p0, Lcom/vkontakte/android/attachments/PrettyCardAttachment$ViewHolder;->price:Landroid/widget/TextView;

    iget-object v3, p1, Lcom/vkontakte/android/attachments/PrettyCardAttachment$Card;->price:Ljava/lang/String;

    invoke-static {v2, v3, v4}, Lcom/vkontakte/android/ViewUtils;->setText(Landroid/widget/TextView;Ljava/lang/Object;Z)V

    .line 313
    iget-object v2, p0, Lcom/vkontakte/android/attachments/PrettyCardAttachment$ViewHolder;->oldPrice:Landroid/widget/TextView;

    iget-object v3, p1, Lcom/vkontakte/android/attachments/PrettyCardAttachment$Card;->priceOld:Ljava/lang/String;

    invoke-static {v2, v3, v4}, Lcom/vkontakte/android/ViewUtils;->setText(Landroid/widget/TextView;Ljava/lang/Object;Z)V

    .line 315
    iget-object v2, p1, Lcom/vkontakte/android/attachments/PrettyCardAttachment$Card;->button:Lcom/vkontakte/android/attachments/PrettyCardAttachment$Button;

    if-eqz v2, :cond_2

    .line 316
    iget-object v2, p0, Lcom/vkontakte/android/attachments/PrettyCardAttachment$ViewHolder;->adsButton:Landroid/widget/TextView;

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setVisibility(I)V

    .line 317
    iget-object v2, p0, Lcom/vkontakte/android/attachments/PrettyCardAttachment$ViewHolder;->adsButton:Landroid/widget/TextView;

    iget-object v3, p1, Lcom/vkontakte/android/attachments/PrettyCardAttachment$Card;->button:Lcom/vkontakte/android/attachments/PrettyCardAttachment$Button;

    iget-object v3, v3, Lcom/vkontakte/android/attachments/PrettyCardAttachment$Button;->title:Ljava/lang/String;

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 322
    :goto_0
    invoke-static {p1}, Lcom/vkontakte/android/attachments/PrettyCardAttachment$Card;->access$100(Lcom/vkontakte/android/attachments/PrettyCardAttachment$Card;)Lcom/vkontakte/android/statistics/StatisticPrettyCard;

    move-result-object v2

    if-eqz v2, :cond_1

    invoke-static {p1}, Lcom/vkontakte/android/attachments/PrettyCardAttachment$Card;->access$100(Lcom/vkontakte/android/attachments/PrettyCardAttachment$Card;)Lcom/vkontakte/android/statistics/StatisticPrettyCard;

    move-result-object v2

    invoke-virtual {v2}, Lcom/vkontakte/android/statistics/StatisticPrettyCard;->isValid()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 323
    invoke-static {p1}, Lcom/vkontakte/android/attachments/PrettyCardAttachment$Card;->access$100(Lcom/vkontakte/android/attachments/PrettyCardAttachment$Card;)Lcom/vkontakte/android/statistics/StatisticPrettyCard;

    move-result-object v2

    invoke-static {v2}, Lcom/vkontakte/android/data/Analytics;->trackImpression(Lcom/vkontakte/android/statistics/StatisticPrettyCard;)V

    .line 325
    :cond_1
    return-void

    .line 319
    :cond_2
    iget-object v2, p0, Lcom/vkontakte/android/attachments/PrettyCardAttachment$ViewHolder;->adsButton:Landroid/widget/TextView;

    const/16 v3, 0x8

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setVisibility(I)V

    goto :goto_0
.end method

.method public bridge synthetic onBind(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 263
    check-cast p1, Lcom/vkontakte/android/attachments/PrettyCardAttachment$Card;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/attachments/PrettyCardAttachment$ViewHolder;->onBind(Lcom/vkontakte/android/attachments/PrettyCardAttachment$Card;)V

    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 3
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 329
    iget-object v1, p0, Lcom/vkontakte/android/attachments/PrettyCardAttachment$ViewHolder;->item:Lcom/vkontakte/android/attachments/PrettyCardAttachment$Card;

    if-nez v1, :cond_1

    .line 353
    :cond_0
    :goto_0
    return-void

    .line 333
    :cond_1
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    .line 335
    .local v0, "context":Landroid/content/Context;
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v1

    packed-switch v1, :pswitch_data_0

    :pswitch_0
    goto :goto_0

    .line 337
    :pswitch_1
    iget-object v1, p0, Lcom/vkontakte/android/attachments/PrettyCardAttachment$ViewHolder;->item:Lcom/vkontakte/android/attachments/PrettyCardAttachment$Card;

    iget-object v1, v1, Lcom/vkontakte/android/attachments/PrettyCardAttachment$Card;->linkUrl:Ljava/lang/String;

    invoke-direct {p0, v1}, Lcom/vkontakte/android/attachments/PrettyCardAttachment$ViewHolder;->trackPostInteractEvent(Ljava/lang/String;)V

    .line 338
    invoke-direct {p0}, Lcom/vkontakte/android/attachments/PrettyCardAttachment$ViewHolder;->trackClickEvent()V

    .line 340
    iget-object v1, p0, Lcom/vkontakte/android/attachments/PrettyCardAttachment$ViewHolder;->item:Lcom/vkontakte/android/attachments/PrettyCardAttachment$Card;

    invoke-static {v0, v1}, Lcom/vkontakte/android/utils/AdsUtil;->onPrettyCardClick(Landroid/content/Context;Lcom/vkontakte/android/attachments/PrettyCardAttachment$Card;)V

    goto :goto_0

    .line 343
    :pswitch_2
    iget-object v1, p0, Lcom/vkontakte/android/attachments/PrettyCardAttachment$ViewHolder;->item:Lcom/vkontakte/android/attachments/PrettyCardAttachment$Card;

    iget-object v1, v1, Lcom/vkontakte/android/attachments/PrettyCardAttachment$Card;->button:Lcom/vkontakte/android/attachments/PrettyCardAttachment$Button;

    if-eqz v1, :cond_0

    .line 347
    iget-object v1, p0, Lcom/vkontakte/android/attachments/PrettyCardAttachment$ViewHolder;->item:Lcom/vkontakte/android/attachments/PrettyCardAttachment$Card;

    iget-object v1, v1, Lcom/vkontakte/android/attachments/PrettyCardAttachment$Card;->button:Lcom/vkontakte/android/attachments/PrettyCardAttachment$Button;

    iget-object v1, v1, Lcom/vkontakte/android/attachments/PrettyCardAttachment$Button;->action:Lcom/vkontakte/android/api/ButtonAction;

    iget-object v1, v1, Lcom/vkontakte/android/api/ButtonAction;->url:Ljava/lang/String;

    invoke-direct {p0, v1}, Lcom/vkontakte/android/attachments/PrettyCardAttachment$ViewHolder;->trackPostInteractEvent(Ljava/lang/String;)V

    .line 348
    invoke-direct {p0}, Lcom/vkontakte/android/attachments/PrettyCardAttachment$ViewHolder;->trackClickEvent()V

    .line 350
    iget-object v1, p0, Lcom/vkontakte/android/attachments/PrettyCardAttachment$ViewHolder;->item:Lcom/vkontakte/android/attachments/PrettyCardAttachment$Card;

    iget-object v1, v1, Lcom/vkontakte/android/attachments/PrettyCardAttachment$Card;->button:Lcom/vkontakte/android/attachments/PrettyCardAttachment$Button;

    iget-object v1, v1, Lcom/vkontakte/android/attachments/PrettyCardAttachment$Button;->action:Lcom/vkontakte/android/api/ButtonAction;

    iget-object v2, p0, Lcom/vkontakte/android/attachments/PrettyCardAttachment$ViewHolder;->item:Lcom/vkontakte/android/attachments/PrettyCardAttachment$Card;

    iget-object v2, v2, Lcom/vkontakte/android/attachments/PrettyCardAttachment$Card;->postInteract:Lcom/vkontakte/android/data/PostInteract;

    invoke-static {v0, v1, v2}, Lcom/vkontakte/android/utils/AdsUtil;->onActionButtonClick(Landroid/content/Context;Lcom/vkontakte/android/api/ButtonAction;Lcom/vkontakte/android/data/PostInteract;)V

    goto :goto_0

    .line 335
    nop

    :pswitch_data_0
    .packed-switch 0x7f1001f5
        :pswitch_1
        :pswitch_0
        :pswitch_0
        :pswitch_2
    .end packed-switch
.end method

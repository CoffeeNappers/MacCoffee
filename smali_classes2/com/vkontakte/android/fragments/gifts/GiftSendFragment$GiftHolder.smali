.class final Lcom/vkontakte/android/fragments/gifts/GiftSendFragment$GiftHolder;
.super Lcom/vkontakte/android/ui/holder/RecyclerHolder;
.source "GiftSendFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/fragments/gifts/GiftSendFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x10
    name = "GiftHolder"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/ui/holder/RecyclerHolder",
        "<",
        "Lcom/vkontakte/android/api/models/CatalogedGift;",
        ">;"
    }
.end annotation


# instance fields
.field private mDescription:Landroid/widget/TextView;

.field private final mPhoto:Lcom/vk/imageloader/view/VKImageView;

.field private mSubTitle:Landroid/widget/TextView;

.field private mTitle:Landroid/widget/TextView;

.field final synthetic this$0:Lcom/vkontakte/android/fragments/gifts/GiftSendFragment;


# direct methods
.method public constructor <init>(Lcom/vkontakte/android/fragments/gifts/GiftSendFragment;Landroid/view/ViewGroup;)V
    .locals 1
    .param p1, "this$0"    # Lcom/vkontakte/android/fragments/gifts/GiftSendFragment;
    .param p2, "parent"    # Landroid/view/ViewGroup;

    .prologue
    .line 584
    iput-object p1, p0, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment$GiftHolder;->this$0:Lcom/vkontakte/android/fragments/gifts/GiftSendFragment;

    .line 585
    const v0, 0x7f0300b4

    invoke-direct {p0, v0, p2}, Lcom/vkontakte/android/ui/holder/RecyclerHolder;-><init>(ILandroid/view/ViewGroup;)V

    .line 586
    const v0, 0x7f100128

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment$GiftHolder;->$(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment$GiftHolder;->mTitle:Landroid/widget/TextView;

    .line 587
    const v0, 0x7f10019c

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment$GiftHolder;->$(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment$GiftHolder;->mSubTitle:Landroid/widget/TextView;

    .line 588
    const v0, 0x7f1001cc

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment$GiftHolder;->$(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment$GiftHolder;->mDescription:Landroid/widget/TextView;

    .line 589
    const v0, 0x7f1001e8

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment$GiftHolder;->$(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/vk/imageloader/view/VKImageView;

    iput-object v0, p0, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment$GiftHolder;->mPhoto:Lcom/vk/imageloader/view/VKImageView;

    .line 590
    return-void
.end method


# virtual methods
.method public onBind(Lcom/vkontakte/android/api/models/CatalogedGift;)V
    .locals 4
    .param p1, "item"    # Lcom/vkontakte/android/api/models/CatalogedGift;

    .prologue
    const/16 v2, 0x8

    const/4 v1, 0x0

    .line 594
    iget-object v3, p0, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment$GiftHolder;->mDescription:Landroid/widget/TextView;

    iget-object v0, p1, Lcom/vkontakte/android/api/models/CatalogedGift;->description:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    move v0, v1

    :goto_0
    invoke-virtual {v3, v0}, Landroid/widget/TextView;->setVisibility(I)V

    .line 596
    iget-object v0, p0, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment$GiftHolder;->mDescription:Landroid/widget/TextView;

    iget-object v3, p1, Lcom/vkontakte/android/api/models/CatalogedGift;->description:Ljava/lang/String;

    invoke-static {v3}, Lcom/vkontakte/android/WikiLinkParser;->parse(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object v3

    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 598
    iget-object v0, p0, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment$GiftHolder;->mTitle:Landroid/widget/TextView;

    iget-object v3, p0, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment$GiftHolder;->this$0:Lcom/vkontakte/android/fragments/gifts/GiftSendFragment;

    iget-object v3, v3, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment;->mTitleText:Ljava/lang/CharSequence;

    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 599
    iget-object v0, p0, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment$GiftHolder;->mSubTitle:Landroid/widget/TextView;

    iget-object v3, p0, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment$GiftHolder;->this$0:Lcom/vkontakte/android/fragments/gifts/GiftSendFragment;

    iget-object v3, v3, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment;->mSubtitleText:Ljava/lang/CharSequence;

    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 600
    iget-object v0, p0, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment$GiftHolder;->mSubTitle:Landroid/widget/TextView;

    iget-object v3, p0, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment$GiftHolder;->this$0:Lcom/vkontakte/android/fragments/gifts/GiftSendFragment;

    iget-boolean v3, v3, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment;->mSubTitleVisible:Z

    if-eqz v3, :cond_1

    :goto_1
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setVisibility(I)V

    .line 602
    iget-object v0, p0, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment$GiftHolder;->mPhoto:Lcom/vk/imageloader/view/VKImageView;

    iget-object v1, p1, Lcom/vkontakte/android/api/models/CatalogedGift;->gift:Lcom/vkontakte/android/api/models/Gift;

    iget-object v1, v1, Lcom/vkontakte/android/api/models/Gift;->thumb_256:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/vk/imageloader/view/VKImageView;->load(Ljava/lang/String;)V

    .line 603
    return-void

    :cond_0
    move v0, v2

    .line 594
    goto :goto_0

    :cond_1
    move v1, v2

    .line 600
    goto :goto_1
.end method

.method public bridge synthetic onBind(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 577
    check-cast p1, Lcom/vkontakte/android/api/models/CatalogedGift;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment$GiftHolder;->onBind(Lcom/vkontakte/android/api/models/CatalogedGift;)V

    return-void
.end method

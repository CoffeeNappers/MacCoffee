.class public Lcom/vkontakte/android/fragments/VKLiveInstallBannerFragment;
.super Lcom/vkontakte/android/fragments/VKAlertBannerFragment;
.source "VKLiveInstallBannerFragment.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 6
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/VKAlertBannerFragment;-><init>()V

    return-void
.end method


# virtual methods
.method protected action()V
    .locals 1

    .prologue
    .line 18
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/VKLiveInstallBannerFragment;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/vkontakte/android/utils/VKLiveUtils;->openMarket(Landroid/content/Context;)V

    .line 19
    invoke-super {p0}, Lcom/vkontakte/android/fragments/VKAlertBannerFragment;->action()V

    .line 20
    return-void
.end method

.method protected bind()V
    .locals 2

    .prologue
    .line 10
    iget-object v0, p0, Lcom/vkontakte/android/fragments/VKLiveInstallBannerFragment;->icon:Landroid/widget/ImageView;

    const v1, 0x7f0203d6

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 11
    iget-object v0, p0, Lcom/vkontakte/android/fragments/VKLiveInstallBannerFragment;->title:Landroid/widget/TextView;

    const v1, 0x7f080777

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    .line 12
    iget-object v0, p0, Lcom/vkontakte/android/fragments/VKLiveInstallBannerFragment;->subtitle:Landroid/widget/TextView;

    const v1, 0x7f080776

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    .line 13
    iget-object v0, p0, Lcom/vkontakte/android/fragments/VKLiveInstallBannerFragment;->buttonTitle:Landroid/widget/TextView;

    const v1, 0x7f080775

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    .line 14
    return-void
.end method

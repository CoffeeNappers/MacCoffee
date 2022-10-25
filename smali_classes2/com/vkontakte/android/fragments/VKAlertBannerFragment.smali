.class public Lcom/vkontakte/android/fragments/VKAlertBannerFragment;
.super Lcom/vkontakte/android/fragments/VKAlertFragment;
.source "VKAlertBannerFragment.java"


# instance fields
.field protected buttonTitle:Landroid/widget/TextView;

.field protected icon:Landroid/widget/ImageView;

.field protected subtitle:Landroid/widget/TextView;

.field protected title:Landroid/widget/TextView;

.field private url:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 15
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/VKAlertFragment;-><init>()V

    return-void
.end method


# virtual methods
.method protected action()V
    .locals 4

    .prologue
    .line 47
    iget-object v1, p0, Lcom/vkontakte/android/fragments/VKAlertBannerFragment;->url:Ljava/lang/String;

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 49
    :try_start_0
    new-instance v1, Landroid/content/Intent;

    const-string/jumbo v2, "android.intent.action.VIEW"

    iget-object v3, p0, Lcom/vkontakte/android/fragments/VKAlertBannerFragment;->url:Ljava/lang/String;

    invoke-static {v3}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v3

    invoke-direct {v1, v2, v3}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    invoke-virtual {p0, v1}, Lcom/vkontakte/android/fragments/VKAlertBannerFragment;->startActivity(Landroid/content/Intent;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 54
    :cond_0
    :goto_0
    invoke-super {p0}, Lcom/vkontakte/android/fragments/VKAlertFragment;->action()V

    .line 55
    return-void

    .line 50
    :catch_0
    move-exception v0

    .line 51
    .local v0, "e":Ljava/lang/Exception;
    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Object;

    invoke-static {v0, v1}, Lcom/vkontakte/android/utils/L;->e(Ljava/lang/Throwable;[Ljava/lang/Object;)V

    goto :goto_0
.end method

.method protected bind()V
    .locals 4

    .prologue
    .line 58
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/VKAlertBannerFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    .line 59
    .local v0, "arguments":Landroid/os/Bundle;
    if-eqz v0, :cond_0

    .line 60
    const-string/jumbo v2, "Builder"

    invoke-virtual {v0, v2}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v1

    check-cast v1, Lcom/vkontakte/android/fragments/VKAlertFragment$Builder;

    .line 61
    .local v1, "builder":Lcom/vkontakte/android/fragments/VKAlertFragment$Builder;
    if-eqz v1, :cond_0

    .line 62
    iget-object v2, p0, Lcom/vkontakte/android/fragments/VKAlertBannerFragment;->icon:Landroid/widget/ImageView;

    iget v3, v1, Lcom/vkontakte/android/fragments/VKAlertFragment$Builder;->iconId:I

    invoke-virtual {v2, v3}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 63
    iget-object v2, p0, Lcom/vkontakte/android/fragments/VKAlertBannerFragment;->title:Landroid/widget/TextView;

    iget-object v3, v1, Lcom/vkontakte/android/fragments/VKAlertFragment$Builder;->titleId:Ljava/lang/String;

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 64
    iget-object v2, p0, Lcom/vkontakte/android/fragments/VKAlertBannerFragment;->subtitle:Landroid/widget/TextView;

    iget-object v3, v1, Lcom/vkontakte/android/fragments/VKAlertFragment$Builder;->message:Ljava/lang/String;

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 65
    iget-object v2, p0, Lcom/vkontakte/android/fragments/VKAlertBannerFragment;->buttonTitle:Landroid/widget/TextView;

    iget-object v3, v1, Lcom/vkontakte/android/fragments/VKAlertFragment$Builder;->positiveButtonTitleId:Ljava/lang/String;

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 66
    iget-object v2, v1, Lcom/vkontakte/android/fragments/VKAlertFragment$Builder;->url:Ljava/lang/String;

    iput-object v2, p0, Lcom/vkontakte/android/fragments/VKAlertBannerFragment;->url:Ljava/lang/String;

    .line 71
    .end local v1    # "builder":Lcom/vkontakte/android/fragments/VKAlertFragment$Builder;
    :goto_0
    return-void

    .line 70
    :cond_0
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/VKAlertBannerFragment;->getActivity()Landroid/app/Activity;

    move-result-object v2

    invoke-virtual {v2}, Landroid/app/Activity;->finish()V

    goto :goto_0
.end method

.method protected init(Landroid/view/View;)V
    .locals 2
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 30
    const v0, 0x7f100127

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/vkontakte/android/fragments/VKAlertBannerFragment;->icon:Landroid/widget/ImageView;

    .line 31
    const v0, 0x7f100128

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/vkontakte/android/fragments/VKAlertBannerFragment;->title:Landroid/widget/TextView;

    .line 32
    const v0, 0x7f10019c

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/vkontakte/android/fragments/VKAlertBannerFragment;->subtitle:Landroid/widget/TextView;

    .line 33
    const v0, 0x7f10019d

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/vkontakte/android/fragments/VKAlertBannerFragment;->buttonTitle:Landroid/widget/TextView;

    .line 35
    const v0, 0x7f10010f

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    new-instance v1, Lcom/vkontakte/android/fragments/VKAlertBannerFragment$1;

    invoke-direct {v1, p0}, Lcom/vkontakte/android/fragments/VKAlertBannerFragment$1;-><init>(Lcom/vkontakte/android/fragments/VKAlertBannerFragment;)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 42
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/VKAlertBannerFragment;->bind()V

    .line 43
    return-void
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 2
    .param p1, "inflater"    # Landroid/view/LayoutInflater;
    .param p2, "container"    # Landroid/view/ViewGroup;
    .param p3, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 25
    const v0, 0x7f030024

    const/4 v1, 0x0

    invoke-virtual {p1, v0, p2, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    return-object v0
.end method

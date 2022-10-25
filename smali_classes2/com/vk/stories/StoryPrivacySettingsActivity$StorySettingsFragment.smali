.class public Lcom/vk/stories/StoryPrivacySettingsActivity$StorySettingsFragment;
.super Lcom/vkontakte/android/fragments/PrivacyEditFragment;
.source "StoryPrivacySettingsActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vk/stories/StoryPrivacySettingsActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "StorySettingsFragment"
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 85
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/PrivacyEditFragment;-><init>()V

    return-void
.end method


# virtual methods
.method protected getPrivacySettingsTitle()Ljava/lang/String;
    .locals 2

    .prologue
    .line 89
    invoke-virtual {p0}, Lcom/vk/stories/StoryPrivacySettingsActivity$StorySettingsFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    .line 90
    .local v0, "args":Landroid/os/Bundle;
    if-eqz v0, :cond_0

    const-string/jumbo v1, "setting"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 91
    const-string/jumbo v1, "setting"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v1

    check-cast v1, Lcom/vkontakte/android/data/PrivacySetting;

    iget-object v1, v1, Lcom/vkontakte/android/data/PrivacySetting;->title:Ljava/lang/String;

    .line 93
    :goto_0
    return-object v1

    :cond_0
    const v1, 0x7f08052b

    invoke-virtual {p0, v1}, Lcom/vk/stories/StoryPrivacySettingsActivity$StorySettingsFragment;->getString(I)Ljava/lang/String;

    move-result-object v1

    goto :goto_0
.end method

.method synthetic lambda$onViewCreated$0(Landroid/view/View;)V
    .locals 1
    .param p1, "view1"    # Landroid/view/View;

    .prologue
    .line 107
    invoke-virtual {p0}, Lcom/vk/stories/StoryPrivacySettingsActivity$StorySettingsFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 108
    invoke-virtual {p0}, Lcom/vk/stories/StoryPrivacySettingsActivity$StorySettingsFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Activity;->finish()V

    .line 110
    :cond_0
    return-void
.end method

.method public onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .locals 5
    .param p1, "view"    # Landroid/view/View;
    .param p2, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 99
    invoke-super {p0, p1, p2}, Lcom/vkontakte/android/fragments/PrivacyEditFragment;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    .line 101
    invoke-virtual {p0}, Lcom/vk/stories/StoryPrivacySettingsActivity$StorySettingsFragment;->getToolbar()Landroid/support/v7/widget/Toolbar;

    move-result-object v0

    .line 102
    .local v0, "toolbar":Landroid/support/v7/widget/Toolbar;
    if-eqz v0, :cond_0

    .line 103
    new-instance v1, Landroid/graphics/drawable/BitmapDrawable;

    invoke-virtual {p0}, Lcom/vk/stories/StoryPrivacySettingsActivity$StorySettingsFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {p0}, Lcom/vk/stories/StoryPrivacySettingsActivity$StorySettingsFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v4, 0x7f02014f

    invoke-static {v3, v4}, Landroid/graphics/BitmapFactory;->decodeResource(Landroid/content/res/Resources;I)Landroid/graphics/Bitmap;

    move-result-object v3

    invoke-direct {v1, v2, v3}, Landroid/graphics/drawable/BitmapDrawable;-><init>(Landroid/content/res/Resources;Landroid/graphics/Bitmap;)V

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/Toolbar;->setNavigationIcon(Landroid/graphics/drawable/Drawable;)V

    .line 104
    invoke-virtual {v0}, Landroid/support/v7/widget/Toolbar;->getNavigationIcon()Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-virtual {v0}, Landroid/support/v7/widget/Toolbar;->getContext()Landroid/content/Context;

    move-result-object v2

    const v3, 0x7f0f00ba

    invoke-static {v2, v3}, Landroid/support/v4/content/ContextCompat;->getColor(Landroid/content/Context;I)I

    move-result v2

    sget-object v3, Landroid/graphics/PorterDuff$Mode;->MULTIPLY:Landroid/graphics/PorterDuff$Mode;

    invoke-virtual {v1, v2, v3}, Landroid/graphics/drawable/Drawable;->setColorFilter(ILandroid/graphics/PorterDuff$Mode;)V

    .line 105
    const v1, 0x7f08035a

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/Toolbar;->setTitle(I)V

    .line 106
    invoke-static {p0}, Lcom/vk/stories/StoryPrivacySettingsActivity$StorySettingsFragment$$Lambda$1;->lambdaFactory$(Lcom/vk/stories/StoryPrivacySettingsActivity$StorySettingsFragment;)Landroid/view/View$OnClickListener;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/Toolbar;->setNavigationOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 112
    :cond_0
    return-void
.end method

.method protected setResult()V
    .locals 5

    .prologue
    const/4 v4, 0x0

    .line 116
    invoke-virtual {p0}, Lcom/vk/stories/StoryPrivacySettingsActivity$StorySettingsFragment;->getResult()Lcom/vkontakte/android/data/PrivacySetting;

    move-result-object v0

    .line 117
    .local v0, "setting":Lcom/vkontakte/android/data/PrivacySetting;
    if-eqz v0, :cond_0

    .line 118
    new-instance v1, Lcom/vkontakte/android/api/account/AccountSetPrivacy;

    iget-object v2, v0, Lcom/vkontakte/android/data/PrivacySetting;->key:Ljava/lang/String;

    invoke-virtual {v0}, Lcom/vkontakte/android/data/PrivacySetting;->getApiValue()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v1, v2, v3}, Lcom/vkontakte/android/api/account/AccountSetPrivacy;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Lcom/vkontakte/android/api/account/AccountSetPrivacy;->setBackground(Z)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v1

    invoke-virtual {v1, v4, v4}, Lcom/vkontakte/android/api/VKAPIRequest;->persist(Ljava/lang/reflect/Method;Lorg/json/JSONObject;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v1

    invoke-virtual {v1}, Lcom/vkontakte/android/api/VKAPIRequest;->exec()Lcom/vkontakte/android/api/VKAPIRequest;

    .line 120
    :cond_0
    return-void
.end method

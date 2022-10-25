.class public Lcom/vk/stories/StoryPrivacySettingsActivity;
.super Lcom/vkontakte/android/VKActivity;
.source "StoryPrivacySettingsActivity.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vk/stories/StoryPrivacySettingsActivity$StorySettingsFragment;
    }
.end annotation


# instance fields
.field private content:Landroid/widget/FrameLayout;

.field private currentRequest:Lme/grishka/appkit/api/APIRequest;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 25
    invoke-direct {p0}, Lcom/vkontakte/android/VKActivity;-><init>()V

    return-void
.end method

.method static synthetic access$002(Lcom/vk/stories/StoryPrivacySettingsActivity;Lme/grishka/appkit/api/APIRequest;)Lme/grishka/appkit/api/APIRequest;
    .locals 0
    .param p0, "x0"    # Lcom/vk/stories/StoryPrivacySettingsActivity;
    .param p1, "x1"    # Lme/grishka/appkit/api/APIRequest;

    .prologue
    .line 25
    iput-object p1, p0, Lcom/vk/stories/StoryPrivacySettingsActivity;->currentRequest:Lme/grishka/appkit/api/APIRequest;

    return-object p1
.end method

.method static synthetic access$100(Lcom/vk/stories/StoryPrivacySettingsActivity;)Landroid/widget/FrameLayout;
    .locals 1
    .param p0, "x0"    # Lcom/vk/stories/StoryPrivacySettingsActivity;

    .prologue
    .line 25
    iget-object v0, p0, Lcom/vk/stories/StoryPrivacySettingsActivity;->content:Landroid/widget/FrameLayout;

    return-object v0
.end method

.method private loadData()V
    .locals 2

    .prologue
    .line 49
    new-instance v0, Lcom/vkontakte/android/api/account/AccountGetPrivacySettings;

    invoke-direct {v0}, Lcom/vkontakte/android/api/account/AccountGetPrivacySettings;-><init>()V

    new-instance v1, Lcom/vk/stories/StoryPrivacySettingsActivity$1;

    invoke-direct {v1, p0, p0}, Lcom/vk/stories/StoryPrivacySettingsActivity$1;-><init>(Lcom/vk/stories/StoryPrivacySettingsActivity;Landroid/content/Context;)V

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/account/AccountGetPrivacySettings;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    .line 82
    invoke-virtual {v0, p0}, Lcom/vkontakte/android/api/VKAPIRequest;->exec(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    iput-object v0, p0, Lcom/vk/stories/StoryPrivacySettingsActivity;->currentRequest:Lme/grishka/appkit/api/APIRequest;

    .line 83
    return-void
.end method


# virtual methods
.method public onCreate(Landroid/os/Bundle;)V
    .locals 1
    .param p1, "b"    # Landroid/os/Bundle;

    .prologue
    .line 32
    invoke-super {p0, p1}, Lcom/vkontakte/android/VKActivity;->onCreate(Landroid/os/Bundle;)V

    .line 34
    const v0, 0x7f03001e

    invoke-virtual {p0, v0}, Lcom/vk/stories/StoryPrivacySettingsActivity;->setContentView(I)V

    .line 35
    const v0, 0x7f10002b

    invoke-virtual {p0, v0}, Lcom/vk/stories/StoryPrivacySettingsActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/FrameLayout;

    iput-object v0, p0, Lcom/vk/stories/StoryPrivacySettingsActivity;->content:Landroid/widget/FrameLayout;

    .line 37
    invoke-direct {p0}, Lcom/vk/stories/StoryPrivacySettingsActivity;->loadData()V

    .line 38
    return-void
.end method

.method protected onDestroy()V
    .locals 1

    .prologue
    .line 42
    invoke-super {p0}, Lcom/vkontakte/android/VKActivity;->onDestroy()V

    .line 43
    iget-object v0, p0, Lcom/vk/stories/StoryPrivacySettingsActivity;->currentRequest:Lme/grishka/appkit/api/APIRequest;

    if-eqz v0, :cond_0

    .line 44
    iget-object v0, p0, Lcom/vk/stories/StoryPrivacySettingsActivity;->currentRequest:Lme/grishka/appkit/api/APIRequest;

    invoke-virtual {v0}, Lme/grishka/appkit/api/APIRequest;->cancel()V

    .line 46
    :cond_0
    return-void
.end method

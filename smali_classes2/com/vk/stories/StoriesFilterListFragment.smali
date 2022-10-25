.class public Lcom/vk/stories/StoriesFilterListFragment;
.super Lcom/vkontakte/android/fragments/FilterListFragment;
.source "StoriesFilterListFragment.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vk/stories/StoriesFilterListFragment$Builder;
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 20
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/FilterListFragment;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lcom/vk/stories/StoriesFilterListFragment;Lcom/vkontakte/android/UserProfile;)V
    .locals 0
    .param p0, "x0"    # Lcom/vk/stories/StoriesFilterListFragment;
    .param p1, "x1"    # Lcom/vkontakte/android/UserProfile;

    .prologue
    .line 20
    invoke-virtual {p0, p1}, Lcom/vk/stories/StoriesFilterListFragment;->onActionSuccess(Lcom/vkontakte/android/UserProfile;)V

    return-void
.end method


# virtual methods
.method protected getGroupActionSuccessText()I
    .locals 1

    .prologue
    .line 76
    const/4 v0, 0x0

    return v0
.end method

.method protected getUserActionSuccessText()I
    .locals 1

    .prologue
    .line 71
    const/4 v0, 0x0

    return v0
.end method

.method protected getUsersGroupRequest()Lcom/vkontakte/android/api/common/GetUsersGroupRequest;
    .locals 1

    .prologue
    .line 52
    invoke-static {}, Lcom/vkontakte/android/api/common/GetUsersGroupRequest;->getStoriesBanned()Lcom/vkontakte/android/api/common/GetUsersGroupRequest;

    move-result-object v0

    return-object v0
.end method

.method protected onActionClick(Lcom/vkontakte/android/UserProfile;)V
    .locals 3
    .param p1, "userProfile"    # Lcom/vkontakte/android/UserProfile;

    .prologue
    .line 57
    iget v0, p1, Lcom/vkontakte/android/UserProfile;->uid:I

    invoke-virtual {p0}, Lcom/vk/stories/StoriesFilterListFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    new-instance v2, Lcom/vk/stories/StoriesFilterListFragment$2;

    invoke-direct {v2, p0, p1}, Lcom/vk/stories/StoriesFilterListFragment$2;-><init>(Lcom/vk/stories/StoriesFilterListFragment;Lcom/vkontakte/android/UserProfile;)V

    invoke-static {v0, v1, v2}, Lcom/vk/stories/StoriesController;->unbanUser(ILandroid/content/Context;Lcom/vkontakte/android/api/Callback;)V

    .line 67
    return-void
.end method

.method public onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .locals 5
    .param p1, "view"    # Landroid/view/View;
    .param p2, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 32
    invoke-super {p0, p1, p2}, Lcom/vkontakte/android/fragments/FilterListFragment;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    .line 34
    invoke-virtual {p0}, Lcom/vk/stories/StoriesFilterListFragment;->getToolbar()Landroid/support/v7/widget/Toolbar;

    move-result-object v0

    .line 35
    .local v0, "toolbar":Landroid/support/v7/widget/Toolbar;
    if-eqz v0, :cond_0

    .line 36
    new-instance v1, Landroid/graphics/drawable/BitmapDrawable;

    invoke-virtual {p0}, Lcom/vk/stories/StoriesFilterListFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {p0}, Lcom/vk/stories/StoriesFilterListFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v4, 0x7f02014f

    invoke-static {v3, v4}, Landroid/graphics/BitmapFactory;->decodeResource(Landroid/content/res/Resources;I)Landroid/graphics/Bitmap;

    move-result-object v3

    invoke-direct {v1, v2, v3}, Landroid/graphics/drawable/BitmapDrawable;-><init>(Landroid/content/res/Resources;Landroid/graphics/Bitmap;)V

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/Toolbar;->setNavigationIcon(Landroid/graphics/drawable/Drawable;)V

    .line 37
    invoke-virtual {v0}, Landroid/support/v7/widget/Toolbar;->getNavigationIcon()Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-virtual {v0}, Landroid/support/v7/widget/Toolbar;->getContext()Landroid/content/Context;

    move-result-object v2

    const v3, 0x7f0f00ba

    invoke-static {v2, v3}, Landroid/support/v4/content/ContextCompat;->getColor(Landroid/content/Context;I)I

    move-result v2

    sget-object v3, Landroid/graphics/PorterDuff$Mode;->MULTIPLY:Landroid/graphics/PorterDuff$Mode;

    invoke-virtual {v1, v2, v3}, Landroid/graphics/drawable/Drawable;->setColorFilter(ILandroid/graphics/PorterDuff$Mode;)V

    .line 38
    const v1, 0x7f080304

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/Toolbar;->setTitle(I)V

    .line 39
    new-instance v1, Lcom/vk/stories/StoriesFilterListFragment$1;

    invoke-direct {v1, p0}, Lcom/vk/stories/StoriesFilterListFragment$1;-><init>(Lcom/vk/stories/StoriesFilterListFragment;)V

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/Toolbar;->setNavigationOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 48
    :cond_0
    return-void
.end method

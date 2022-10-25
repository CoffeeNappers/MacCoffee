.class public Lcom/vkontakte/android/fragments/NewsfeedFilterListFragment;
.super Lcom/vkontakte/android/fragments/FilterListFragment;
.source "NewsfeedFilterListFragment.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 9
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/FilterListFragment;-><init>()V

    return-void
.end method


# virtual methods
.method protected getGroupActionSuccessText()I
    .locals 1

    .prologue
    .line 33
    const v0, 0x7f08042f

    return v0
.end method

.method protected getUserActionSuccessText()I
    .locals 1

    .prologue
    .line 28
    const v0, 0x7f080430

    return v0
.end method

.method protected getUsersGroupRequest()Lcom/vkontakte/android/api/common/GetUsersGroupRequest;
    .locals 1

    .prologue
    .line 12
    invoke-static {}, Lcom/vkontakte/android/api/common/GetUsersGroupRequest;->getNewsfeedBanned()Lcom/vkontakte/android/api/common/GetUsersGroupRequest;

    move-result-object v0

    return-object v0
.end method

.method protected onActionClick(Lcom/vkontakte/android/UserProfile;)V
    .locals 2
    .param p1, "userProfile"    # Lcom/vkontakte/android/UserProfile;

    .prologue
    .line 17
    new-instance v0, Lcom/vkontakte/android/api/newsfeed/NewsfeedDeleteBan;

    iget v1, p1, Lcom/vkontakte/android/UserProfile;->uid:I

    invoke-direct {v0, v1}, Lcom/vkontakte/android/api/newsfeed/NewsfeedDeleteBan;-><init>(I)V

    new-instance v1, Lcom/vkontakte/android/fragments/NewsfeedFilterListFragment$1;

    invoke-direct {v1, p0, p0, p1}, Lcom/vkontakte/android/fragments/NewsfeedFilterListFragment$1;-><init>(Lcom/vkontakte/android/fragments/NewsfeedFilterListFragment;Landroid/app/Fragment;Lcom/vkontakte/android/UserProfile;)V

    .line 18
    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/newsfeed/NewsfeedDeleteBan;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    .line 23
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/NewsfeedFilterListFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/VKAPIRequest;->wrapProgress(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/NewsfeedFilterListFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/VKAPIRequest;->exec(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 24
    return-void
.end method

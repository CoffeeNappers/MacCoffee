.class public Lcom/vkontakte/android/fragments/gifts/GiftSendFragment$PickerFragment;
.super Lcom/vkontakte/android/fragments/friends/FriendsFragment;
.source "GiftSendFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/fragments/gifts/GiftSendFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "PickerFragment"
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 429
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/friends/FriendsFragment;-><init>()V

    return-void
.end method


# virtual methods
.method protected doLoadData()V
    .locals 3

    .prologue
    .line 433
    new-instance v0, Lcom/vkontakte/android/api/store/StoreGetFriendsList;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment$PickerFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v1

    const-string/jumbo v2, "product_id"

    invoke-virtual {v1, v2}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v1

    invoke-direct {v0, v1}, Lcom/vkontakte/android/api/store/StoreGetFriendsList;-><init>(I)V

    new-instance v1, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment$PickerFragment$1;

    invoke-direct {v1, p0, p0}, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment$PickerFragment$1;-><init>(Lcom/vkontakte/android/fragments/gifts/GiftSendFragment$PickerFragment;Landroid/app/Fragment;)V

    .line 434
    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/store/StoreGetFriendsList;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    .line 440
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment$PickerFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/VKAPIRequest;->exec(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment$PickerFragment;->currentRequest:Lme/grishka/appkit/api/APIRequest;

    .line 441
    return-void
.end method

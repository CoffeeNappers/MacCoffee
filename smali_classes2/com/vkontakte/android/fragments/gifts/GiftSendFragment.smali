.class public Lcom/vkontakte/android/fragments/gifts/GiftSendFragment;
.super Lcom/vkontakte/android/fragments/base/GridFragment;
.source "GiftSendFragment.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vkontakte/android/fragments/gifts/GiftSendFragment$SendHolder;,
        Lcom/vkontakte/android/fragments/gifts/GiftSendFragment$PrivacyHolder;,
        Lcom/vkontakte/android/fragments/gifts/GiftSendFragment$MessageHolder;,
        Lcom/vkontakte/android/fragments/gifts/GiftSendFragment$AddHolder;,
        Lcom/vkontakte/android/fragments/gifts/GiftSendFragment$UserHolder;,
        Lcom/vkontakte/android/fragments/gifts/GiftSendFragment$HeaderHolder;,
        Lcom/vkontakte/android/fragments/gifts/GiftSendFragment$GiftHolder;,
        Lcom/vkontakte/android/fragments/gifts/GiftSendFragment$Adapter;,
        Lcom/vkontakte/android/fragments/gifts/GiftSendFragment$PickerFragment;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/fragments/base/GridFragment",
        "<",
        "Ljava/lang/Object;",
        ">;"
    }
.end annotation


# static fields
.field public static final ACTION_GIFT_SENT:Ljava/lang/String; = "com.vkontakte.android.ACTION_GIFT_SENT"

.field private static final ExtraBalance:Ljava/lang/String; = "balance"

.field private static final ExtraGift:Ljava/lang/String; = "gift"

.field private static final ExtraUsers:Ljava/lang/String; = "toUsers"

.field private static final REQUEST_ADD_RECIPIENT:I = 0x2a


# instance fields
.field mActive:Z

.field mAddVisibility:Z

.field mBalance:I

.field mCanSend:Z

.field final mDecoration:Lcom/vkontakte/android/ui/recyclerview/BottomDividerDecoration;

.field mGift:Lcom/vkontakte/android/api/models/CatalogedGift;

.field mMessage:Ljava/lang/CharSequence;

.field mPaymentRequired:Z

.field mPrivacyEnabled:Z

.field final mReceiver:Landroid/content/BroadcastReceiver;

.field final mRecipients:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/vkontakte/android/UserProfile;",
            ">;"
        }
    .end annotation
.end field

.field mSendEnabled:Z

.field mSendText:Ljava/lang/CharSequence;

.field mSubTitleVisible:Z

.field mSubtitleText:Ljava/lang/CharSequence;

.field mTitleText:Ljava/lang/CharSequence;

.field mTotalPrice:I


# direct methods
.method public constructor <init>()V
    .locals 6

    .prologue
    const/4 v5, 0x1

    .line 132
    const v0, 0x7fffffff

    invoke-direct {p0, v0}, Lcom/vkontakte/android/fragments/base/GridFragment;-><init>(I)V

    .line 95
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0, v5}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v0, p0, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment;->mRecipients:Ljava/util/List;

    .line 96
    new-instance v1, Lcom/vkontakte/android/ui/recyclerview/BottomDividerDecoration;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment;->getAdapter()Lcom/vkontakte/android/fragments/base/GridFragment$GridAdapter;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/ui/recyclerview/BottomDividerDecoration$Provider;

    const/high16 v2, 0x3f000000    # 0.5f

    invoke-static {v2}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v2

    invoke-static {v5, v2}, Ljava/lang/Math;->max(II)I

    move-result v2

    const/high16 v3, 0x26000000

    const/4 v4, 0x0

    invoke-direct {v1, v0, v2, v3, v4}, Lcom/vkontakte/android/ui/recyclerview/BottomDividerDecoration;-><init>(Lcom/vkontakte/android/ui/recyclerview/BottomDividerDecoration$Provider;III)V

    iput-object v1, p0, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment;->mDecoration:Lcom/vkontakte/android/ui/recyclerview/BottomDividerDecoration;

    .line 102
    iput-boolean v5, p0, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment;->mSubTitleVisible:Z

    .line 107
    const-string/jumbo v0, ""

    iput-object v0, p0, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment;->mMessage:Ljava/lang/CharSequence;

    .line 115
    new-instance v0, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment$1;

    invoke-direct {v0, p0}, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment$1;-><init>(Lcom/vkontakte/android/fragments/gifts/GiftSendFragment;)V

    iput-object v0, p0, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment;->mReceiver:Landroid/content/BroadcastReceiver;

    .line 133
    const v0, 0x7f03023c

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment;->setLayout(I)V

    .line 134
    return-void
.end method

.method static synthetic access$000(Lcom/vkontakte/android/fragments/gifts/GiftSendFragment;)Lcom/vkontakte/android/fragments/base/GridFragment$GridAdapter;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/gifts/GiftSendFragment;

    .prologue
    .line 63
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment;->getAdapter()Lcom/vkontakte/android/fragments/base/GridFragment$GridAdapter;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$100(Lcom/vkontakte/android/fragments/gifts/GiftSendFragment;)Lcom/vkontakte/android/fragments/base/GridFragment$GridAdapter;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/gifts/GiftSendFragment;

    .prologue
    .line 63
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment;->getAdapter()Lcom/vkontakte/android/fragments/base/GridFragment$GridAdapter;

    move-result-object v0

    return-object v0
.end method

.method public static start(Landroid/app/Activity;Lcom/vkontakte/android/UserProfile;Lcom/vkontakte/android/api/models/CatalogedGift;I)V
    .locals 1
    .param p0, "activity"    # Landroid/app/Activity;
    .param p1, "to"    # Lcom/vkontakte/android/UserProfile;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p2, "gift"    # Lcom/vkontakte/android/api/models/CatalogedGift;
    .param p3, "balance"    # I

    .prologue
    .line 72
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 73
    .local v0, "toUsers":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/UserProfile;>;"
    if-eqz p1, :cond_0

    .line 74
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 76
    :cond_0
    invoke-static {p0, v0, p2, p3}, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment;->start(Landroid/app/Activity;Ljava/util/ArrayList;Lcom/vkontakte/android/api/models/CatalogedGift;I)V

    .line 77
    return-void
.end method

.method public static start(Landroid/app/Activity;Ljava/util/ArrayList;Lcom/vkontakte/android/api/models/CatalogedGift;I)V
    .locals 5
    .param p0, "activity"    # Landroid/app/Activity;
    .param p1    # Ljava/util/ArrayList;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p2, "gift"    # Lcom/vkontakte/android/api/models/CatalogedGift;
    .param p3, "balance"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/app/Activity;",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vkontakte/android/UserProfile;",
            ">;",
            "Lcom/vkontakte/android/api/models/CatalogedGift;",
            "I)V"
        }
    .end annotation

    .prologue
    .line 80
    .local p1, "toUsers":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/UserProfile;>;"
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 81
    .local v0, "args":Landroid/os/Bundle;
    const-string/jumbo v1, "toUsers"

    invoke-virtual {v0, v1, p1}, Landroid/os/Bundle;->putParcelableArrayList(Ljava/lang/String;Ljava/util/ArrayList;)V

    .line 82
    const-string/jumbo v1, "gift"

    invoke-virtual {v0, v1, p2}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 83
    const-string/jumbo v1, "balance"

    invoke-virtual {v0, v1, p3}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 84
    instance-of v1, p0, Lcom/vkontakte/android/TabletDialogActivity;

    if-eqz v1, :cond_0

    .line 85
    check-cast p0, Lcom/vkontakte/android/TabletDialogActivity;

    .end local p0    # "activity":Landroid/app/Activity;
    const-class v1, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment;

    invoke-virtual {p0, v1, v0}, Lcom/vkontakte/android/TabletDialogActivity;->start(Ljava/lang/Class;Landroid/os/Bundle;)V

    .line 93
    :goto_0
    return-void

    .line 88
    .restart local p0    # "activity":Landroid/app/Activity;
    :cond_0
    new-instance v1, Lcom/vkontakte/android/navigation/Navigator;

    const-class v2, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment;

    new-instance v3, Lcom/vkontakte/android/TabletDialogActivity$Builder;

    invoke-direct {v3}, Lcom/vkontakte/android/TabletDialogActivity$Builder;-><init>()V

    const v4, 0x7f0f005e

    .line 89
    invoke-virtual {v3, v4}, Lcom/vkontakte/android/TabletDialogActivity$Builder;->windowBackgroundResource(I)Lcom/vkontakte/android/TabletDialogActivity$Builder;

    move-result-object v3

    invoke-direct {v1, v2, v3, v0}, Lcom/vkontakte/android/navigation/Navigator;-><init>(Ljava/lang/Class;Lcom/vkontakte/android/navigation/Navigator$ActivityNavigator;Landroid/os/Bundle;)V

    .line 91
    invoke-virtual {v1, p0}, Lcom/vkontakte/android/navigation/Navigator;->go(Landroid/content/Context;)Z

    goto :goto_0
.end method


# virtual methods
.method addRecipient()V
    .locals 4

    .prologue
    const/4 v3, 0x1

    .line 341
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 342
    .local v0, "args":Landroid/os/Bundle;
    const-string/jumbo v1, "select"

    invoke-virtual {v0, v1, v3}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 343
    const-string/jumbo v1, "title"

    const v2, 0x7f08028d

    invoke-virtual {p0, v2}, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 344
    const-string/jumbo v1, "global_search"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 345
    const-string/jumbo v1, "uid"

    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v2

    invoke-virtual {v2}, Lcom/vkontakte/android/auth/VKAccount;->getUid()I

    move-result v2

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 346
    const-string/jumbo v1, "disable_spinner"

    invoke-virtual {v0, v1, v3}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 347
    iget-object v1, p0, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment;->mGift:Lcom/vkontakte/android/api/models/CatalogedGift;

    iget-object v1, v1, Lcom/vkontakte/android/api/models/CatalogedGift;->gift:Lcom/vkontakte/android/api/models/Gift;

    iget-object v1, v1, Lcom/vkontakte/android/api/models/Gift;->stickers_product_id:Ljava/lang/Integer;

    if-eqz v1, :cond_0

    .line 348
    const-string/jumbo v1, "product_id"

    iget-object v2, p0, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment;->mGift:Lcom/vkontakte/android/api/models/CatalogedGift;

    iget-object v2, v2, Lcom/vkontakte/android/api/models/CatalogedGift;->gift:Lcom/vkontakte/android/api/models/Gift;

    iget-object v2, v2, Lcom/vkontakte/android/api/models/Gift;->stickers_product_id:Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 351
    :cond_0
    new-instance v2, Lcom/vkontakte/android/navigation/Navigator;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment;->mGift:Lcom/vkontakte/android/api/models/CatalogedGift;

    iget-object v1, v1, Lcom/vkontakte/android/api/models/CatalogedGift;->gift:Lcom/vkontakte/android/api/models/Gift;

    iget-object v1, v1, Lcom/vkontakte/android/api/models/Gift;->stickers_product_id:Ljava/lang/Integer;

    if-eqz v1, :cond_1

    const-class v1, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment$PickerFragment;

    :goto_0
    invoke-direct {v2, v1, v0}, Lcom/vkontakte/android/navigation/Navigator;-><init>(Ljava/lang/Class;Landroid/os/Bundle;)V

    const/16 v1, 0x2a

    invoke-virtual {v2, p0, v1}, Lcom/vkontakte/android/navigation/Navigator;->forResult(Landroid/app/Fragment;I)Z

    .line 352
    return-void

    .line 351
    :cond_1
    const-class v1, Lcom/vkontakte/android/fragments/friends/FriendsFragment;

    goto :goto_0
.end method

.method addRecipient(Lcom/vkontakte/android/UserProfile;)V
    .locals 1
    .param p1, "profile"    # Lcom/vkontakte/android/UserProfile;

    .prologue
    .line 355
    iget-object v0, p0, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment;->mRecipients:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 356
    iget-object v0, p0, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment;->mRecipients:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 357
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment;->invalidatePrice()V

    .line 358
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment;->getAdapter()Lcom/vkontakte/android/fragments/base/GridFragment$GridAdapter;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vkontakte/android/fragments/base/GridFragment$GridAdapter;->notifyDataSetChanged()V

    .line 359
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment;->updateFinishOnTouchOutside()V

    .line 361
    :cond_0
    return-void
.end method

.method protected createAdapter()Lcom/vkontakte/android/fragments/base/GridFragment$GridAdapter;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/vkontakte/android/fragments/base/GridFragment",
            "<",
            "Ljava/lang/Object;",
            ">.GridAdapter<*>;"
        }
    .end annotation

    .prologue
    .line 225
    new-instance v0, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment$Adapter;

    invoke-direct {v0, p0}, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment$Adapter;-><init>(Lcom/vkontakte/android/fragments/gifts/GiftSendFragment;)V

    return-object v0
.end method

.method deleteRecipient(Lcom/vkontakte/android/UserProfile;)V
    .locals 1
    .param p1, "profile"    # Lcom/vkontakte/android/UserProfile;

    .prologue
    .line 364
    iget-object v0, p0, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment;->mRecipients:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 365
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment;->invalidatePrice()V

    .line 366
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment;->getAdapter()Lcom/vkontakte/android/fragments/base/GridFragment$GridAdapter;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vkontakte/android/fragments/base/GridFragment$GridAdapter;->notifyDataSetChanged()V

    .line 367
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment;->updateFinishOnTouchOutside()V

    .line 368
    return-void
.end method

.method protected doLoadData(II)V
    .locals 0
    .param p1, "offset"    # I
    .param p2, "count"    # I

    .prologue
    .line 216
    return-void
.end method

.method protected getColumnsCount()I
    .locals 1

    .prologue
    .line 230
    const/4 v0, 0x1

    return v0
.end method

.method invalidate()V
    .locals 1

    .prologue
    .line 260
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment;->invalidatePrice()V

    .line 261
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment;->invalidateBalance()V

    .line 263
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment;->getAdapter()Lcom/vkontakte/android/fragments/base/GridFragment$GridAdapter;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vkontakte/android/fragments/base/GridFragment$GridAdapter;->notifyDataSetChanged()V

    .line 264
    return-void
.end method

.method invalidateBalance()V
    .locals 8

    .prologue
    const/4 v7, 0x0

    const/4 v5, 0x1

    .line 329
    iget-object v0, p0, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment;->mGift:Lcom/vkontakte/android/api/models/CatalogedGift;

    iget-object v0, v0, Lcom/vkontakte/android/api/models/CatalogedGift;->gifts_left:Ljava/lang/Integer;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment;->mGift:Lcom/vkontakte/android/api/models/CatalogedGift;

    iget-object v0, v0, Lcom/vkontakte/android/api/models/CatalogedGift;->gifts_left:Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    if-lez v0, :cond_0

    .line 330
    iput-boolean v5, p0, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment;->mSubTitleVisible:Z

    .line 331
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f0d001b

    iget-object v2, p0, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment;->mGift:Lcom/vkontakte/android/api/models/CatalogedGift;

    iget-object v2, v2, Lcom/vkontakte/android/api/models/CatalogedGift;->gifts_left:Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    new-array v3, v5, [Ljava/lang/Object;

    iget-object v4, p0, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment;->mGift:Lcom/vkontakte/android/api/models/CatalogedGift;

    iget-object v4, v4, Lcom/vkontakte/android/api/models/CatalogedGift;->gifts_left:Ljava/lang/Integer;

    aput-object v4, v3, v7

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/res/Resources;->getQuantityString(II[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment;->mSubtitleText:Ljava/lang/CharSequence;

    .line 338
    :goto_0
    return-void

    .line 332
    :cond_0
    iget v0, p0, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment;->mBalance:I

    if-lez v0, :cond_1

    .line 333
    iput-boolean v5, p0, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment;->mSubTitleVisible:Z

    .line 334
    const v0, 0x7f0800a0

    new-array v1, v5, [Ljava/lang/Object;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f0d0003

    iget v4, p0, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment;->mBalance:I

    new-array v5, v5, [Ljava/lang/Object;

    iget v6, p0, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment;->mBalance:I

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v5, v7

    invoke-virtual {v2, v3, v4, v5}, Landroid/content/res/Resources;->getQuantityString(II[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    aput-object v2, v1, v7

    invoke-virtual {p0, v0, v1}, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment;->mSubtitleText:Ljava/lang/CharSequence;

    goto :goto_0

    .line 336
    :cond_1
    iput-boolean v7, p0, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment;->mSubTitleVisible:Z

    goto :goto_0
.end method

.method invalidatePrice()V
    .locals 12

    .prologue
    const v9, 0x7f0805f7

    const v8, 0x7f080529

    const/4 v7, 0x0

    const/4 v6, 0x1

    .line 271
    iget-object v5, p0, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment;->mGift:Lcom/vkontakte/android/api/models/CatalogedGift;

    iget-object v5, v5, Lcom/vkontakte/android/api/models/CatalogedGift;->gifts_left:Ljava/lang/Integer;

    if-nez v5, :cond_1

    .line 273
    iget-object v5, p0, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment;->mGift:Lcom/vkontakte/android/api/models/CatalogedGift;

    iget v3, v5, Lcom/vkontakte/android/api/models/CatalogedGift;->price:I

    .line 274
    .local v3, "price":I
    iget-object v5, p0, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment;->mGift:Lcom/vkontakte/android/api/models/CatalogedGift;

    iget-object v2, v5, Lcom/vkontakte/android/api/models/CatalogedGift;->price_str:Ljava/lang/String;

    .line 275
    .local v2, "cost":Ljava/lang/String;
    const/4 v1, 0x1

    .line 276
    .local v1, "canAddMore":Z
    iput-boolean v6, p0, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment;->mCanSend:Z

    .line 304
    :goto_0
    iget-object v5, p0, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment;->mRecipients:Ljava/util/List;

    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v5

    invoke-static {v5, v6}, Ljava/lang/Math;->max(II)I

    move-result v5

    mul-int/2addr v5, v3

    iput v5, p0, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment;->mTotalPrice:I

    .line 306
    iput-object v2, p0, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment;->mTitleText:Ljava/lang/CharSequence;

    .line 308
    if-nez v1, :cond_0

    iget-object v5, p0, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment;->mRecipients:Ljava/util/List;

    invoke-interface {v5}, Ljava/util/List;->isEmpty()Z

    move-result v5

    if-eqz v5, :cond_b

    :cond_0
    move v5, v6

    :goto_1
    iput-boolean v5, p0, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment;->mAddVisibility:Z

    .line 310
    iget-object v5, p0, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment;->mRecipients:Ljava/util/List;

    invoke-interface {v5}, Ljava/util/List;->isEmpty()Z

    move-result v5

    if-eqz v5, :cond_c

    .line 311
    invoke-virtual {p0, v9}, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment;->getString(I)Ljava/lang/String;

    move-result-object v5

    iput-object v5, p0, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment;->mSendText:Ljava/lang/CharSequence;

    .line 312
    iput-boolean v7, p0, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment;->mSendEnabled:Z

    .line 326
    :goto_2
    return-void

    .line 277
    .end local v1    # "canAddMore":Z
    .end local v2    # "cost":Ljava/lang/String;
    .end local v3    # "price":I
    :cond_1
    iget-object v5, p0, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment;->mGift:Lcom/vkontakte/android/api/models/CatalogedGift;

    iget v5, v5, Lcom/vkontakte/android/api/models/CatalogedGift;->price:I

    if-lez v5, :cond_4

    .line 279
    iget-object v5, p0, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment;->mGift:Lcom/vkontakte/android/api/models/CatalogedGift;

    iget v3, v5, Lcom/vkontakte/android/api/models/CatalogedGift;->price:I

    .line 280
    .restart local v3    # "price":I
    iget-object v5, p0, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment;->mGift:Lcom/vkontakte/android/api/models/CatalogedGift;

    iget-object v2, v5, Lcom/vkontakte/android/api/models/CatalogedGift;->price_str:Ljava/lang/String;

    .line 281
    .restart local v2    # "cost":Ljava/lang/String;
    iget-object v5, p0, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment;->mGift:Lcom/vkontakte/android/api/models/CatalogedGift;

    iget-object v5, v5, Lcom/vkontakte/android/api/models/CatalogedGift;->gifts_left:Ljava/lang/Integer;

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5

    iget-object v8, p0, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment;->mRecipients:Ljava/util/List;

    invoke-interface {v8}, Ljava/util/List;->size()I

    move-result v8

    sub-int/2addr v5, v8

    if-ltz v5, :cond_2

    move v5, v6

    :goto_3
    iput-boolean v5, p0, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment;->mCanSend:Z

    .line 282
    iget-object v5, p0, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment;->mGift:Lcom/vkontakte/android/api/models/CatalogedGift;

    iget-object v5, v5, Lcom/vkontakte/android/api/models/CatalogedGift;->gifts_left:Ljava/lang/Integer;

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5

    iget-object v8, p0, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment;->mRecipients:Ljava/util/List;

    invoke-interface {v8}, Ljava/util/List;->size()I

    move-result v8

    sub-int/2addr v5, v8

    invoke-static {v5, v7}, Ljava/lang/Math;->max(II)I

    move-result v5

    if-lez v5, :cond_3

    move v1, v6

    .restart local v1    # "canAddMore":Z
    :goto_4
    goto :goto_0

    .end local v1    # "canAddMore":Z
    :cond_2
    move v5, v7

    .line 281
    goto :goto_3

    :cond_3
    move v1, v7

    .line 282
    goto :goto_4

    .line 283
    .end local v2    # "cost":Ljava/lang/String;
    .end local v3    # "price":I
    :cond_4
    iget-object v5, p0, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment;->mGift:Lcom/vkontakte/android/api/models/CatalogedGift;

    iget v5, v5, Lcom/vkontakte/android/api/models/CatalogedGift;->real_price:I

    if-gtz v5, :cond_7

    .line 285
    const/4 v3, 0x0

    .line 286
    .restart local v3    # "price":I
    invoke-virtual {p0, v8}, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment;->getString(I)Ljava/lang/String;

    move-result-object v2

    .line 287
    .restart local v2    # "cost":Ljava/lang/String;
    iget-object v5, p0, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment;->mGift:Lcom/vkontakte/android/api/models/CatalogedGift;

    iget-object v5, v5, Lcom/vkontakte/android/api/models/CatalogedGift;->gifts_left:Ljava/lang/Integer;

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5

    iget-object v8, p0, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment;->mRecipients:Ljava/util/List;

    invoke-interface {v8}, Ljava/util/List;->size()I

    move-result v8

    sub-int/2addr v5, v8

    if-ltz v5, :cond_5

    move v5, v6

    :goto_5
    iput-boolean v5, p0, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment;->mCanSend:Z

    .line 288
    iget-object v5, p0, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment;->mGift:Lcom/vkontakte/android/api/models/CatalogedGift;

    iget-object v5, v5, Lcom/vkontakte/android/api/models/CatalogedGift;->gifts_left:Ljava/lang/Integer;

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5

    iget-object v8, p0, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment;->mRecipients:Ljava/util/List;

    invoke-interface {v8}, Ljava/util/List;->size()I

    move-result v8

    sub-int/2addr v5, v8

    invoke-static {v5, v7}, Ljava/lang/Math;->max(II)I

    move-result v5

    if-lez v5, :cond_6

    move v1, v6

    .restart local v1    # "canAddMore":Z
    :goto_6
    goto/16 :goto_0

    .end local v1    # "canAddMore":Z
    :cond_5
    move v5, v7

    .line 287
    goto :goto_5

    :cond_6
    move v1, v7

    .line 288
    goto :goto_6

    .line 291
    .end local v2    # "cost":Ljava/lang/String;
    .end local v3    # "price":I
    :cond_7
    iget-object v5, p0, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment;->mGift:Lcom/vkontakte/android/api/models/CatalogedGift;

    iget-object v5, v5, Lcom/vkontakte/android/api/models/CatalogedGift;->gifts_left:Ljava/lang/Integer;

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5

    if-gtz v5, :cond_8

    .line 292
    iget-object v5, p0, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment;->mGift:Lcom/vkontakte/android/api/models/CatalogedGift;

    iget v3, v5, Lcom/vkontakte/android/api/models/CatalogedGift;->real_price:I

    .line 293
    .restart local v3    # "price":I
    iget-object v5, p0, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment;->mGift:Lcom/vkontakte/android/api/models/CatalogedGift;

    iget-object v2, v5, Lcom/vkontakte/android/api/models/CatalogedGift;->real_price_str:Ljava/lang/String;

    .line 294
    .restart local v2    # "cost":Ljava/lang/String;
    const/4 v1, 0x1

    .line 295
    .restart local v1    # "canAddMore":Z
    iput-boolean v6, p0, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment;->mCanSend:Z

    goto/16 :goto_0

    .line 297
    .end local v1    # "canAddMore":Z
    .end local v2    # "cost":Ljava/lang/String;
    .end local v3    # "price":I
    :cond_8
    const/4 v3, 0x0

    .line 298
    .restart local v3    # "price":I
    invoke-virtual {p0, v8}, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment;->getString(I)Ljava/lang/String;

    move-result-object v2

    .line 299
    .restart local v2    # "cost":Ljava/lang/String;
    iget-object v5, p0, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment;->mGift:Lcom/vkontakte/android/api/models/CatalogedGift;

    iget-object v5, v5, Lcom/vkontakte/android/api/models/CatalogedGift;->gifts_left:Ljava/lang/Integer;

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5

    iget-object v8, p0, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment;->mRecipients:Ljava/util/List;

    invoke-interface {v8}, Ljava/util/List;->size()I

    move-result v8

    sub-int/2addr v5, v8

    invoke-static {v5, v7}, Ljava/lang/Math;->max(II)I

    move-result v5

    if-lez v5, :cond_9

    move v1, v6

    .line 300
    .restart local v1    # "canAddMore":Z
    :goto_7
    iget-object v5, p0, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment;->mGift:Lcom/vkontakte/android/api/models/CatalogedGift;

    iget-object v5, v5, Lcom/vkontakte/android/api/models/CatalogedGift;->gifts_left:Ljava/lang/Integer;

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5

    iget-object v8, p0, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment;->mRecipients:Ljava/util/List;

    invoke-interface {v8}, Ljava/util/List;->size()I

    move-result v8

    sub-int/2addr v5, v8

    if-ltz v5, :cond_a

    move v5, v6

    :goto_8
    iput-boolean v5, p0, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment;->mCanSend:Z

    goto/16 :goto_0

    .end local v1    # "canAddMore":Z
    :cond_9
    move v1, v7

    .line 299
    goto :goto_7

    .restart local v1    # "canAddMore":Z
    :cond_a
    move v5, v7

    .line 300
    goto :goto_8

    :cond_b
    move v5, v7

    .line 308
    goto/16 :goto_1

    .line 313
    :cond_c
    iget-object v5, p0, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment;->mRecipients:Ljava/util/List;

    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v5

    if-ne v5, v6, :cond_d

    .line 314
    const v5, 0x7f0805f9

    invoke-virtual {p0, v5}, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment;->getString(I)Ljava/lang/String;

    move-result-object v5

    iput-object v5, p0, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment;->mSendText:Ljava/lang/CharSequence;

    .line 315
    iput-boolean v6, p0, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment;->mSendEnabled:Z

    goto/16 :goto_2

    .line 317
    :cond_d
    new-instance v4, Landroid/text/SpannableStringBuilder;

    invoke-direct {v4}, Landroid/text/SpannableStringBuilder;-><init>()V

    .line 318
    .local v4, "sb":Landroid/text/SpannableStringBuilder;
    invoke-virtual {p0, v9}, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 319
    const/16 v5, 0x20

    invoke-virtual {v4, v5}, Landroid/text/SpannableStringBuilder;->append(C)Landroid/text/SpannableStringBuilder;

    .line 320
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    const v8, 0x7f0d001a

    iget-object v9, p0, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment;->mRecipients:Ljava/util/List;

    invoke-interface {v9}, Ljava/util/List;->size()I

    move-result v9

    new-array v10, v6, [Ljava/lang/Object;

    iget-object v11, p0, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment;->mRecipients:Ljava/util/List;

    invoke-interface {v11}, Ljava/util/List;->size()I

    move-result v11

    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    aput-object v11, v10, v7

    invoke-virtual {v5, v8, v9, v10}, Landroid/content/res/Resources;->getQuantityString(II[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 321
    .local v0, "bold":Ljava/lang/String;
    invoke-virtual {v4, v0}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 322
    new-instance v5, Landroid/text/style/StyleSpan;

    invoke-direct {v5, v6}, Landroid/text/style/StyleSpan;-><init>(I)V

    invoke-virtual {v4}, Landroid/text/SpannableStringBuilder;->length()I

    move-result v8

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v9

    sub-int/2addr v8, v9

    invoke-virtual {v4}, Landroid/text/SpannableStringBuilder;->length()I

    move-result v9

    invoke-virtual {v4, v5, v8, v9, v7}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 323
    iput-object v4, p0, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment;->mSendText:Ljava/lang/CharSequence;

    .line 324
    iput-boolean v6, p0, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment;->mSendEnabled:Z

    goto/16 :goto_2
.end method

.method notifyBalanceHasChanged(I)V
    .locals 2
    .param p1, "newBalance"    # I

    .prologue
    .line 413
    new-instance v0, Landroid/content/Intent;

    const-string/jumbo v1, "com.vkontakte.android.actions.BALANCE_CHANGED"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 414
    .local v0, "intent":Landroid/content/Intent;
    const-string/jumbo v1, "balance"

    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 415
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/app/Activity;->sendBroadcast(Landroid/content/Intent;)V

    .line 416
    return-void
.end method

.method notifyGiftHasSent(Lcom/vkontakte/android/api/models/CatalogedGift;[I)V
    .locals 3
    .param p1, "gift"    # Lcom/vkontakte/android/api/models/CatalogedGift;
    .param p2, "user_ids"    # [I

    .prologue
    .line 423
    new-instance v0, Landroid/content/Intent;

    const-string/jumbo v1, "com.vkontakte.android.ACTION_GIFT_SENT"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 424
    .local v0, "intent":Landroid/content/Intent;
    const-string/jumbo v1, "gift"

    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 425
    const-string/jumbo v1, "user_ids"

    invoke-virtual {v0, v1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;[I)Landroid/content/Intent;

    .line 426
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    const-string/jumbo v2, "com.vkontakte.android.permission.ACCESS_DATA"

    invoke-virtual {v1, v0, v2}, Landroid/app/Activity;->sendBroadcast(Landroid/content/Intent;Ljava/lang/String;)V

    .line 427
    return-void
.end method

.method public onActivityCreated(Landroid/os/Bundle;)V
    .locals 1
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 169
    invoke-super {p0, p1}, Lcom/vkontakte/android/fragments/base/GridFragment;->onActivityCreated(Landroid/os/Bundle;)V

    .line 170
    iget-object v0, p0, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    invoke-virtual {v0}, Lme/grishka/appkit/views/UsableRecyclerView;->getAdapter()Lme/grishka/appkit/views/UsableRecyclerView$Adapter;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 171
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment;->invalidate()V

    .line 173
    :cond_0
    return-void
.end method

.method public onActivityResult(IILandroid/content/Intent;)V
    .locals 1
    .param p1, "requestCode"    # I
    .param p2, "resultCode"    # I
    .param p3, "data"    # Landroid/content/Intent;

    .prologue
    .line 253
    invoke-super {p0, p1, p2, p3}, Lcom/vkontakte/android/fragments/base/GridFragment;->onActivityResult(IILandroid/content/Intent;)V

    .line 254
    const/16 v0, 0x2a

    if-ne p1, v0, :cond_0

    const/4 v0, -0x1

    if-ne p2, v0, :cond_0

    if-eqz p3, :cond_0

    .line 255
    const-string/jumbo v0, "user"

    invoke-virtual {p3, v0}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/UserProfile;

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment;->addRecipient(Lcom/vkontakte/android/UserProfile;)V

    .line 257
    :cond_0
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 7
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 138
    invoke-super {p0, p1}, Lcom/vkontakte/android/fragments/base/GridFragment;->onCreate(Landroid/os/Bundle;)V

    .line 139
    const/4 v2, 0x0

    invoke-virtual {p0, v2}, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment;->setRefreshEnabled(Z)V

    .line 140
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v2

    const-string/jumbo v3, "gift"

    invoke-virtual {v2, v3}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v2

    check-cast v2, Lcom/vkontakte/android/api/models/CatalogedGift;

    iput-object v2, p0, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment;->mGift:Lcom/vkontakte/android/api/models/CatalogedGift;

    .line 141
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v2

    const-string/jumbo v3, "balance"

    invoke-virtual {v2, v3}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v2

    iput v2, p0, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment;->mBalance:I

    .line 144
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v2

    const-string/jumbo v3, "toUsers"

    invoke-virtual {v2, v3}, Landroid/os/Bundle;->getParcelableArrayList(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v0

    .line 146
    .local v0, "toUsers":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/UserProfile;>;"
    if-eqz v0, :cond_1

    .line 147
    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_0
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vkontakte/android/UserProfile;

    .line 148
    .local v1, "user":Lcom/vkontakte/android/UserProfile;
    iget v3, v1, Lcom/vkontakte/android/UserProfile;->uid:I

    invoke-static {v3}, Lcom/vkontakte/android/auth/VKAccountManager;->isCurrentUser(I)Z

    move-result v3

    if-nez v3, :cond_0

    .line 149
    iget-object v3, p0, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment;->mRecipients:Ljava/util/List;

    invoke-interface {v3, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 153
    .end local v1    # "user":Lcom/vkontakte/android/UserProfile;
    :cond_1
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment;->getActivity()Landroid/app/Activity;

    move-result-object v2

    iget-object v3, p0, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment;->mReceiver:Landroid/content/BroadcastReceiver;

    new-instance v4, Landroid/content/IntentFilter;

    const-string/jumbo v5, "com.vkontakte.android.actions.BALANCE_CHANGED"

    invoke-direct {v4, v5}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    const-string/jumbo v5, "com.vkontakte.android.permission.ACCESS_DATA"

    const/4 v6, 0x0

    invoke-virtual {v2, v3, v4, v5, v6}, Landroid/app/Activity;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;Ljava/lang/String;Landroid/os/Handler;)Landroid/content/Intent;

    .line 154
    return-void
.end method

.method protected onCreateCardDecorator()Lcom/vkontakte/android/ui/recyclerview/CardItemDecoration;
    .locals 10

    .prologue
    const/high16 v9, 0x41800000    # 16.0f

    const/high16 v8, 0x41000000    # 8.0f

    const/4 v5, 0x0

    .line 192
    new-instance v0, Lcom/vkontakte/android/ui/recyclerview/CardItemDecoration;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment;->getAdapter()Lcom/vkontakte/android/fragments/base/GridFragment$GridAdapter;

    move-result-object v6

    iget-boolean v4, p0, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment;->isTablet:Z

    if-nez v4, :cond_0

    const/4 v4, 0x1

    :goto_0
    invoke-direct {v0, v6, v4}, Lcom/vkontakte/android/ui/recyclerview/CardItemDecoration;-><init>(Lcom/vkontakte/android/ui/recyclerview/CardItemDecoration$Provider;Z)V

    .line 194
    .local v0, "decorator":Lcom/vkontakte/android/ui/recyclerview/CardItemDecoration;
    iget v4, p0, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment;->scrW:I

    const/16 v6, 0x258

    if-lt v4, v6, :cond_1

    .line 195
    invoke-static {v9}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v3

    .line 202
    .local v3, "padding":I
    :goto_1
    iget v4, p0, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment;->scrW:I

    const/16 v6, 0x39c

    if-lt v4, v6, :cond_3

    const/16 v4, 0x10

    iget v6, p0, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment;->scrW:I

    add-int/lit16 v6, v6, -0x348

    add-int/lit8 v6, v6, -0x54

    div-int/lit8 v6, v6, 0x2

    invoke-static {v4, v6}, Ljava/lang/Math;->min(II)I

    move-result v4

    int-to-float v4, v4

    invoke-static {v4}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v2

    .line 203
    .local v2, "margin":I
    :goto_2
    iget-object v4, p0, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    add-int v6, v2, v3

    add-int v7, v2, v3

    invoke-virtual {v4, v6, v5, v7, v5}, Lme/grishka/appkit/views/UsableRecyclerView;->setPadding(IIII)V

    .line 204
    invoke-static {v8}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v4

    invoke-static {v8}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v6

    invoke-virtual {v0, v3, v4, v3, v6}, Lcom/vkontakte/android/ui/recyclerview/CardItemDecoration;->setPadding(IIII)Lcom/vkontakte/android/ui/recyclerview/CardItemDecoration;

    .line 206
    add-int v4, v2, v3

    invoke-static {v9}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v6

    add-int v1, v4, v6

    .line 207
    .local v1, "dividerPadding":I
    iget-object v4, p0, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    iget-object v6, p0, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment;->mDecoration:Lcom/vkontakte/android/ui/recyclerview/BottomDividerDecoration;

    invoke-virtual {v4, v6}, Lme/grishka/appkit/views/UsableRecyclerView;->removeItemDecoration(Landroid/support/v7/widget/RecyclerView$ItemDecoration;)V

    .line 208
    iget-object v4, p0, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    iget-object v6, p0, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment;->mDecoration:Lcom/vkontakte/android/ui/recyclerview/BottomDividerDecoration;

    invoke-virtual {v6, v1, v1}, Lcom/vkontakte/android/ui/recyclerview/BottomDividerDecoration;->setPadding(II)Lcom/vkontakte/android/ui/recyclerview/BottomDividerDecoration;

    move-result-object v6

    invoke-virtual {v4, v6}, Lme/grishka/appkit/views/UsableRecyclerView;->addItemDecoration(Landroid/support/v7/widget/RecyclerView$ItemDecoration;)V

    .line 210
    const/high16 v4, 0x41c00000    # 24.0f

    invoke-static {v4}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v4

    invoke-virtual {v0, v4}, Lcom/vkontakte/android/ui/recyclerview/CardItemDecoration;->setCardsSpacing(I)Lcom/vkontakte/android/ui/recyclerview/CardItemDecoration;

    move-result-object v4

    invoke-virtual {v4, v5}, Lcom/vkontakte/android/ui/recyclerview/CardItemDecoration;->setBackgroundColor(I)Lcom/vkontakte/android/ui/recyclerview/CardItemDecoration;

    move-result-object v4

    return-object v4

    .end local v0    # "decorator":Lcom/vkontakte/android/ui/recyclerview/CardItemDecoration;
    .end local v1    # "dividerPadding":I
    .end local v2    # "margin":I
    .end local v3    # "padding":I
    :cond_0
    move v4, v5

    .line 192
    goto :goto_0

    .line 196
    .restart local v0    # "decorator":Lcom/vkontakte/android/ui/recyclerview/CardItemDecoration;
    :cond_1
    iget v4, p0, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment;->scrW:I

    const/16 v6, 0x1e0

    if-lt v4, v6, :cond_2

    .line 197
    invoke-static {v8}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v3

    .restart local v3    # "padding":I
    goto :goto_1

    .line 199
    .end local v3    # "padding":I
    :cond_2
    const/4 v3, 0x0

    .restart local v3    # "padding":I
    goto :goto_1

    :cond_3
    move v2, v5

    .line 202
    goto :goto_2
.end method

.method protected onCreateFooterView(Landroid/view/LayoutInflater;)Landroid/view/View;
    .locals 1
    .param p1, "inflater"    # Landroid/view/LayoutInflater;

    .prologue
    .line 220
    const/4 v0, 0x0

    return-object v0
.end method

.method public onDestroy()V
    .locals 2

    .prologue
    .line 247
    invoke-super {p0}, Lcom/vkontakte/android/fragments/base/GridFragment;->onDestroy()V

    .line 248
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    iget-object v1, p0, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment;->mReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {v0, v1}, Landroid/app/Activity;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 249
    return-void
.end method

.method public onDestroyView()V
    .locals 2

    .prologue
    .line 241
    invoke-super {p0}, Lcom/vkontakte/android/fragments/base/GridFragment;->onDestroyView()V

    .line 242
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/app/Activity;->setFinishOnTouchOutside(Z)V

    .line 243
    return-void
.end method

.method public onResume()V
    .locals 1

    .prologue
    .line 183
    invoke-super {p0}, Lcom/vkontakte/android/fragments/base/GridFragment;->onResume()V

    .line 184
    iget-boolean v0, p0, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment;->mPaymentRequired:Z

    if-eqz v0, :cond_0

    .line 185
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment;->mPaymentRequired:Z

    .line 186
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment;->sendGift()V

    .line 188
    :cond_0
    return-void
.end method

.method public onStart()V
    .locals 1

    .prologue
    .line 177
    invoke-super {p0}, Lcom/vkontakte/android/fragments/base/GridFragment;->onStart()V

    .line 178
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment;->mActive:Z

    .line 179
    return-void
.end method

.method public onStop()V
    .locals 1

    .prologue
    .line 235
    invoke-super {p0}, Lcom/vkontakte/android/fragments/base/GridFragment;->onStop()V

    .line 236
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment;->mActive:Z

    .line 237
    return-void
.end method

.method public onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .locals 2
    .param p1, "view"    # Landroid/view/View;
    .param p2, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 158
    invoke-super {p0, p1, p2}, Lcom/vkontakte/android/fragments/base/GridFragment;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    .line 159
    const v0, 0x7f0805f9

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment;->setTitle(I)V

    .line 160
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment;->getToolbar()Landroid/support/v7/widget/Toolbar;

    move-result-object v0

    const v1, 0x7f02014f

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/Toolbar;->setNavigationIcon(I)V

    .line 161
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment;->getToolbar()Landroid/support/v7/widget/Toolbar;

    move-result-object v1

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    check-cast v0, Landroid/view/View$OnClickListener;

    invoke-virtual {v1, v0}, Landroid/support/v7/widget/Toolbar;->setNavigationOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 162
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment;->updateList()V

    .line 163
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment;->dataLoaded()V

    .line 164
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment;->updateFinishOnTouchOutside()V

    .line 165
    return-void
.end method

.method sendGift()V
    .locals 8

    .prologue
    .line 371
    iget-object v0, p0, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment;->mRecipients:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 372
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    const v1, 0x7f080290

    const/4 v3, 0x0

    invoke-static {v0, v1, v3}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 410
    :cond_0
    :goto_0
    return-void

    .line 375
    :cond_1
    iget-boolean v0, p0, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment;->mCanSend:Z

    if-eqz v0, :cond_0

    .line 377
    iget-object v0, p0, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment;->mGift:Lcom/vkontakte/android/api/models/CatalogedGift;

    invoke-virtual {v0}, Lcom/vkontakte/android/api/models/CatalogedGift;->hashCode()I

    move-result v0

    iget-object v1, p0, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment;->mMessage:Ljava/lang/CharSequence;

    invoke-virtual {v1}, Ljava/lang/Object;->hashCode()I

    move-result v1

    xor-int v2, v0, v1

    .line 378
    .local v2, "guid":I
    iget-object v0, p0, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment;->mRecipients:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/vkontakte/android/UserProfile;

    .line 379
    .local v7, "profile":Lcom/vkontakte/android/UserProfile;
    invoke-virtual {v7}, Lcom/vkontakte/android/UserProfile;->hashCode()I

    move-result v1

    xor-int/2addr v2, v1

    .line 380
    goto :goto_1

    .line 382
    .end local v7    # "profile":Lcom/vkontakte/android/UserProfile;
    :cond_2
    new-instance v0, Lcom/vkontakte/android/api/gifts/GiftsSend;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    iget-object v3, p0, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment;->mRecipients:Ljava/util/List;

    iget-object v4, p0, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment;->mGift:Lcom/vkontakte/android/api/models/CatalogedGift;

    iget-object v5, p0, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment;->mMessage:Ljava/lang/CharSequence;

    iget-boolean v6, p0, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment;->mPrivacyEnabled:Z

    invoke-direct/range {v0 .. v6}, Lcom/vkontakte/android/api/gifts/GiftsSend;-><init>(Landroid/content/Context;ILjava/util/List;Lcom/vkontakte/android/api/models/CatalogedGift;Ljava/lang/CharSequence;Z)V

    new-instance v1, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment$2;

    invoke-direct {v1, p0}, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment$2;-><init>(Lcom/vkontakte/android/fragments/gifts/GiftSendFragment;)V

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/gifts/GiftsSend;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    .line 406
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/VKAPIRequest;->wrapProgress(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/VKAPIRequest;->exec(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    goto :goto_0
.end method

.method updateFinishOnTouchOutside()V
    .locals 2

    .prologue
    .line 419
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    iget-object v0, p0, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment;->mMessage:Ljava/lang/CharSequence;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment;->mRecipients:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    invoke-virtual {v1, v0}, Landroid/app/Activity;->setFinishOnTouchOutside(Z)V

    .line 420
    return-void

    .line 419
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.class public Lcom/vkontakte/android/ui/holder/FriendRequestHolder;
.super Lcom/vkontakte/android/ui/holder/RecyclerHolder;
.source "FriendRequestHolder.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/ui/holder/RecyclerHolder",
        "<",
        "Lcom/vkontakte/android/RequestUserProfile;",
        ">;",
        "Landroid/view/View$OnClickListener;"
    }
.end annotation


# instance fields
.field private mAcceptListener:Lcom/vkontakte/android/functions/VoidF2Int;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vkontakte/android/functions/VoidF2Int",
            "<",
            "Lcom/vkontakte/android/RequestUserProfile;",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field private final mInfo:Landroid/widget/TextView;

.field private final mMessage:Landroid/widget/TextView;

.field private final mNegativeButton:Landroid/widget/TextView;

.field private final mPhoto:Lcom/vk/imageloader/view/VKImageView;

.field private final mPositiveButton:Landroid/widget/TextView;

.field private final mSubtitle:Landroid/widget/TextView;

.field private final mTitle:Landroid/widget/TextView;

.field private mUserListener:Lcom/vkontakte/android/functions/VoidF1;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vkontakte/android/functions/VoidF1",
            "<",
            "Lcom/vkontakte/android/UserProfile;",
            ">;"
        }
    .end annotation
.end field

.field private final mUserMessage:Landroid/widget/TextView;

.field private final mUsers:Lcom/vkontakte/android/ui/PhotoStripView;


# direct methods
.method public constructor <init>(Landroid/view/ViewGroup;)V
    .locals 1
    .param p1, "parent"    # Landroid/view/ViewGroup;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 39
    const v0, 0x7f0300a9

    invoke-direct {p0, v0, p1}, Lcom/vkontakte/android/ui/holder/RecyclerHolder;-><init>(ILandroid/view/ViewGroup;)V

    .line 40
    const v0, 0x7f100128

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/ui/holder/FriendRequestHolder;->$(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/vkontakte/android/ui/holder/FriendRequestHolder;->mTitle:Landroid/widget/TextView;

    .line 41
    const v0, 0x7f10019c

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/ui/holder/FriendRequestHolder;->$(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/vkontakte/android/ui/holder/FriendRequestHolder;->mSubtitle:Landroid/widget/TextView;

    .line 42
    const v0, 0x7f1002b0

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/ui/holder/FriendRequestHolder;->$(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/vkontakte/android/ui/holder/FriendRequestHolder;->mUserMessage:Landroid/widget/TextView;

    .line 43
    const v0, 0x7f1002b1

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/ui/holder/FriendRequestHolder;->$(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/vkontakte/android/ui/holder/FriendRequestHolder;->mInfo:Landroid/widget/TextView;

    .line 44
    const v0, 0x7f1001e8

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/ui/holder/FriendRequestHolder;->$(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/vk/imageloader/view/VKImageView;

    iput-object v0, p0, Lcom/vkontakte/android/ui/holder/FriendRequestHolder;->mPhoto:Lcom/vk/imageloader/view/VKImageView;

    .line 45
    const v0, 0x7f1002b2

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/ui/holder/FriendRequestHolder;->$(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/ui/PhotoStripView;

    iput-object v0, p0, Lcom/vkontakte/android/ui/holder/FriendRequestHolder;->mUsers:Lcom/vkontakte/android/ui/PhotoStripView;

    .line 46
    const v0, 0x7f1002b3

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/ui/holder/FriendRequestHolder;->$(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/vkontakte/android/ui/holder/FriendRequestHolder;->mPositiveButton:Landroid/widget/TextView;

    .line 47
    const v0, 0x7f1002b4

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/ui/holder/FriendRequestHolder;->$(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/vkontakte/android/ui/holder/FriendRequestHolder;->mNegativeButton:Landroid/widget/TextView;

    .line 48
    const v0, 0x7f1002b5

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/ui/holder/FriendRequestHolder;->$(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/vkontakte/android/ui/holder/FriendRequestHolder;->mMessage:Landroid/widget/TextView;

    .line 49
    iget-object v0, p0, Lcom/vkontakte/android/ui/holder/FriendRequestHolder;->mPositiveButton:Landroid/widget/TextView;

    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 50
    iget-object v0, p0, Lcom/vkontakte/android/ui/holder/FriendRequestHolder;->mNegativeButton:Landroid/widget/TextView;

    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 51
    iget-object v0, p0, Lcom/vkontakte/android/ui/holder/FriendRequestHolder;->itemView:Landroid/view/View;

    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 52
    return-void
.end method

.method private static getMessageTitleResId(Lcom/vkontakte/android/RequestUserProfile;)I
    .locals 1
    .param p0, "item"    # Lcom/vkontakte/android/RequestUserProfile;

    .prologue
    .line 123
    iget-boolean v0, p0, Lcom/vkontakte/android/RequestUserProfile;->isOutgoing:Z

    if-eqz v0, :cond_0

    .line 124
    const v0, 0x7f08022a

    .line 128
    :goto_0
    return v0

    .line 125
    :cond_0
    iget-boolean v0, p0, Lcom/vkontakte/android/RequestUserProfile;->isSuggesting:Z

    if-eqz v0, :cond_2

    .line 126
    iget-object v0, p0, Lcom/vkontakte/android/RequestUserProfile;->sent:Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_1

    const v0, 0x7f080228

    goto :goto_0

    :cond_1
    const v0, 0x7f080239

    goto :goto_0

    .line 128
    :cond_2
    iget-object v0, p0, Lcom/vkontakte/android/RequestUserProfile;->sent:Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_3

    const v0, 0x7f080226

    goto :goto_0

    :cond_3
    const v0, 0x7f080227

    goto :goto_0
.end method


# virtual methods
.method public attach(Lcom/vkontakte/android/functions/VoidF1;Lcom/vkontakte/android/functions/VoidF2Int;)Lcom/vkontakte/android/ui/holder/FriendRequestHolder;
    .locals 0
    .param p1    # Lcom/vkontakte/android/functions/VoidF1;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p2    # Lcom/vkontakte/android/functions/VoidF2Int;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/vkontakte/android/functions/VoidF1",
            "<",
            "Lcom/vkontakte/android/UserProfile;",
            ">;",
            "Lcom/vkontakte/android/functions/VoidF2Int",
            "<",
            "Lcom/vkontakte/android/RequestUserProfile;",
            "Ljava/lang/Boolean;",
            ">;)",
            "Lcom/vkontakte/android/ui/holder/FriendRequestHolder;"
        }
    .end annotation

    .prologue
    .line 56
    .local p1, "usersListener":Lcom/vkontakte/android/functions/VoidF1;, "Lcom/vkontakte/android/functions/VoidF1<Lcom/vkontakte/android/UserProfile;>;"
    .local p2, "acceptListener":Lcom/vkontakte/android/functions/VoidF2Int;, "Lcom/vkontakte/android/functions/VoidF2Int<Lcom/vkontakte/android/RequestUserProfile;Ljava/lang/Boolean;>;"
    iput-object p1, p0, Lcom/vkontakte/android/ui/holder/FriendRequestHolder;->mUserListener:Lcom/vkontakte/android/functions/VoidF1;

    .line 57
    iput-object p2, p0, Lcom/vkontakte/android/ui/holder/FriendRequestHolder;->mAcceptListener:Lcom/vkontakte/android/functions/VoidF2Int;

    .line 58
    return-object p0
.end method

.method public onBind(Lcom/vkontakte/android/RequestUserProfile;)V
    .locals 9
    .param p1, "item"    # Lcom/vkontakte/android/RequestUserProfile;

    .prologue
    const/16 v3, 0x8

    const/4 v4, 0x0

    .line 63
    iget-object v2, p0, Lcom/vkontakte/android/ui/holder/FriendRequestHolder;->mPhoto:Lcom/vk/imageloader/view/VKImageView;

    iget-object v5, p1, Lcom/vkontakte/android/RequestUserProfile;->photo:Ljava/lang/String;

    invoke-virtual {v2, v5}, Lcom/vk/imageloader/view/VKImageView;->load(Ljava/lang/String;)V

    .line 64
    iget-object v2, p0, Lcom/vkontakte/android/ui/holder/FriendRequestHolder;->mTitle:Landroid/widget/TextView;

    iget-object v5, p1, Lcom/vkontakte/android/RequestUserProfile;->fullName:Ljava/lang/String;

    invoke-virtual {v2, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 65
    iget-object v2, p0, Lcom/vkontakte/android/ui/holder/FriendRequestHolder;->mSubtitle:Landroid/widget/TextView;

    iget-object v5, p1, Lcom/vkontakte/android/RequestUserProfile;->info:Ljava/lang/String;

    invoke-virtual {v2, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 66
    iget-object v5, p0, Lcom/vkontakte/android/ui/holder/FriendRequestHolder;->mSubtitle:Landroid/widget/TextView;

    iget-object v2, p1, Lcom/vkontakte/android/RequestUserProfile;->info:Ljava/lang/String;

    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_1

    move v2, v3

    :goto_0
    invoke-virtual {v5, v2}, Landroid/widget/TextView;->setVisibility(I)V

    .line 67
    iget-object v5, p0, Lcom/vkontakte/android/ui/holder/FriendRequestHolder;->mNegativeButton:Landroid/widget/TextView;

    iget-boolean v2, p1, Lcom/vkontakte/android/RequestUserProfile;->isOutgoing:Z

    if-eqz v2, :cond_2

    const v2, 0x7f080556

    :goto_1
    invoke-virtual {v5, v2}, Landroid/widget/TextView;->setText(I)V

    .line 68
    iget-object v5, p0, Lcom/vkontakte/android/ui/holder/FriendRequestHolder;->mUserMessage:Landroid/widget/TextView;

    iget-object v2, p1, Lcom/vkontakte/android/RequestUserProfile;->message:Ljava/lang/String;

    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_3

    move v2, v3

    :goto_2
    invoke-virtual {v5, v2}, Landroid/widget/TextView;->setVisibility(I)V

    .line 69
    iget-object v2, p0, Lcom/vkontakte/android/ui/holder/FriendRequestHolder;->mUserMessage:Landroid/widget/TextView;

    iget-object v5, p1, Lcom/vkontakte/android/RequestUserProfile;->message:Ljava/lang/String;

    invoke-virtual {v2, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 71
    iget v2, p1, Lcom/vkontakte/android/RequestUserProfile;->numMutualFriends:I

    if-lez v2, :cond_4

    .line 72
    iget-object v2, p0, Lcom/vkontakte/android/ui/holder/FriendRequestHolder;->mInfo:Landroid/widget/TextView;

    invoke-virtual {v2, v4}, Landroid/widget/TextView;->setVisibility(I)V

    .line 73
    iget-object v2, p0, Lcom/vkontakte/android/ui/holder/FriendRequestHolder;->mUsers:Lcom/vkontakte/android/ui/PhotoStripView;

    invoke-virtual {v2, v4}, Lcom/vkontakte/android/ui/PhotoStripView;->setVisibility(I)V

    .line 74
    invoke-virtual {p1}, Lcom/vkontakte/android/RequestUserProfile;->getTag()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 75
    .local v1, "info":Ljava/lang/String;
    if-nez v1, :cond_0

    .line 76
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/holder/FriendRequestHolder;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v5, 0x7f0d0040

    iget v6, p1, Lcom/vkontakte/android/RequestUserProfile;->numMutualFriends:I

    const/4 v7, 0x1

    new-array v7, v7, [Ljava/lang/Object;

    iget v8, p1, Lcom/vkontakte/android/RequestUserProfile;->numMutualFriends:I

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    aput-object v8, v7, v4

    invoke-virtual {v2, v5, v6, v7}, Landroid/content/res/Resources;->getQuantityString(II[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    .line 77
    invoke-virtual {p1, v1}, Lcom/vkontakte/android/RequestUserProfile;->setTag(Ljava/lang/Object;)V

    .line 79
    :cond_0
    iget-object v2, p0, Lcom/vkontakte/android/ui/holder/FriendRequestHolder;->mInfo:Landroid/widget/TextView;

    invoke-virtual {v2, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 80
    iget-object v2, p0, Lcom/vkontakte/android/ui/holder/FriendRequestHolder;->mUsers:Lcom/vkontakte/android/ui/PhotoStripView;

    iget-object v5, p1, Lcom/vkontakte/android/RequestUserProfile;->mutualFriends:[Lcom/vkontakte/android/UserProfile;

    array-length v5, v5

    invoke-virtual {v2, v5}, Lcom/vkontakte/android/ui/PhotoStripView;->setCount(I)V

    .line 82
    iget-object v2, p0, Lcom/vkontakte/android/ui/holder/FriendRequestHolder;->mUsers:Lcom/vkontakte/android/ui/PhotoStripView;

    iget-object v5, p1, Lcom/vkontakte/android/RequestUserProfile;->mutualFriends:[Lcom/vkontakte/android/UserProfile;

    array-length v5, v5

    invoke-virtual {v2, v5}, Lcom/vkontakte/android/ui/PhotoStripView;->setCount(I)V

    .line 83
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_3
    iget-object v2, p1, Lcom/vkontakte/android/RequestUserProfile;->mutualFriends:[Lcom/vkontakte/android/UserProfile;

    array-length v2, v2

    if-ge v0, v2, :cond_5

    .line 84
    iget-object v2, p0, Lcom/vkontakte/android/ui/holder/FriendRequestHolder;->mUsers:Lcom/vkontakte/android/ui/PhotoStripView;

    iget-object v5, p1, Lcom/vkontakte/android/RequestUserProfile;->mutualFriends:[Lcom/vkontakte/android/UserProfile;

    aget-object v5, v5, v0

    iget-object v5, v5, Lcom/vkontakte/android/UserProfile;->photo:Ljava/lang/String;

    invoke-virtual {v2, v0, v5}, Lcom/vkontakte/android/ui/PhotoStripView;->load(ILjava/lang/String;)V

    .line 83
    add-int/lit8 v0, v0, 0x1

    goto :goto_3

    .end local v0    # "i":I
    .end local v1    # "info":Ljava/lang/String;
    :cond_1
    move v2, v4

    .line 66
    goto :goto_0

    .line 67
    :cond_2
    const v2, 0x7f08023d

    goto :goto_1

    :cond_3
    move v2, v4

    .line 68
    goto :goto_2

    .line 87
    :cond_4
    iget-object v2, p0, Lcom/vkontakte/android/ui/holder/FriendRequestHolder;->mInfo:Landroid/widget/TextView;

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setVisibility(I)V

    .line 88
    iget-object v2, p0, Lcom/vkontakte/android/ui/holder/FriendRequestHolder;->mUsers:Lcom/vkontakte/android/ui/PhotoStripView;

    invoke-virtual {v2, v3}, Lcom/vkontakte/android/ui/PhotoStripView;->setVisibility(I)V

    .line 89
    iget-object v2, p0, Lcom/vkontakte/android/ui/holder/FriendRequestHolder;->mUsers:Lcom/vkontakte/android/ui/PhotoStripView;

    invoke-virtual {v2}, Lcom/vkontakte/android/ui/PhotoStripView;->reset()V

    .line 92
    :cond_5
    iget-object v2, p1, Lcom/vkontakte/android/RequestUserProfile;->sent:Ljava/lang/Boolean;

    if-eqz v2, :cond_6

    .line 93
    iget-object v2, p0, Lcom/vkontakte/android/ui/holder/FriendRequestHolder;->mPositiveButton:Landroid/widget/TextView;

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setVisibility(I)V

    .line 94
    iget-object v2, p0, Lcom/vkontakte/android/ui/holder/FriendRequestHolder;->mNegativeButton:Landroid/widget/TextView;

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setVisibility(I)V

    .line 95
    iget-object v2, p0, Lcom/vkontakte/android/ui/holder/FriendRequestHolder;->mMessage:Landroid/widget/TextView;

    invoke-virtual {v2, v4}, Landroid/widget/TextView;->setVisibility(I)V

    .line 96
    iget-object v2, p0, Lcom/vkontakte/android/ui/holder/FriendRequestHolder;->mMessage:Landroid/widget/TextView;

    invoke-static {p1}, Lcom/vkontakte/android/ui/holder/FriendRequestHolder;->getMessageTitleResId(Lcom/vkontakte/android/RequestUserProfile;)I

    move-result v3

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(I)V

    .line 102
    :goto_4
    return-void

    .line 98
    :cond_6
    iget-object v2, p0, Lcom/vkontakte/android/ui/holder/FriendRequestHolder;->mNegativeButton:Landroid/widget/TextView;

    invoke-virtual {v2, v4}, Landroid/widget/TextView;->setVisibility(I)V

    .line 99
    iget-object v2, p0, Lcom/vkontakte/android/ui/holder/FriendRequestHolder;->mPositiveButton:Landroid/widget/TextView;

    iget-boolean v5, p1, Lcom/vkontakte/android/RequestUserProfile;->isOutgoing:Z

    if-eqz v5, :cond_7

    move v4, v3

    :cond_7
    invoke-virtual {v2, v4}, Landroid/widget/TextView;->setVisibility(I)V

    .line 100
    iget-object v2, p0, Lcom/vkontakte/android/ui/holder/FriendRequestHolder;->mMessage:Landroid/widget/TextView;

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setVisibility(I)V

    goto :goto_4
.end method

.method public bridge synthetic onBind(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 20
    check-cast p1, Lcom/vkontakte/android/RequestUserProfile;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/ui/holder/FriendRequestHolder;->onBind(Lcom/vkontakte/android/RequestUserProfile;)V

    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 4
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 106
    iget-object v0, p0, Lcom/vkontakte/android/ui/holder/FriendRequestHolder;->itemView:Landroid/view/View;

    if-ne p1, v0, :cond_1

    .line 107
    iget-object v0, p0, Lcom/vkontakte/android/ui/holder/FriendRequestHolder;->mUserListener:Lcom/vkontakte/android/functions/VoidF1;

    if-eqz v0, :cond_0

    .line 108
    iget-object v0, p0, Lcom/vkontakte/android/ui/holder/FriendRequestHolder;->mUserListener:Lcom/vkontakte/android/functions/VoidF1;

    invoke-virtual {p0}, Lcom/vkontakte/android/ui/holder/FriendRequestHolder;->getItem()Ljava/lang/Object;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/vkontakte/android/functions/VoidF1;->f(Ljava/lang/Object;)V

    .line 119
    :cond_0
    :goto_0
    return-void

    .line 110
    :cond_1
    iget-object v0, p0, Lcom/vkontakte/android/ui/holder/FriendRequestHolder;->mPositiveButton:Landroid/widget/TextView;

    if-ne p1, v0, :cond_2

    .line 111
    iget-object v0, p0, Lcom/vkontakte/android/ui/holder/FriendRequestHolder;->mAcceptListener:Lcom/vkontakte/android/functions/VoidF2Int;

    if-eqz v0, :cond_0

    .line 112
    iget-object v0, p0, Lcom/vkontakte/android/ui/holder/FriendRequestHolder;->mAcceptListener:Lcom/vkontakte/android/functions/VoidF2Int;

    invoke-virtual {p0}, Lcom/vkontakte/android/ui/holder/FriendRequestHolder;->getItem()Ljava/lang/Object;

    move-result-object v1

    sget-object v2, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {p0}, Lcom/vkontakte/android/ui/holder/FriendRequestHolder;->getAdapterPosition()I

    move-result v3

    invoke-interface {v0, v1, v2, v3}, Lcom/vkontakte/android/functions/VoidF2Int;->f(Ljava/lang/Object;Ljava/lang/Object;I)V

    goto :goto_0

    .line 114
    :cond_2
    iget-object v0, p0, Lcom/vkontakte/android/ui/holder/FriendRequestHolder;->mNegativeButton:Landroid/widget/TextView;

    if-ne p1, v0, :cond_0

    .line 115
    iget-object v0, p0, Lcom/vkontakte/android/ui/holder/FriendRequestHolder;->mAcceptListener:Lcom/vkontakte/android/functions/VoidF2Int;

    if-eqz v0, :cond_0

    .line 116
    iget-object v1, p0, Lcom/vkontakte/android/ui/holder/FriendRequestHolder;->mAcceptListener:Lcom/vkontakte/android/functions/VoidF2Int;

    invoke-virtual {p0}, Lcom/vkontakte/android/ui/holder/FriendRequestHolder;->getItem()Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {p0}, Lcom/vkontakte/android/ui/holder/FriendRequestHolder;->getItem()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/RequestUserProfile;

    iget-boolean v0, v0, Lcom/vkontakte/android/RequestUserProfile;->isOutgoing:Z

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    invoke-virtual {p0}, Lcom/vkontakte/android/ui/holder/FriendRequestHolder;->getAdapterPosition()I

    move-result v3

    invoke-interface {v1, v2, v0, v3}, Lcom/vkontakte/android/functions/VoidF2Int;->f(Ljava/lang/Object;Ljava/lang/Object;I)V

    goto :goto_0
.end method

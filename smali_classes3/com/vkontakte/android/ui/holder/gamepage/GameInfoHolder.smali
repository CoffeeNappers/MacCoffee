.class public Lcom/vkontakte/android/ui/holder/gamepage/GameInfoHolder;
.super Lcom/vkontakte/android/ui/holder/RecyclerHolder;
.source "GameInfoHolder.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vkontakte/android/ui/holder/gamepage/GameInfoHolder$AppAdapter;,
        Lcom/vkontakte/android/ui/holder/gamepage/GameInfoHolder$SpacesItemDecoration;,
        Lcom/vkontakte/android/ui/holder/gamepage/GameInfoHolder$Ref;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/ui/holder/RecyclerHolder",
        "<",
        "Lcom/vkontakte/android/ui/holder/gamepage/GameInfoHolder$Ref;",
        ">;",
        "Landroid/view/View$OnClickListener;"
    }
.end annotation


# static fields
.field private static final IMAGE_IDS:[I


# instance fields
.field private final adapter:Lme/grishka/appkit/views/UsableRecyclerView$Adapter;

.field private appAdapter:Lcom/vkontakte/android/ui/holder/gamepage/GameInfoHolder$AppAdapter;

.field private friendsBlock:Landroid/view/View;

.field private imageViews:[Lcom/vk/imageloader/view/VKImageView;

.field private textDescription:Landroid/widget/TextView;

.field private textViewPlayingFriends:Landroid/widget/TextView;

.field private viewDivider:Landroid/view/View;

.field private viewExpandText:Landroid/view/View;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 55
    const/4 v0, 0x4

    new-array v0, v0, [I

    fill-array-data v0, :array_0

    sput-object v0, Lcom/vkontakte/android/ui/holder/gamepage/GameInfoHolder;->IMAGE_IDS:[I

    return-void

    nop

    :array_0
    .array-data 4
        0x7f1001ca
        0x7f1001c9
        0x7f1001c8
        0x7f1001c7
    .end array-data
.end method

.method public constructor <init>(Landroid/content/Context;Lme/grishka/appkit/views/UsableRecyclerView$Adapter;)V
    .locals 7
    .param p1, "context"    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "adapter"    # Lme/grishka/appkit/views/UsableRecyclerView$Adapter;

    .prologue
    const v6, 0x7f1001c5

    const/4 v5, 0x0

    .line 68
    const v3, 0x7f030038

    invoke-direct {p0, v3, p1}, Lcom/vkontakte/android/ui/holder/RecyclerHolder;-><init>(ILandroid/content/Context;)V

    .line 59
    new-instance v3, Lcom/vkontakte/android/ui/holder/gamepage/GameInfoHolder$AppAdapter;

    invoke-direct {v3, p0}, Lcom/vkontakte/android/ui/holder/gamepage/GameInfoHolder$AppAdapter;-><init>(Lcom/vkontakte/android/ui/holder/gamepage/GameInfoHolder;)V

    iput-object v3, p0, Lcom/vkontakte/android/ui/holder/gamepage/GameInfoHolder;->appAdapter:Lcom/vkontakte/android/ui/holder/gamepage/GameInfoHolder$AppAdapter;

    .line 62
    sget-object v3, Lcom/vkontakte/android/ui/holder/gamepage/GameInfoHolder;->IMAGE_IDS:[I

    array-length v3, v3

    new-array v3, v3, [Lcom/vk/imageloader/view/VKImageView;

    iput-object v3, p0, Lcom/vkontakte/android/ui/holder/gamepage/GameInfoHolder;->imageViews:[Lcom/vk/imageloader/view/VKImageView;

    .line 69
    iput-object p2, p0, Lcom/vkontakte/android/ui/holder/gamepage/GameInfoHolder;->adapter:Lme/grishka/appkit/views/UsableRecyclerView$Adapter;

    .line 71
    invoke-virtual {p0, v6}, Lcom/vkontakte/android/ui/holder/gamepage/GameInfoHolder;->$(I)Landroid/view/View;

    move-result-object v3

    invoke-virtual {v3, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 72
    const v3, 0x7f1001c6

    invoke-virtual {p0, v3}, Lcom/vkontakte/android/ui/holder/gamepage/GameInfoHolder;->$(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/TextView;

    iput-object v3, p0, Lcom/vkontakte/android/ui/holder/gamepage/GameInfoHolder;->textViewPlayingFriends:Landroid/widget/TextView;

    .line 73
    const v3, 0x7f1001cb

    invoke-virtual {p0, v3}, Lcom/vkontakte/android/ui/holder/gamepage/GameInfoHolder;->$(I)Landroid/view/View;

    move-result-object v3

    iput-object v3, p0, Lcom/vkontakte/android/ui/holder/gamepage/GameInfoHolder;->viewDivider:Landroid/view/View;

    .line 74
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    sget-object v3, Lcom/vkontakte/android/ui/holder/gamepage/GameInfoHolder;->IMAGE_IDS:[I

    array-length v3, v3

    if-ge v0, v3, :cond_0

    .line 75
    iget-object v4, p0, Lcom/vkontakte/android/ui/holder/gamepage/GameInfoHolder;->imageViews:[Lcom/vk/imageloader/view/VKImageView;

    sget-object v3, Lcom/vkontakte/android/ui/holder/gamepage/GameInfoHolder;->IMAGE_IDS:[I

    aget v3, v3, v0

    invoke-virtual {p0, v3}, Lcom/vkontakte/android/ui/holder/gamepage/GameInfoHolder;->$(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Lcom/vk/imageloader/view/VKImageView;

    aput-object v3, v4, v0

    .line 74
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 77
    :cond_0
    new-instance v1, Landroid/support/v7/widget/LinearLayoutManager;

    invoke-virtual {p0}, Lcom/vkontakte/android/ui/holder/gamepage/GameInfoHolder;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-direct {v1, v3, v5, v5}, Landroid/support/v7/widget/LinearLayoutManager;-><init>(Landroid/content/Context;IZ)V

    .line 78
    .local v1, "layoutManager":Landroid/support/v7/widget/LinearLayoutManager;
    const v3, 0x7f1001c2

    invoke-virtual {p0, v3}, Lcom/vkontakte/android/ui/holder/gamepage/GameInfoHolder;->$(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/support/v7/widget/RecyclerView;

    .line 79
    .local v2, "recyclerView":Landroid/support/v7/widget/RecyclerView;
    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Landroid/support/v7/widget/RecyclerView;->setHasFixedSize(Z)V

    .line 80
    invoke-virtual {v2, v1}, Landroid/support/v7/widget/RecyclerView;->setLayoutManager(Landroid/support/v7/widget/RecyclerView$LayoutManager;)V

    .line 81
    new-instance v3, Lcom/vkontakte/android/ui/holder/gamepage/GameInfoHolder$SpacesItemDecoration;

    const/high16 v4, 0x40800000    # 4.0f

    invoke-static {v4}, Lcom/vkontakte/android/Global;->scale(F)I

    move-result v4

    invoke-direct {v3, v4}, Lcom/vkontakte/android/ui/holder/gamepage/GameInfoHolder$SpacesItemDecoration;-><init>(I)V

    invoke-virtual {v2, v3}, Landroid/support/v7/widget/RecyclerView;->addItemDecoration(Landroid/support/v7/widget/RecyclerView$ItemDecoration;)V

    .line 82
    iget-object v3, p0, Lcom/vkontakte/android/ui/holder/gamepage/GameInfoHolder;->appAdapter:Lcom/vkontakte/android/ui/holder/gamepage/GameInfoHolder$AppAdapter;

    invoke-virtual {v2, v3}, Landroid/support/v7/widget/RecyclerView;->setAdapter(Landroid/support/v7/widget/RecyclerView$Adapter;)V

    .line 83
    invoke-virtual {p0, v6}, Lcom/vkontakte/android/ui/holder/gamepage/GameInfoHolder;->$(I)Landroid/view/View;

    move-result-object v3

    iput-object v3, p0, Lcom/vkontakte/android/ui/holder/gamepage/GameInfoHolder;->friendsBlock:Landroid/view/View;

    .line 84
    const v3, 0x7f1001cc

    invoke-virtual {p0, v3}, Lcom/vkontakte/android/ui/holder/gamepage/GameInfoHolder;->$(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/TextView;

    iput-object v3, p0, Lcom/vkontakte/android/ui/holder/gamepage/GameInfoHolder;->textDescription:Landroid/widget/TextView;

    .line 85
    const v3, 0x7f1001cd

    invoke-virtual {p0, v3}, Lcom/vkontakte/android/ui/holder/gamepage/GameInfoHolder;->$(I)Landroid/view/View;

    move-result-object v3

    iput-object v3, p0, Lcom/vkontakte/android/ui/holder/gamepage/GameInfoHolder;->viewExpandText:Landroid/view/View;

    .line 86
    iget-object v3, p0, Lcom/vkontakte/android/ui/holder/gamepage/GameInfoHolder;->textDescription:Landroid/widget/TextView;

    invoke-virtual {v3, p0}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 87
    iget-object v3, p0, Lcom/vkontakte/android/ui/holder/gamepage/GameInfoHolder;->viewExpandText:Landroid/view/View;

    invoke-virtual {v3, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 88
    return-void
.end method

.method static synthetic access$000()[I
    .locals 1

    .prologue
    .line 30
    sget-object v0, Lcom/vkontakte/android/ui/holder/gamepage/GameInfoHolder;->IMAGE_IDS:[I

    return-object v0
.end method


# virtual methods
.method public onBind(Lcom/vkontakte/android/ui/holder/gamepage/GameInfoHolder$Ref;)V
    .locals 10
    .param p1, "data"    # Lcom/vkontakte/android/ui/holder/gamepage/GameInfoHolder$Ref;

    .prologue
    const/4 v2, 0x1

    const/16 v9, 0x8

    const/4 v3, 0x0

    .line 92
    iget-object v4, p0, Lcom/vkontakte/android/ui/holder/gamepage/GameInfoHolder;->appAdapter:Lcom/vkontakte/android/ui/holder/gamepage/GameInfoHolder$AppAdapter;

    iget-object v5, p1, Lcom/vkontakte/android/ui/holder/gamepage/GameInfoHolder$Ref;->application:Lcom/vkontakte/android/data/ApiApplication;

    iget-object v5, v5, Lcom/vkontakte/android/data/ApiApplication;->screenshot:Ljava/util/ArrayList;

    invoke-virtual {v4, v5}, Lcom/vkontakte/android/ui/holder/gamepage/GameInfoHolder$AppAdapter;->setUrls(Ljava/util/ArrayList;)V

    .line 94
    iget-object v4, p1, Lcom/vkontakte/android/ui/holder/gamepage/GameInfoHolder$Ref;->userProfiles:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v4

    if-le v4, v2, :cond_0

    .line 95
    iget-object v4, p0, Lcom/vkontakte/android/ui/holder/gamepage/GameInfoHolder;->friendsBlock:Landroid/view/View;

    invoke-virtual {v4, v3}, Landroid/view/View;->setVisibility(I)V

    .line 96
    iget-object v4, p0, Lcom/vkontakte/android/ui/holder/gamepage/GameInfoHolder;->viewDivider:Landroid/view/View;

    invoke-virtual {v4, v3}, Landroid/view/View;->setVisibility(I)V

    .line 102
    :goto_0
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    iget-object v4, p0, Lcom/vkontakte/android/ui/holder/gamepage/GameInfoHolder;->imageViews:[Lcom/vk/imageloader/view/VKImageView;

    array-length v4, v4

    if-ge v0, v4, :cond_2

    .line 103
    iget-object v4, p0, Lcom/vkontakte/android/ui/holder/gamepage/GameInfoHolder;->imageViews:[Lcom/vk/imageloader/view/VKImageView;

    aget-object v1, v4, v0

    .line 104
    .local v1, "imageView":Lcom/vk/imageloader/view/VKImageView;
    iget-object v4, p1, Lcom/vkontakte/android/ui/holder/gamepage/GameInfoHolder$Ref;->userProfiles:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v4

    if-ge v0, v4, :cond_1

    .line 105
    invoke-virtual {v1, v3}, Lcom/vk/imageloader/view/VKImageView;->setVisibility(I)V

    .line 106
    invoke-virtual {p1, v0}, Lcom/vkontakte/android/ui/holder/gamepage/GameInfoHolder$Ref;->getProfilePhoto(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v4}, Lcom/vk/imageloader/view/VKImageView;->load(Ljava/lang/String;)V

    .line 102
    :goto_2
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 98
    .end local v0    # "i":I
    .end local v1    # "imageView":Lcom/vk/imageloader/view/VKImageView;
    :cond_0
    iget-object v4, p0, Lcom/vkontakte/android/ui/holder/gamepage/GameInfoHolder;->friendsBlock:Landroid/view/View;

    invoke-virtual {v4, v9}, Landroid/view/View;->setVisibility(I)V

    .line 99
    iget-object v4, p0, Lcom/vkontakte/android/ui/holder/gamepage/GameInfoHolder;->viewDivider:Landroid/view/View;

    invoke-virtual {v4, v9}, Landroid/view/View;->setVisibility(I)V

    goto :goto_0

    .line 108
    .restart local v0    # "i":I
    .restart local v1    # "imageView":Lcom/vk/imageloader/view/VKImageView;
    :cond_1
    invoke-virtual {v1, v9}, Lcom/vk/imageloader/view/VKImageView;->setVisibility(I)V

    goto :goto_2

    .line 112
    .end local v1    # "imageView":Lcom/vk/imageloader/view/VKImageView;
    :cond_2
    iget-object v4, p0, Lcom/vkontakte/android/ui/holder/gamepage/GameInfoHolder;->textViewPlayingFriends:Landroid/widget/TextView;

    const v5, 0x7f0d0014

    iget-object v6, p1, Lcom/vkontakte/android/ui/holder/gamepage/GameInfoHolder$Ref;->userProfiles:Ljava/util/ArrayList;

    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    move-result v6

    new-array v7, v2, [Ljava/lang/Object;

    iget-object v8, p1, Lcom/vkontakte/android/ui/holder/gamepage/GameInfoHolder$Ref;->userProfiles:Ljava/util/ArrayList;

    invoke-virtual {v8}, Ljava/util/ArrayList;->size()I

    move-result v8

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    aput-object v8, v7, v3

    invoke-virtual {p0, v5, v6, v7}, Lcom/vkontakte/android/ui/holder/gamepage/GameInfoHolder;->getQuantityString(II[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 114
    iget-object v4, p1, Lcom/vkontakte/android/ui/holder/gamepage/GameInfoHolder$Ref;->application:Lcom/vkontakte/android/data/ApiApplication;

    iget-object v4, v4, Lcom/vkontakte/android/data/ApiApplication;->description:Ljava/lang/String;

    if-eqz v4, :cond_4

    iget-object v4, p1, Lcom/vkontakte/android/ui/holder/gamepage/GameInfoHolder$Ref;->application:Lcom/vkontakte/android/data/ApiApplication;

    iget-object v4, v4, Lcom/vkontakte/android/data/ApiApplication;->shortDescription:Ljava/lang/String;

    if-eqz v4, :cond_4

    iget-object v4, p1, Lcom/vkontakte/android/ui/holder/gamepage/GameInfoHolder$Ref;->application:Lcom/vkontakte/android/data/ApiApplication;

    iget-object v4, v4, Lcom/vkontakte/android/data/ApiApplication;->description:Ljava/lang/String;

    .line 116
    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v4

    iget-object v5, p1, Lcom/vkontakte/android/ui/holder/gamepage/GameInfoHolder$Ref;->application:Lcom/vkontakte/android/data/ApiApplication;

    iget-object v5, v5, Lcom/vkontakte/android/data/ApiApplication;->shortDescription:Ljava/lang/String;

    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v5

    add-int/lit8 v5, v5, 0x1

    if-gt v4, v5, :cond_4

    .line 118
    .local v2, "isNeedExpand":Z
    :goto_3
    iget-boolean v4, p1, Lcom/vkontakte/android/ui/holder/gamepage/GameInfoHolder$Ref;->isExpand:Z

    if-nez v4, :cond_3

    if-eqz v2, :cond_5

    .line 119
    :cond_3
    iget-object v3, p0, Lcom/vkontakte/android/ui/holder/gamepage/GameInfoHolder;->textDescription:Landroid/widget/TextView;

    iget-object v4, p1, Lcom/vkontakte/android/ui/holder/gamepage/GameInfoHolder$Ref;->application:Lcom/vkontakte/android/data/ApiApplication;

    iget-object v4, v4, Lcom/vkontakte/android/data/ApiApplication;->description:Ljava/lang/String;

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 120
    iget-object v3, p0, Lcom/vkontakte/android/ui/holder/gamepage/GameInfoHolder;->viewExpandText:Landroid/view/View;

    invoke-virtual {v3, v9}, Landroid/view/View;->setVisibility(I)V

    .line 125
    :goto_4
    return-void

    .end local v2    # "isNeedExpand":Z
    :cond_4
    move v2, v3

    .line 116
    goto :goto_3

    .line 122
    .restart local v2    # "isNeedExpand":Z
    :cond_5
    iget-object v4, p0, Lcom/vkontakte/android/ui/holder/gamepage/GameInfoHolder;->textDescription:Landroid/widget/TextView;

    iget-object v5, p1, Lcom/vkontakte/android/ui/holder/gamepage/GameInfoHolder$Ref;->application:Lcom/vkontakte/android/data/ApiApplication;

    iget-object v5, v5, Lcom/vkontakte/android/data/ApiApplication;->shortDescription:Ljava/lang/String;

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 123
    iget-object v4, p0, Lcom/vkontakte/android/ui/holder/gamepage/GameInfoHolder;->viewExpandText:Landroid/view/View;

    invoke-virtual {v4, v3}, Landroid/view/View;->setVisibility(I)V

    goto :goto_4
.end method

.method public bridge synthetic onBind(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 30
    check-cast p1, Lcom/vkontakte/android/ui/holder/gamepage/GameInfoHolder$Ref;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/ui/holder/gamepage/GameInfoHolder;->onBind(Lcom/vkontakte/android/ui/holder/gamepage/GameInfoHolder$Ref;)V

    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 2
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 146
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    const v1, 0x7f1001c5

    if-ne v0, v1, :cond_1

    .line 147
    new-instance v1, Lcom/vkontakte/android/fragments/userlist/GamesFriendFragment$Builder;

    invoke-virtual {p0}, Lcom/vkontakte/android/ui/holder/gamepage/GameInfoHolder;->getItem()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/ui/holder/gamepage/GameInfoHolder$Ref;

    iget-object v0, v0, Lcom/vkontakte/android/ui/holder/gamepage/GameInfoHolder$Ref;->userProfiles:Ljava/util/ArrayList;

    invoke-direct {v1, v0}, Lcom/vkontakte/android/fragments/userlist/GamesFriendFragment$Builder;-><init>(Ljava/util/ArrayList;)V

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v1, v0}, Lcom/vkontakte/android/fragments/userlist/GamesFriendFragment$Builder;->go(Landroid/content/Context;)Z

    .line 152
    :cond_0
    :goto_0
    return-void

    .line 148
    :cond_1
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/holder/gamepage/GameInfoHolder;->getItem()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/ui/holder/gamepage/GameInfoHolder$Ref;

    iget-boolean v0, v0, Lcom/vkontakte/android/ui/holder/gamepage/GameInfoHolder$Ref;->isExpand:Z

    if-nez v0, :cond_0

    .line 149
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/holder/gamepage/GameInfoHolder;->getItem()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/ui/holder/gamepage/GameInfoHolder$Ref;

    const/4 v1, 0x1

    iput-boolean v1, v0, Lcom/vkontakte/android/ui/holder/gamepage/GameInfoHolder$Ref;->isExpand:Z

    .line 150
    iget-object v0, p0, Lcom/vkontakte/android/ui/holder/gamepage/GameInfoHolder;->adapter:Lme/grishka/appkit/views/UsableRecyclerView$Adapter;

    invoke-virtual {v0}, Lme/grishka/appkit/views/UsableRecyclerView$Adapter;->notifyDataSetChanged()V

    goto :goto_0
.end method

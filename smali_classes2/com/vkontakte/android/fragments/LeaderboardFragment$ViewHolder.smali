.class public Lcom/vkontakte/android/fragments/LeaderboardFragment$ViewHolder;
.super Lcom/vkontakte/android/ui/holder/RecyclerHolder;
.source "LeaderboardFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/fragments/LeaderboardFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "ViewHolder"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/ui/holder/RecyclerHolder",
        "<",
        "Lcom/vkontakte/android/data/GameLeaderboard;",
        ">;"
    }
.end annotation


# instance fields
.field private imageViewPlace:Landroid/widget/ImageView;

.field private imageViewUser:Lcom/vk/imageloader/view/VKImageView;

.field private item:Lcom/vkontakte/android/data/GameLeaderboard;

.field private textViewName:Landroid/widget/TextView;

.field private textViewPoints:Landroid/widget/TextView;

.field final synthetic this$0:Lcom/vkontakte/android/fragments/LeaderboardFragment;


# direct methods
.method public constructor <init>(Lcom/vkontakte/android/fragments/LeaderboardFragment;Landroid/view/ViewGroup;)V
    .locals 2
    .param p1, "this$0"    # Lcom/vkontakte/android/fragments/LeaderboardFragment;
    .param p2, "parent"    # Landroid/view/ViewGroup;

    .prologue
    .line 260
    iput-object p1, p0, Lcom/vkontakte/android/fragments/LeaderboardFragment$ViewHolder;->this$0:Lcom/vkontakte/android/fragments/LeaderboardFragment;

    .line 261
    const v0, 0x7f0300d6

    invoke-direct {p0, v0, p2}, Lcom/vkontakte/android/ui/holder/RecyclerHolder;-><init>(ILandroid/view/ViewGroup;)V

    .line 263
    iget-object v0, p0, Lcom/vkontakte/android/fragments/LeaderboardFragment$ViewHolder;->itemView:Landroid/view/View;

    const v1, 0x7f1001cf

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/vkontakte/android/fragments/LeaderboardFragment$ViewHolder;->textViewName:Landroid/widget/TextView;

    .line 264
    iget-object v0, p0, Lcom/vkontakte/android/fragments/LeaderboardFragment$ViewHolder;->itemView:Landroid/view/View;

    const v1, 0x7f1001d0

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/vkontakte/android/fragments/LeaderboardFragment$ViewHolder;->textViewPoints:Landroid/widget/TextView;

    .line 265
    iget-object v0, p0, Lcom/vkontakte/android/fragments/LeaderboardFragment$ViewHolder;->itemView:Landroid/view/View;

    const v1, 0x7f100329

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/vkontakte/android/fragments/LeaderboardFragment$ViewHolder;->imageViewPlace:Landroid/widget/ImageView;

    .line 266
    iget-object v0, p0, Lcom/vkontakte/android/fragments/LeaderboardFragment$ViewHolder;->itemView:Landroid/view/View;

    const v1, 0x7f100124

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/vk/imageloader/view/VKImageView;

    iput-object v0, p0, Lcom/vkontakte/android/fragments/LeaderboardFragment$ViewHolder;->imageViewUser:Lcom/vk/imageloader/view/VKImageView;

    .line 267
    iget-object v0, p0, Lcom/vkontakte/android/fragments/LeaderboardFragment$ViewHolder;->itemView:Landroid/view/View;

    new-instance v1, Lcom/vkontakte/android/fragments/LeaderboardFragment$ViewHolder$1;

    invoke-direct {v1, p0, p1}, Lcom/vkontakte/android/fragments/LeaderboardFragment$ViewHolder$1;-><init>(Lcom/vkontakte/android/fragments/LeaderboardFragment$ViewHolder;Lcom/vkontakte/android/fragments/LeaderboardFragment;)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 275
    return-void
.end method

.method static synthetic access$300(Lcom/vkontakte/android/fragments/LeaderboardFragment$ViewHolder;)Lcom/vkontakte/android/data/GameLeaderboard;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/LeaderboardFragment$ViewHolder;

    .prologue
    .line 251
    iget-object v0, p0, Lcom/vkontakte/android/fragments/LeaderboardFragment$ViewHolder;->item:Lcom/vkontakte/android/data/GameLeaderboard;

    return-object v0
.end method


# virtual methods
.method public onBind(Lcom/vkontakte/android/data/GameLeaderboard;)V
    .locals 7
    .param p1, "item"    # Lcom/vkontakte/android/data/GameLeaderboard;

    .prologue
    const/4 v4, 0x1

    const v1, -0xad7434

    const/4 v6, 0x0

    .line 279
    iput-object p1, p0, Lcom/vkontakte/android/fragments/LeaderboardFragment$ViewHolder;->item:Lcom/vkontakte/android/data/GameLeaderboard;

    .line 280
    iget-object v0, p0, Lcom/vkontakte/android/fragments/LeaderboardFragment$ViewHolder;->textViewName:Landroid/widget/TextView;

    iget-object v2, p1, Lcom/vkontakte/android/data/GameLeaderboard;->userProfile:Lcom/vkontakte/android/UserProfile;

    iget-object v2, v2, Lcom/vkontakte/android/UserProfile;->fullName:Ljava/lang/String;

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 281
    iget-object v0, p0, Lcom/vkontakte/android/fragments/LeaderboardFragment$ViewHolder;->imageViewUser:Lcom/vk/imageloader/view/VKImageView;

    iget-object v2, p1, Lcom/vkontakte/android/data/GameLeaderboard;->userProfile:Lcom/vkontakte/android/UserProfile;

    iget-object v2, v2, Lcom/vkontakte/android/UserProfile;->photo:Ljava/lang/String;

    invoke-virtual {v0, v2}, Lcom/vk/imageloader/view/VKImageView;->load(Ljava/lang/String;)V

    .line 282
    iget-boolean v0, p1, Lcom/vkontakte/android/data/GameLeaderboard;->isPoints:Z

    if-eqz v0, :cond_0

    .line 283
    iget-object v0, p0, Lcom/vkontakte/android/fragments/LeaderboardFragment$ViewHolder;->textViewPoints:Landroid/widget/TextView;

    const v2, 0x7f0d0017

    iget v3, p1, Lcom/vkontakte/android/data/GameLeaderboard;->intValue:I

    new-array v4, v4, [Ljava/lang/Object;

    iget v5, p1, Lcom/vkontakte/android/data/GameLeaderboard;->intValue:I

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v4, v6

    invoke-virtual {p0, v2, v3, v4}, Lcom/vkontakte/android/fragments/LeaderboardFragment$ViewHolder;->getQuantityString(II[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 289
    :goto_0
    iget-object v2, p0, Lcom/vkontakte/android/fragments/LeaderboardFragment$ViewHolder;->textViewName:Landroid/widget/TextView;

    iget v0, p1, Lcom/vkontakte/android/data/GameLeaderboard;->userId:I

    invoke-static {v0}, Lcom/vkontakte/android/auth/VKAccountManager;->isCurrentUser(I)Z

    move-result v0

    if-eqz v0, :cond_1

    move v0, v1

    :goto_1
    invoke-virtual {v2, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 293
    iget-object v0, p0, Lcom/vkontakte/android/fragments/LeaderboardFragment$ViewHolder;->textViewPoints:Landroid/widget/TextView;

    iget v2, p1, Lcom/vkontakte/android/data/GameLeaderboard;->userId:I

    invoke-static {v2}, Lcom/vkontakte/android/auth/VKAccountManager;->isCurrentUser(I)Z

    move-result v2

    if-eqz v2, :cond_2

    :goto_2
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 297
    iget-object v0, p0, Lcom/vkontakte/android/fragments/LeaderboardFragment$ViewHolder;->this$0:Lcom/vkontakte/android/fragments/LeaderboardFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/LeaderboardFragment;->access$200(Lcom/vkontakte/android/fragments/LeaderboardFragment;)Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/4 v1, 0x3

    if-le v0, v1, :cond_3

    iget v0, p1, Lcom/vkontakte/android/data/GameLeaderboard;->place:I

    if-lez v0, :cond_3

    iget v0, p1, Lcom/vkontakte/android/data/GameLeaderboard;->place:I

    const/4 v1, 0x4

    if-ge v0, v1, :cond_3

    .line 298
    iget-object v0, p0, Lcom/vkontakte/android/fragments/LeaderboardFragment$ViewHolder;->imageViewPlace:Landroid/widget/ImageView;

    invoke-virtual {v0, v6}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 299
    iget v0, p1, Lcom/vkontakte/android/data/GameLeaderboard;->place:I

    packed-switch v0, :pswitch_data_0

    .line 314
    :goto_3
    return-void

    .line 286
    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/fragments/LeaderboardFragment$ViewHolder;->textViewPoints:Landroid/widget/TextView;

    const v2, 0x7f0d0016

    iget v3, p1, Lcom/vkontakte/android/data/GameLeaderboard;->intValue:I

    new-array v4, v4, [Ljava/lang/Object;

    iget v5, p1, Lcom/vkontakte/android/data/GameLeaderboard;->intValue:I

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v4, v6

    invoke-virtual {p0, v2, v3, v4}, Lcom/vkontakte/android/fragments/LeaderboardFragment$ViewHolder;->getQuantityString(II[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_0

    .line 289
    :cond_1
    const v0, -0xd3d2d2

    goto :goto_1

    .line 293
    :cond_2
    const v1, -0x6f6b67

    goto :goto_2

    .line 301
    :pswitch_0
    iget-object v0, p0, Lcom/vkontakte/android/fragments/LeaderboardFragment$ViewHolder;->imageViewPlace:Landroid/widget/ImageView;

    const v1, 0x7f0201d2

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageResource(I)V

    goto :goto_3

    .line 304
    :pswitch_1
    iget-object v0, p0, Lcom/vkontakte/android/fragments/LeaderboardFragment$ViewHolder;->imageViewPlace:Landroid/widget/ImageView;

    const v1, 0x7f0201d3

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageResource(I)V

    goto :goto_3

    .line 307
    :pswitch_2
    iget-object v0, p0, Lcom/vkontakte/android/fragments/LeaderboardFragment$ViewHolder;->imageViewPlace:Landroid/widget/ImageView;

    const v1, 0x7f0201d4

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageResource(I)V

    goto :goto_3

    .line 312
    :cond_3
    iget-object v0, p0, Lcom/vkontakte/android/fragments/LeaderboardFragment$ViewHolder;->imageViewPlace:Landroid/widget/ImageView;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    goto :goto_3

    .line 299
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method

.method public bridge synthetic onBind(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 251
    check-cast p1, Lcom/vkontakte/android/data/GameLeaderboard;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/fragments/LeaderboardFragment$ViewHolder;->onBind(Lcom/vkontakte/android/data/GameLeaderboard;)V

    return-void
.end method

.class public Lcom/vkontakte/android/ui/holder/gamepage/GameLeaderboardHolder;
.super Lcom/vkontakte/android/ui/holder/RecyclerHolder;
.source "GameLeaderboardHolder.java"

# interfaces
.implements Lme/grishka/appkit/views/UsableRecyclerView$Clickable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vkontakte/android/ui/holder/gamepage/GameLeaderboardHolder$Data;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/ui/holder/RecyclerHolder",
        "<",
        "Lcom/vkontakte/android/ui/holder/gamepage/GameLeaderboardHolder$Data;",
        ">;",
        "Lme/grishka/appkit/views/UsableRecyclerView$Clickable;"
    }
.end annotation


# static fields
.field private static final formatter:Ljava/text/DecimalFormat;

.field private static final symbols:Ljava/text/DecimalFormatSymbols;


# instance fields
.field private imageView:Lcom/vk/imageloader/view/VKImageView;

.field private textViewName:Landroid/widget/TextView;

.field private textViewNumber:Landroid/widget/TextView;

.field private textViewPoints:Landroid/widget/TextView;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 38
    sget-object v0, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-static {v0}, Ljava/text/NumberFormat;->getInstance(Ljava/util/Locale;)Ljava/text/NumberFormat;

    move-result-object v0

    check-cast v0, Ljava/text/DecimalFormat;

    sput-object v0, Lcom/vkontakte/android/ui/holder/gamepage/GameLeaderboardHolder;->formatter:Ljava/text/DecimalFormat;

    .line 39
    sget-object v0, Lcom/vkontakte/android/ui/holder/gamepage/GameLeaderboardHolder;->formatter:Ljava/text/DecimalFormat;

    invoke-virtual {v0}, Ljava/text/DecimalFormat;->getDecimalFormatSymbols()Ljava/text/DecimalFormatSymbols;

    move-result-object v0

    sput-object v0, Lcom/vkontakte/android/ui/holder/gamepage/GameLeaderboardHolder;->symbols:Ljava/text/DecimalFormatSymbols;

    .line 42
    sget-object v0, Lcom/vkontakte/android/ui/holder/gamepage/GameLeaderboardHolder;->symbols:Ljava/text/DecimalFormatSymbols;

    const/16 v1, 0x20

    invoke-virtual {v0, v1}, Ljava/text/DecimalFormatSymbols;->setGroupingSeparator(C)V

    .line 43
    sget-object v0, Lcom/vkontakte/android/ui/holder/gamepage/GameLeaderboardHolder;->formatter:Ljava/text/DecimalFormat;

    sget-object v1, Lcom/vkontakte/android/ui/holder/gamepage/GameLeaderboardHolder;->symbols:Ljava/text/DecimalFormatSymbols;

    invoke-virtual {v0, v1}, Ljava/text/DecimalFormat;->setDecimalFormatSymbols(Ljava/text/DecimalFormatSymbols;)V

    .line 44
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 52
    const v0, 0x7f030039

    invoke-direct {p0, v0, p1}, Lcom/vkontakte/android/ui/holder/RecyclerHolder;-><init>(ILandroid/content/Context;)V

    .line 54
    const v0, 0x7f100124

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/ui/holder/gamepage/GameLeaderboardHolder;->$(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/vk/imageloader/view/VKImageView;

    iput-object v0, p0, Lcom/vkontakte/android/ui/holder/gamepage/GameLeaderboardHolder;->imageView:Lcom/vk/imageloader/view/VKImageView;

    .line 55
    const v0, 0x7f1001cf

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/ui/holder/gamepage/GameLeaderboardHolder;->$(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/vkontakte/android/ui/holder/gamepage/GameLeaderboardHolder;->textViewName:Landroid/widget/TextView;

    .line 56
    const v0, 0x7f1001d0

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/ui/holder/gamepage/GameLeaderboardHolder;->$(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/vkontakte/android/ui/holder/gamepage/GameLeaderboardHolder;->textViewPoints:Landroid/widget/TextView;

    .line 57
    const v0, 0x7f1001ce

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/ui/holder/gamepage/GameLeaderboardHolder;->$(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/vkontakte/android/ui/holder/gamepage/GameLeaderboardHolder;->textViewNumber:Landroid/widget/TextView;

    .line 58
    return-void
.end method


# virtual methods
.method public getSubText(Lcom/vkontakte/android/data/GameLeaderboard;)Ljava/lang/String;
    .locals 6
    .param p1, "l"    # Lcom/vkontakte/android/data/GameLeaderboard;

    .prologue
    const/4 v3, 0x1

    const/4 v5, 0x0

    .line 76
    iget-boolean v0, p1, Lcom/vkontakte/android/data/GameLeaderboard;->isPoints:Z

    if-eqz v0, :cond_0

    .line 77
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/holder/gamepage/GameLeaderboardHolder;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f0d0017

    iget v2, p1, Lcom/vkontakte/android/data/GameLeaderboard;->intValue:I

    new-array v3, v3, [Ljava/lang/Object;

    iget v4, p1, Lcom/vkontakte/android/data/GameLeaderboard;->intValue:I

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v3, v5

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/res/Resources;->getQuantityString(II[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 79
    :goto_0
    return-object v0

    :cond_0
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/holder/gamepage/GameLeaderboardHolder;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f0d0016

    iget v2, p1, Lcom/vkontakte/android/data/GameLeaderboard;->intValue:I

    new-array v3, v3, [Ljava/lang/Object;

    iget v4, p1, Lcom/vkontakte/android/data/GameLeaderboard;->intValue:I

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v3, v5

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/res/Resources;->getQuantityString(II[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method public onBind(Lcom/vkontakte/android/ui/holder/gamepage/GameLeaderboardHolder$Data;)V
    .locals 2
    .param p1, "gameLiderboard"    # Lcom/vkontakte/android/ui/holder/gamepage/GameLeaderboardHolder$Data;

    .prologue
    .line 62
    iget-object v0, p1, Lcom/vkontakte/android/ui/holder/gamepage/GameLeaderboardHolder$Data;->gameLeaderboard:Lcom/vkontakte/android/data/GameLeaderboard;

    iget-object v0, v0, Lcom/vkontakte/android/data/GameLeaderboard;->userProfile:Lcom/vkontakte/android/UserProfile;

    if-eqz v0, :cond_0

    .line 63
    iget-object v0, p0, Lcom/vkontakte/android/ui/holder/gamepage/GameLeaderboardHolder;->imageView:Lcom/vk/imageloader/view/VKImageView;

    iget-object v1, p1, Lcom/vkontakte/android/ui/holder/gamepage/GameLeaderboardHolder$Data;->gameLeaderboard:Lcom/vkontakte/android/data/GameLeaderboard;

    iget-object v1, v1, Lcom/vkontakte/android/data/GameLeaderboard;->userProfile:Lcom/vkontakte/android/UserProfile;

    iget-object v1, v1, Lcom/vkontakte/android/UserProfile;->photo:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/vk/imageloader/view/VKImageView;->load(Ljava/lang/String;)V

    .line 64
    iget-object v0, p0, Lcom/vkontakte/android/ui/holder/gamepage/GameLeaderboardHolder;->textViewName:Landroid/widget/TextView;

    iget-object v1, p1, Lcom/vkontakte/android/ui/holder/gamepage/GameLeaderboardHolder$Data;->gameLeaderboard:Lcom/vkontakte/android/data/GameLeaderboard;

    iget-object v1, v1, Lcom/vkontakte/android/data/GameLeaderboard;->userProfile:Lcom/vkontakte/android/UserProfile;

    iget-object v1, v1, Lcom/vkontakte/android/UserProfile;->fullName:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 65
    iget-object v0, p0, Lcom/vkontakte/android/ui/holder/gamepage/GameLeaderboardHolder;->textViewPoints:Landroid/widget/TextView;

    iget-object v1, p1, Lcom/vkontakte/android/ui/holder/gamepage/GameLeaderboardHolder$Data;->gameLeaderboard:Lcom/vkontakte/android/data/GameLeaderboard;

    invoke-virtual {p0, v1}, Lcom/vkontakte/android/ui/holder/gamepage/GameLeaderboardHolder;->getSubText(Lcom/vkontakte/android/data/GameLeaderboard;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 66
    iget-object v0, p0, Lcom/vkontakte/android/ui/holder/gamepage/GameLeaderboardHolder;->textViewNumber:Landroid/widget/TextView;

    iget v1, p1, Lcom/vkontakte/android/ui/holder/gamepage/GameLeaderboardHolder$Data;->itemNumber:I

    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 68
    :cond_0
    iget-object v0, p1, Lcom/vkontakte/android/ui/holder/gamepage/GameLeaderboardHolder$Data;->gameLeaderboard:Lcom/vkontakte/android/data/GameLeaderboard;

    iget v0, v0, Lcom/vkontakte/android/data/GameLeaderboard;->userId:I

    invoke-static {v0}, Lcom/vkontakte/android/auth/VKAccountManager;->isCurrentUser(I)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 69
    iget-object v0, p0, Lcom/vkontakte/android/ui/holder/gamepage/GameLeaderboardHolder;->itemView:Landroid/view/View;

    const v1, -0x14110e

    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundColor(I)V

    .line 73
    :goto_0
    return-void

    .line 71
    :cond_1
    iget-object v0, p0, Lcom/vkontakte/android/ui/holder/gamepage/GameLeaderboardHolder;->itemView:Landroid/view/View;

    const/4 v1, -0x1

    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundColor(I)V

    goto :goto_0
.end method

.method public bridge synthetic onBind(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 26
    check-cast p1, Lcom/vkontakte/android/ui/holder/gamepage/GameLeaderboardHolder$Data;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/ui/holder/gamepage/GameLeaderboardHolder;->onBind(Lcom/vkontakte/android/ui/holder/gamepage/GameLeaderboardHolder$Data;)V

    return-void
.end method

.method public onClick()V
    .locals 2

    .prologue
    .line 85
    new-instance v1, Lcom/vkontakte/android/fragments/ProfileFragment$Builder;

    invoke-virtual {p0}, Lcom/vkontakte/android/ui/holder/gamepage/GameLeaderboardHolder;->getItem()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/ui/holder/gamepage/GameLeaderboardHolder$Data;

    iget-object v0, v0, Lcom/vkontakte/android/ui/holder/gamepage/GameLeaderboardHolder$Data;->gameLeaderboard:Lcom/vkontakte/android/data/GameLeaderboard;

    iget v0, v0, Lcom/vkontakte/android/data/GameLeaderboard;->userId:I

    invoke-direct {v1, v0}, Lcom/vkontakte/android/fragments/ProfileFragment$Builder;-><init>(I)V

    invoke-virtual {p0}, Lcom/vkontakte/android/ui/holder/gamepage/GameLeaderboardHolder;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v1, v0}, Lcom/vkontakte/android/fragments/ProfileFragment$Builder;->go(Landroid/content/Context;)Z

    .line 86
    return-void
.end method

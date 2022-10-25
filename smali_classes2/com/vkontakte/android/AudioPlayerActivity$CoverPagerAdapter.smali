.class Lcom/vkontakte/android/AudioPlayerActivity$CoverPagerAdapter;
.super Landroid/support/v4/view/PagerAdapter;
.source "AudioPlayerActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/AudioPlayerActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "CoverPagerAdapter"
.end annotation


# instance fields
.field private activity:Landroid/app/Activity;

.field private final placeholder:Landroid/graphics/drawable/Drawable;

.field private playerTracks:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/vkontakte/android/audio/player/PlayerTrack;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/app/Activity;)V
    .locals 3
    .param p1, "activity"    # Landroid/app/Activity;

    .prologue
    .line 878
    invoke-direct {p0}, Landroid/support/v4/view/PagerAdapter;-><init>()V

    .line 875
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/AudioPlayerActivity$CoverPagerAdapter;->playerTracks:Ljava/util/List;

    .line 879
    iput-object p1, p0, Lcom/vkontakte/android/AudioPlayerActivity$CoverPagerAdapter;->activity:Landroid/app/Activity;

    .line 880
    new-instance v0, Lcom/vkontakte/android/ui/drawable/RecoloredDrawable;

    sget-object v1, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    const v2, 0x7f02005a

    invoke-static {v1, v2}, Landroid/support/v4/content/ContextCompat;->getDrawable(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    const v2, -0xb2a495

    invoke-direct {v0, v1, v2}, Lcom/vkontakte/android/ui/drawable/RecoloredDrawable;-><init>(Landroid/graphics/drawable/Drawable;I)V

    iput-object v0, p0, Lcom/vkontakte/android/AudioPlayerActivity$CoverPagerAdapter;->placeholder:Landroid/graphics/drawable/Drawable;

    .line 881
    return-void
.end method


# virtual methods
.method public destroyItem(Landroid/view/ViewGroup;ILjava/lang/Object;)V
    .locals 0
    .param p1, "container"    # Landroid/view/ViewGroup;
    .param p2, "position"    # I
    .param p3, "object"    # Ljava/lang/Object;

    .prologue
    .line 947
    check-cast p3, Landroid/view/View;

    .end local p3    # "object":Ljava/lang/Object;
    invoke-virtual {p1, p3}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 948
    return-void
.end method

.method getByPosition(I)Lcom/vkontakte/android/audio/player/PlayerTrack;
    .locals 1
    .param p1, "position"    # I

    .prologue
    .line 912
    if-gtz p1, :cond_0

    .line 913
    iget-object v0, p0, Lcom/vkontakte/android/AudioPlayerActivity$CoverPagerAdapter;->playerTracks:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/AudioPlayerActivity$CoverPagerAdapter;->getPlayerTrack(I)Lcom/vkontakte/android/audio/player/PlayerTrack;

    move-result-object v0

    .line 917
    :goto_0
    return-object v0

    .line 914
    :cond_0
    invoke-virtual {p0}, Lcom/vkontakte/android/AudioPlayerActivity$CoverPagerAdapter;->getCount()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    if-lt p1, v0, :cond_1

    .line 915
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/AudioPlayerActivity$CoverPagerAdapter;->getPlayerTrack(I)Lcom/vkontakte/android/audio/player/PlayerTrack;

    move-result-object v0

    goto :goto_0

    .line 917
    :cond_1
    add-int/lit8 v0, p1, -0x1

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/AudioPlayerActivity$CoverPagerAdapter;->getPlayerTrack(I)Lcom/vkontakte/android/audio/player/PlayerTrack;

    move-result-object v0

    goto :goto_0
.end method

.method public getCount()I
    .locals 2

    .prologue
    .line 903
    iget-object v0, p0, Lcom/vkontakte/android/AudioPlayerActivity$CoverPagerAdapter;->playerTracks:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    const/4 v1, 0x1

    if-gt v0, v1, :cond_0

    iget-object v0, p0, Lcom/vkontakte/android/AudioPlayerActivity$CoverPagerAdapter;->playerTracks:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    :goto_0
    return v0

    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/AudioPlayerActivity$CoverPagerAdapter;->playerTracks:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    add-int/lit8 v0, v0, 0x2

    goto :goto_0
.end method

.method getPlayerTrack(I)Lcom/vkontakte/android/audio/player/PlayerTrack;
    .locals 1
    .param p1, "position"    # I
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .prologue
    .line 923
    iget-object v0, p0, Lcom/vkontakte/android/AudioPlayerActivity$CoverPagerAdapter;->playerTracks:Ljava/util/List;

    if-eqz v0, :cond_0

    if-ltz p1, :cond_0

    iget-object v0, p0, Lcom/vkontakte/android/AudioPlayerActivity$CoverPagerAdapter;->playerTracks:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-ge p1, v0, :cond_0

    .line 924
    iget-object v0, p0, Lcom/vkontakte/android/AudioPlayerActivity$CoverPagerAdapter;->playerTracks:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/audio/player/PlayerTrack;

    .line 926
    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method getPositionForTrack(Lcom/vkontakte/android/audio/player/PlayerTrack;)I
    .locals 2
    .param p1, "playerTrack"    # Lcom/vkontakte/android/audio/player/PlayerTrack;

    .prologue
    .line 931
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    iget-object v1, p0, Lcom/vkontakte/android/AudioPlayerActivity$CoverPagerAdapter;->playerTracks:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-ge v0, v1, :cond_1

    .line 932
    iget-object v1, p0, Lcom/vkontakte/android/AudioPlayerActivity$CoverPagerAdapter;->playerTracks:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    invoke-static {p1, v1}, Lcom/vkontakte/android/utils/Utils;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 936
    .end local v0    # "i":I
    :goto_1
    return v0

    .line 931
    .restart local v0    # "i":I
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 936
    :cond_1
    const/4 v0, -0x1

    goto :goto_1
.end method

.method public indexOf(Lcom/vkontakte/android/audio/player/PlayerTrack;)I
    .locals 6
    .param p1, "track"    # Lcom/vkontakte/android/audio/player/PlayerTrack;

    .prologue
    const/4 v4, 0x0

    .line 890
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    iget-object v5, p0, Lcom/vkontakte/android/AudioPlayerActivity$CoverPagerAdapter;->playerTracks:Ljava/util/List;

    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v5

    if-ge v0, v5, :cond_3

    .line 891
    iget-object v5, p0, Lcom/vkontakte/android/AudioPlayerActivity$CoverPagerAdapter;->playerTracks:Ljava/util/List;

    invoke-interface {v5, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vkontakte/android/audio/player/PlayerTrack;

    .line 892
    .local v1, "playerTrack":Lcom/vkontakte/android/audio/player/PlayerTrack;
    if-nez v1, :cond_0

    move-object v2, v4

    .line 893
    .local v2, "playerTrackMid":Ljava/lang/String;
    :goto_1
    if-nez p1, :cond_1

    move-object v3, v4

    .line 894
    .local v3, "trackMid":Ljava/lang/String;
    :goto_2
    invoke-static {v2, v3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v5

    if-eqz v5, :cond_2

    .line 898
    .end local v0    # "i":I
    .end local v1    # "playerTrack":Lcom/vkontakte/android/audio/player/PlayerTrack;
    .end local v2    # "playerTrackMid":Ljava/lang/String;
    .end local v3    # "trackMid":Ljava/lang/String;
    :goto_3
    return v0

    .line 892
    .restart local v0    # "i":I
    .restart local v1    # "playerTrack":Lcom/vkontakte/android/audio/player/PlayerTrack;
    :cond_0
    invoke-virtual {v1}, Lcom/vkontakte/android/audio/player/PlayerTrack;->getMid()Ljava/lang/String;

    move-result-object v2

    goto :goto_1

    .line 893
    .restart local v2    # "playerTrackMid":Ljava/lang/String;
    :cond_1
    invoke-virtual {p1}, Lcom/vkontakte/android/audio/player/PlayerTrack;->getMid()Ljava/lang/String;

    move-result-object v3

    goto :goto_2

    .line 890
    .restart local v3    # "trackMid":Ljava/lang/String;
    :cond_2
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 898
    .end local v1    # "playerTrack":Lcom/vkontakte/android/audio/player/PlayerTrack;
    .end local v2    # "playerTrackMid":Ljava/lang/String;
    .end local v3    # "trackMid":Ljava/lang/String;
    :cond_3
    const/4 v0, 0x0

    goto :goto_3
.end method

.method public instantiateItem(Landroid/view/ViewGroup;I)Ljava/lang/Object;
    .locals 4
    .param p1, "container"    # Landroid/view/ViewGroup;
    .param p2, "position"    # I

    .prologue
    .line 940
    new-instance v1, Lcom/vkontakte/android/AudioPlayerActivity$Holder;

    iget-object v2, p0, Lcom/vkontakte/android/AudioPlayerActivity$CoverPagerAdapter;->activity:Landroid/app/Activity;

    iget-object v3, p0, Lcom/vkontakte/android/AudioPlayerActivity$CoverPagerAdapter;->placeholder:Landroid/graphics/drawable/Drawable;

    invoke-direct {v1, v2, p1, v3}, Lcom/vkontakte/android/AudioPlayerActivity$Holder;-><init>(Landroid/app/Activity;Landroid/view/ViewGroup;Landroid/graphics/drawable/Drawable;)V

    .line 941
    invoke-virtual {p0, p2}, Lcom/vkontakte/android/AudioPlayerActivity$CoverPagerAdapter;->getByPosition(I)Lcom/vkontakte/android/audio/player/PlayerTrack;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/vkontakte/android/AudioPlayerActivity$Holder;->fillPlayerTrack(Lcom/vkontakte/android/audio/player/PlayerTrack;)Lcom/vkontakte/android/AudioPlayerActivity$Holder;

    move-result-object v1

    iget-object v0, v1, Lcom/vkontakte/android/AudioPlayerActivity$Holder;->itemView:Landroid/view/View;

    .line 942
    .local v0, "view":Landroid/view/View;
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 943
    return-object v0
.end method

.method public isViewFromObject(Landroid/view/View;Ljava/lang/Object;)Z
    .locals 1
    .param p1, "view"    # Landroid/view/View;
    .param p2, "object"    # Ljava/lang/Object;

    .prologue
    .line 908
    if-ne p1, p2, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public notifyDataSetChanged()V
    .locals 2

    .prologue
    .line 885
    new-instance v0, Ljava/util/ArrayList;

    invoke-static {}, Lcom/vkontakte/android/audio/AudioFacade;->getActualTrackList()Ljava/util/List;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    iput-object v0, p0, Lcom/vkontakte/android/AudioPlayerActivity$CoverPagerAdapter;->playerTracks:Ljava/util/List;

    .line 886
    invoke-super {p0}, Landroid/support/v4/view/PagerAdapter;->notifyDataSetChanged()V

    .line 887
    return-void
.end method

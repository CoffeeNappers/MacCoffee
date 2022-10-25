.class Lcom/vkontakte/android/AudioPlayerActivity$Holder;
.super Ljava/lang/Object;
.source "AudioPlayerActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/AudioPlayerActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "Holder"
.end annotation


# instance fields
.field final activity:Landroid/app/Activity;

.field final coverView:Lcom/vk/imageloader/view/VKImageView;

.field final itemView:Landroid/view/View;

.field lastTrack:Lcom/vkontakte/android/audio/player/PlayerTrack;

.field final lyrics:Landroid/widget/TextView;


# direct methods
.method constructor <init>(Landroid/app/Activity;Landroid/view/ViewGroup;Landroid/graphics/drawable/Drawable;)V
    .locals 3
    .param p1, "activity"    # Landroid/app/Activity;
    .param p2, "container"    # Landroid/view/ViewGroup;
    .param p3, "defaultPlaceholder"    # Landroid/graphics/drawable/Drawable;

    .prologue
    .line 959
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 960
    iput-object p1, p0, Lcom/vkontakte/android/AudioPlayerActivity$Holder;->activity:Landroid/app/Activity;

    .line 961
    invoke-virtual {p2}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    const v1, 0x7f030060

    const/4 v2, 0x0

    invoke-virtual {v0, v1, p2, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/AudioPlayerActivity$Holder;->itemView:Landroid/view/View;

    .line 962
    iget-object v0, p0, Lcom/vkontakte/android/AudioPlayerActivity$Holder;->itemView:Landroid/view/View;

    invoke-virtual {v0, p0}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 963
    iget-object v0, p0, Lcom/vkontakte/android/AudioPlayerActivity$Holder;->itemView:Landroid/view/View;

    const v1, 0x7f100237

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/vk/imageloader/view/VKImageView;

    iput-object v0, p0, Lcom/vkontakte/android/AudioPlayerActivity$Holder;->coverView:Lcom/vk/imageloader/view/VKImageView;

    .line 964
    iget-object v0, p0, Lcom/vkontakte/android/AudioPlayerActivity$Holder;->itemView:Landroid/view/View;

    const v1, 0x7f100238

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/vkontakte/android/AudioPlayerActivity$Holder;->lyrics:Landroid/widget/TextView;

    .line 965
    iget-object v0, p0, Lcom/vkontakte/android/AudioPlayerActivity$Holder;->coverView:Lcom/vk/imageloader/view/VKImageView;

    invoke-virtual {v0, p3}, Lcom/vk/imageloader/view/VKImageView;->setPlaceholderImage(Landroid/graphics/drawable/Drawable;)V

    .line 966
    return-void
.end method


# virtual methods
.method fillPlayerTrack(Lcom/vkontakte/android/audio/player/PlayerTrack;)Lcom/vkontakte/android/AudioPlayerActivity$Holder;
    .locals 5
    .param p1, "track"    # Lcom/vkontakte/android/audio/player/PlayerTrack;

    .prologue
    const/4 v4, 0x0

    .line 969
    iput-object p1, p0, Lcom/vkontakte/android/AudioPlayerActivity$Holder;->lastTrack:Lcom/vkontakte/android/audio/player/PlayerTrack;

    .line 971
    if-eqz p1, :cond_3

    .line 973
    invoke-virtual {p1}, Lcom/vkontakte/android/audio/player/PlayerTrack;->getThumb()Lcom/vk/music/dto/Thumb;

    move-result-object v2

    if-eqz v2, :cond_0

    .line 974
    iget-object v2, p0, Lcom/vkontakte/android/AudioPlayerActivity$Holder;->coverView:Lcom/vk/imageloader/view/VKImageView;

    invoke-virtual {v2}, Lcom/vk/imageloader/view/VKImageView;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v2

    iget v1, v2, Landroid/content/res/Configuration;->screenWidthDp:I

    .line 975
    .local v1, "w":I
    iget-object v2, p0, Lcom/vkontakte/android/AudioPlayerActivity$Holder;->coverView:Lcom/vk/imageloader/view/VKImageView;

    invoke-virtual {v2}, Lcom/vk/imageloader/view/VKImageView;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v2

    iget v0, v2, Landroid/content/res/Configuration;->screenHeightDp:I

    .line 976
    .local v0, "h":I
    iget-object v2, p0, Lcom/vkontakte/android/AudioPlayerActivity$Holder;->coverView:Lcom/vk/imageloader/view/VKImageView;

    invoke-static {v1, v0}, Ljava/lang/Math;->min(II)I

    move-result v3

    invoke-virtual {p1, v3}, Lcom/vkontakte/android/audio/player/PlayerTrack;->getThumbUrl(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/vk/imageloader/view/VKImageView;->load(Ljava/lang/String;)V

    .line 981
    .end local v0    # "h":I
    .end local v1    # "w":I
    :goto_0
    iget v2, p1, Lcom/vkontakte/android/audio/player/PlayerTrack;->lyricsID:I

    if-lez v2, :cond_2

    .line 982
    iget-object v2, p1, Lcom/vkontakte/android/audio/player/PlayerTrack;->lyricsText:Ljava/lang/String;

    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_1

    .line 983
    iget-object v2, p0, Lcom/vkontakte/android/AudioPlayerActivity$Holder;->lyrics:Landroid/widget/TextView;

    iget-object v3, p1, Lcom/vkontakte/android/audio/player/PlayerTrack;->lyricsText:Ljava/lang/String;

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 984
    iget-object v2, p0, Lcom/vkontakte/android/AudioPlayerActivity$Holder;->itemView:Landroid/view/View;

    const/4 v3, 0x1

    invoke-static {v2, v3}, Lcom/vkontakte/android/ViewUtils;->setEnabled(Landroid/view/View;Z)V

    .line 985
    iget-object v2, p0, Lcom/vkontakte/android/AudioPlayerActivity$Holder;->activity:Landroid/app/Activity;

    invoke-virtual {v2}, Landroid/app/Activity;->invalidateOptionsMenu()V

    .line 1011
    :goto_1
    return-object p0

    .line 978
    :cond_0
    iget-object v2, p0, Lcom/vkontakte/android/AudioPlayerActivity$Holder;->coverView:Lcom/vk/imageloader/view/VKImageView;

    invoke-virtual {v2}, Lcom/vk/imageloader/view/VKImageView;->clear()V

    goto :goto_0

    .line 988
    :cond_1
    iget-object v2, p0, Lcom/vkontakte/android/AudioPlayerActivity$Holder;->itemView:Landroid/view/View;

    invoke-static {v2, v4}, Lcom/vkontakte/android/ViewUtils;->setEnabled(Landroid/view/View;Z)V

    .line 989
    new-instance v2, Lcom/vkontakte/android/api/audio/AudioGetLyrics;

    iget v3, p1, Lcom/vkontakte/android/audio/player/PlayerTrack;->lyricsID:I

    invoke-direct {v2, v3}, Lcom/vkontakte/android/api/audio/AudioGetLyrics;-><init>(I)V

    new-instance v3, Lcom/vkontakte/android/AudioPlayerActivity$Holder$1;

    invoke-direct {v3, p0, p1}, Lcom/vkontakte/android/AudioPlayerActivity$Holder$1;-><init>(Lcom/vkontakte/android/AudioPlayerActivity$Holder;Lcom/vkontakte/android/audio/player/PlayerTrack;)V

    invoke-virtual {v2, v3}, Lcom/vkontakte/android/api/audio/AudioGetLyrics;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v2

    iget-object v3, p0, Lcom/vkontakte/android/AudioPlayerActivity$Holder;->activity:Landroid/app/Activity;

    .line 1004
    invoke-virtual {v2, v3}, Lcom/vkontakte/android/api/VKAPIRequest;->exec(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    goto :goto_1

    .line 1006
    :cond_2
    iget-object v2, p0, Lcom/vkontakte/android/AudioPlayerActivity$Holder;->itemView:Landroid/view/View;

    invoke-static {v2, v4}, Lcom/vkontakte/android/ViewUtils;->setEnabled(Landroid/view/View;Z)V

    goto :goto_1

    .line 1009
    :cond_3
    iget-object v2, p0, Lcom/vkontakte/android/AudioPlayerActivity$Holder;->coverView:Lcom/vk/imageloader/view/VKImageView;

    invoke-virtual {v2}, Lcom/vk/imageloader/view/VKImageView;->clear()V

    goto :goto_1
.end method

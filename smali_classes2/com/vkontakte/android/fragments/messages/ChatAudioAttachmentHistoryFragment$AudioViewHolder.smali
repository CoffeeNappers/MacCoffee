.class Lcom/vkontakte/android/fragments/messages/ChatAudioAttachmentHistoryFragment$AudioViewHolder;
.super Lcom/vkontakte/android/ui/holder/RecyclerHolder;
.source "ChatAudioAttachmentHistoryFragment.java"

# interfaces
.implements Lme/grishka/appkit/views/UsableRecyclerView$Clickable;
.implements Lme/grishka/appkit/views/UsableRecyclerView$LongClickable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/fragments/messages/ChatAudioAttachmentHistoryFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "AudioViewHolder"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/ui/holder/RecyclerHolder",
        "<",
        "Lcom/vkontakte/android/audio/MusicTrack;",
        ">;",
        "Lme/grishka/appkit/views/UsableRecyclerView$Clickable;",
        "Lme/grishka/appkit/views/UsableRecyclerView$LongClickable;"
    }
.end annotation


# instance fields
.field private artist:Landroid/widget/TextView;

.field private cacheIcon:Landroid/widget/ImageView;

.field private duration:Landroid/widget/TextView;

.field private playIcon:Landroid/widget/ImageView;

.field final synthetic this$0:Lcom/vkontakte/android/fragments/messages/ChatAudioAttachmentHistoryFragment;

.field private title:Landroid/widget/TextView;


# direct methods
.method public constructor <init>(Lcom/vkontakte/android/fragments/messages/ChatAudioAttachmentHistoryFragment;)V
    .locals 3

    .prologue
    .line 135
    iput-object p1, p0, Lcom/vkontakte/android/fragments/messages/ChatAudioAttachmentHistoryFragment$AudioViewHolder;->this$0:Lcom/vkontakte/android/fragments/messages/ChatAudioAttachmentHistoryFragment;

    .line 136
    invoke-virtual {p1}, Lcom/vkontakte/android/fragments/messages/ChatAudioAttachmentHistoryFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    const v1, 0x7f03005a

    invoke-static {p1}, Lcom/vkontakte/android/fragments/messages/ChatAudioAttachmentHistoryFragment;->access$500(Lcom/vkontakte/android/fragments/messages/ChatAudioAttachmentHistoryFragment;)Lme/grishka/appkit/views/UsableRecyclerView;

    move-result-object v2

    invoke-direct {p0, v0, v1, v2}, Lcom/vkontakte/android/ui/holder/RecyclerHolder;-><init>(Landroid/content/Context;ILandroid/view/ViewGroup;)V

    .line 137
    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/ChatAudioAttachmentHistoryFragment$AudioViewHolder;->itemView:Landroid/view/View;

    const v1, 0x7f100216

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/vkontakte/android/fragments/messages/ChatAudioAttachmentHistoryFragment$AudioViewHolder;->title:Landroid/widget/TextView;

    .line 138
    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/ChatAudioAttachmentHistoryFragment$AudioViewHolder;->itemView:Landroid/view/View;

    const v1, 0x7f100217

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/vkontakte/android/fragments/messages/ChatAudioAttachmentHistoryFragment$AudioViewHolder;->artist:Landroid/widget/TextView;

    .line 139
    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/ChatAudioAttachmentHistoryFragment$AudioViewHolder;->itemView:Landroid/view/View;

    const v1, 0x7f100219

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/vkontakte/android/fragments/messages/ChatAudioAttachmentHistoryFragment$AudioViewHolder;->duration:Landroid/widget/TextView;

    .line 140
    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/ChatAudioAttachmentHistoryFragment$AudioViewHolder;->itemView:Landroid/view/View;

    const v1, 0x7f100212

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/vkontakte/android/fragments/messages/ChatAudioAttachmentHistoryFragment$AudioViewHolder;->playIcon:Landroid/widget/ImageView;

    .line 141
    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/ChatAudioAttachmentHistoryFragment$AudioViewHolder;->itemView:Landroid/view/View;

    const v1, 0x7f100218

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/vkontakte/android/fragments/messages/ChatAudioAttachmentHistoryFragment$AudioViewHolder;->cacheIcon:Landroid/widget/ImageView;

    .line 142
    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/ChatAudioAttachmentHistoryFragment$AudioViewHolder;->playIcon:Landroid/widget/ImageView;

    new-instance v1, Lcom/vkontakte/android/ui/drawable/AudioVisualizerDrawable;

    invoke-direct {v1}, Lcom/vkontakte/android/ui/drawable/AudioVisualizerDrawable;-><init>()V

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 143
    return-void
.end method


# virtual methods
.method public onBind(Lcom/vkontakte/android/audio/MusicTrack;)V
    .locals 10
    .param p1, "item"    # Lcom/vkontakte/android/audio/MusicTrack;

    .prologue
    const/16 v6, 0x8

    const/4 v3, 0x1

    const/4 v4, 0x0

    .line 147
    iget-object v5, p0, Lcom/vkontakte/android/fragments/messages/ChatAudioAttachmentHistoryFragment$AudioViewHolder;->title:Landroid/widget/TextView;

    iget-object v7, p1, Lcom/vkontakte/android/audio/MusicTrack;->title:Ljava/lang/String;

    invoke-virtual {v5, v7}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 148
    iget-object v5, p0, Lcom/vkontakte/android/fragments/messages/ChatAudioAttachmentHistoryFragment$AudioViewHolder;->artist:Landroid/widget/TextView;

    iget-object v7, p1, Lcom/vkontakte/android/audio/MusicTrack;->artist:Ljava/lang/String;

    invoke-virtual {v5, v7}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 149
    iget-object v5, p0, Lcom/vkontakte/android/fragments/messages/ChatAudioAttachmentHistoryFragment$AudioViewHolder;->duration:Landroid/widget/TextView;

    const-string/jumbo v7, "%d:%02d"

    const/4 v8, 0x2

    new-array v8, v8, [Ljava/lang/Object;

    iget v9, p1, Lcom/vkontakte/android/audio/MusicTrack;->duration:I

    div-int/lit8 v9, v9, 0x3c

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    aput-object v9, v8, v4

    iget v9, p1, Lcom/vkontakte/android/audio/MusicTrack;->duration:I

    rem-int/lit8 v9, v9, 0x3c

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    aput-object v9, v8, v3

    invoke-static {v7, v8}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v5, v7}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 150
    invoke-static {}, Lcom/vkontakte/android/audio/AudioFacade;->getCurrentTrack()Lcom/vkontakte/android/audio/player/PlayerTrack;

    move-result-object v0

    .line 151
    .local v0, "audioFile":Lcom/vkontakte/android/audio/MusicTrack;
    invoke-virtual {p1, v0}, Lcom/vkontakte/android/audio/MusicTrack;->equals(Ljava/lang/Object;)Z

    move-result v2

    .line 152
    .local v2, "isCurrent":Z
    invoke-virtual {p1}, Lcom/vkontakte/android/audio/MusicTrack;->getMid()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Lcom/vkontakte/android/audio/AudioFacade;->isCached(Ljava/lang/String;)Z

    move-result v1

    .line 153
    .local v1, "isCached":Z
    if-eqz v2, :cond_0

    invoke-static {}, Lcom/vkontakte/android/audio/AudioFacade;->getPlayerState()Lcom/vkontakte/android/audio/player/PlayerState;

    move-result-object v5

    invoke-virtual {v5}, Lcom/vkontakte/android/audio/player/PlayerState;->isPlayState()Z

    move-result v5

    if-eqz v5, :cond_0

    .line 154
    .local v3, "pt":Z
    :goto_0
    iget-object v7, p0, Lcom/vkontakte/android/fragments/messages/ChatAudioAttachmentHistoryFragment$AudioViewHolder;->playIcon:Landroid/widget/ImageView;

    if-eqz v2, :cond_1

    move v5, v4

    :goto_1
    invoke-virtual {v7, v5}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 155
    iget-object v5, p0, Lcom/vkontakte/android/fragments/messages/ChatAudioAttachmentHistoryFragment$AudioViewHolder;->playIcon:Landroid/widget/ImageView;

    invoke-virtual {v5, v3}, Landroid/widget/ImageView;->setSelected(Z)V

    .line 156
    iget-object v5, p0, Lcom/vkontakte/android/fragments/messages/ChatAudioAttachmentHistoryFragment$AudioViewHolder;->cacheIcon:Landroid/widget/ImageView;

    if-eqz v1, :cond_2

    :goto_2
    invoke-virtual {v5, v4}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 157
    return-void

    .end local v3    # "pt":Z
    :cond_0
    move v3, v4

    .line 153
    goto :goto_0

    .restart local v3    # "pt":Z
    :cond_1
    move v5, v6

    .line 154
    goto :goto_1

    :cond_2
    move v4, v6

    .line 156
    goto :goto_2
.end method

.method public bridge synthetic onBind(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 130
    check-cast p1, Lcom/vkontakte/android/audio/MusicTrack;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/fragments/messages/ChatAudioAttachmentHistoryFragment$AudioViewHolder;->onBind(Lcom/vkontakte/android/audio/MusicTrack;)V

    return-void
.end method

.method public onClick()V
    .locals 6

    .prologue
    .line 161
    iget-object v1, p0, Lcom/vkontakte/android/fragments/messages/ChatAudioAttachmentHistoryFragment$AudioViewHolder;->item:Ljava/lang/Object;

    check-cast v1, Lcom/vkontakte/android/audio/MusicTrack;

    .line 162
    .local v1, "file":Lcom/vkontakte/android/audio/MusicTrack;
    invoke-static {}, Lcom/vkontakte/android/audio/AudioFacade;->getCurrentTrack()Lcom/vkontakte/android/audio/player/PlayerTrack;

    move-result-object v0

    .line 163
    .local v0, "cur":Lcom/vkontakte/android/audio/MusicTrack;
    invoke-virtual {v1, v0}, Lcom/vkontakte/android/audio/MusicTrack;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 164
    invoke-static {}, Lcom/vkontakte/android/audio/AudioFacade;->toggleResumePause()V

    .line 168
    :goto_0
    return-void

    .line 167
    :cond_0
    iget-object v2, p0, Lcom/vkontakte/android/fragments/messages/ChatAudioAttachmentHistoryFragment$AudioViewHolder;->this$0:Lcom/vkontakte/android/fragments/messages/ChatAudioAttachmentHistoryFragment;

    invoke-static {v2}, Lcom/vkontakte/android/fragments/messages/ChatAudioAttachmentHistoryFragment;->access$600(Lcom/vkontakte/android/fragments/messages/ChatAudioAttachmentHistoryFragment;)Ljava/util/ArrayList;

    move-result-object v2

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/messages/ChatAudioAttachmentHistoryFragment$AudioViewHolder;->getAdapterPosition()I

    move-result v3

    sget-object v4, Lcom/vkontakte/android/audio/player/PlayerRefer;->none:Lcom/vkontakte/android/audio/player/PlayerRefer;

    const/4 v5, 0x1

    invoke-static {v2, v3, v4, v5}, Lcom/vkontakte/android/audio/AudioFacade;->playTracks(Ljava/util/Collection;ILcom/vkontakte/android/audio/player/PlayerRefer;Z)V

    goto :goto_0
.end method

.method public onLongClick()Z
    .locals 2

    .prologue
    .line 172
    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/ChatAudioAttachmentHistoryFragment$AudioViewHolder;->item:Ljava/lang/Object;

    check-cast v0, Lcom/vkontakte/android/audio/MusicTrack;

    .line 173
    .local v0, "file":Lcom/vkontakte/android/audio/MusicTrack;
    if-eqz v0, :cond_0

    iget-object v1, p0, Lcom/vkontakte/android/fragments/messages/ChatAudioAttachmentHistoryFragment$AudioViewHolder;->this$0:Lcom/vkontakte/android/fragments/messages/ChatAudioAttachmentHistoryFragment;

    invoke-static {v1, v0}, Lcom/vkontakte/android/fragments/messages/ChatAudioAttachmentHistoryFragment;->access$700(Lcom/vkontakte/android/fragments/messages/ChatAudioAttachmentHistoryFragment;Lcom/vkontakte/android/audio/MusicTrack;)Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 v1, 0x1

    :goto_0
    return v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.class Lcom/vk/music/view/holders/SectionHolder$AudioHolder;
.super Lcom/vkontakte/android/ui/holder/RecyclerHolder;
.source "SectionHolder.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vk/music/view/holders/SectionHolder;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "AudioHolder"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/ui/holder/RecyclerHolder",
        "<",
        "Lcom/vkontakte/android/audio/MusicTrack;",
        ">;",
        "Landroid/view/View$OnClickListener;"
    }
.end annotation


# instance fields
.field final adapter:Lcom/vk/music/view/holders/SectionHolder$Adapter;
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation
.end field

.field final imageView:Lcom/vk/music/view/ThumbsImageView;

.field final playingIndicator:Landroid/widget/ImageView;

.field final recommendedModel:Lcom/vk/music/model/RecommendedModel;
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation
.end field

.field final textViewSubtitle:Landroid/widget/TextView;

.field final textViewTitle:Landroid/widget/TextView;


# direct methods
.method constructor <init>(Landroid/view/ViewGroup;Lcom/vk/music/model/RecommendedModel;Lcom/vk/music/view/holders/SectionHolder$Adapter;)V
    .locals 3
    .param p1, "parent"    # Landroid/view/ViewGroup;
    .param p2, "recommendedModel"    # Lcom/vk/music/model/RecommendedModel;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p3, "adapter"    # Lcom/vk/music/view/holders/SectionHolder$Adapter;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 259
    const v0, 0x7f030123

    invoke-direct {p0, v0, p1}, Lcom/vkontakte/android/ui/holder/RecyclerHolder;-><init>(ILandroid/view/ViewGroup;)V

    .line 260
    iget-object v0, p0, Lcom/vk/music/view/holders/SectionHolder$AudioHolder;->itemView:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    const/high16 v1, 0x43a00000    # 320.0f

    invoke-static {v1}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v1

    iput v1, v0, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 262
    iput-object p2, p0, Lcom/vk/music/view/holders/SectionHolder$AudioHolder;->recommendedModel:Lcom/vk/music/model/RecommendedModel;

    .line 263
    iput-object p3, p0, Lcom/vk/music/view/holders/SectionHolder$AudioHolder;->adapter:Lcom/vk/music/view/holders/SectionHolder$Adapter;

    .line 265
    const v0, 0x7f1003bf

    invoke-virtual {p0, v0}, Lcom/vk/music/view/holders/SectionHolder$AudioHolder;->$(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 266
    iget-object v0, p0, Lcom/vk/music/view/holders/SectionHolder$AudioHolder;->itemView:Landroid/view/View;

    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 268
    const v0, 0x7f100216

    invoke-virtual {p0, v0}, Lcom/vk/music/view/holders/SectionHolder$AudioHolder;->$(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/vk/music/view/holders/SectionHolder$AudioHolder;->textViewTitle:Landroid/widget/TextView;

    .line 269
    const v0, 0x7f100217

    invoke-virtual {p0, v0}, Lcom/vk/music/view/holders/SectionHolder$AudioHolder;->$(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/vk/music/view/holders/SectionHolder$AudioHolder;->textViewSubtitle:Landroid/widget/TextView;

    .line 270
    const v0, 0x7f1003bd

    invoke-virtual {p0, v0}, Lcom/vk/music/view/holders/SectionHolder$AudioHolder;->$(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/vk/music/view/ThumbsImageView;

    iput-object v0, p0, Lcom/vk/music/view/holders/SectionHolder$AudioHolder;->imageView:Lcom/vk/music/view/ThumbsImageView;

    .line 271
    const v0, 0x7f1003be

    invoke-virtual {p0, v0}, Lcom/vk/music/view/holders/SectionHolder$AudioHolder;->$(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/vk/music/view/holders/SectionHolder$AudioHolder;->playingIndicator:Landroid/widget/ImageView;

    .line 272
    iget-object v0, p0, Lcom/vk/music/view/holders/SectionHolder$AudioHolder;->playingIndicator:Landroid/widget/ImageView;

    new-instance v1, Lcom/vk/music/graphics/PlayingDrawable$ResourceBuilder;

    iget-object v2, p0, Lcom/vk/music/view/holders/SectionHolder$AudioHolder;->itemView:Landroid/view/View;

    .line 273
    invoke-static {v2}, Lcom/vk/core/util/Resourcer;->from(Landroid/view/View;)Lcom/vk/core/util/Resourcer;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/vk/music/graphics/PlayingDrawable$ResourceBuilder;-><init>(Lcom/vk/core/util/Resourcer;)V

    const v2, 0x7f0a0017

    .line 274
    invoke-virtual {v1, v2}, Lcom/vk/music/graphics/PlayingDrawable$ResourceBuilder;->count(I)Lcom/vk/music/graphics/PlayingDrawable$Builder;

    move-result-object v1

    const v2, 0x7f090113

    .line 275
    invoke-virtual {v1, v2}, Lcom/vk/music/graphics/PlayingDrawable$Builder;->rectWidth(I)Lcom/vk/music/graphics/PlayingDrawable$Builder;

    move-result-object v1

    const v2, 0x7f090111

    .line 276
    invoke-virtual {v1, v2}, Lcom/vk/music/graphics/PlayingDrawable$Builder;->rectHeight(I)Lcom/vk/music/graphics/PlayingDrawable$Builder;

    move-result-object v1

    const v2, 0x7f090112

    .line 277
    invoke-virtual {v1, v2}, Lcom/vk/music/graphics/PlayingDrawable$Builder;->rectMinHeight(I)Lcom/vk/music/graphics/PlayingDrawable$Builder;

    move-result-object v1

    const v2, 0x7f0f009c

    .line 278
    invoke-virtual {v1, v2}, Lcom/vk/music/graphics/PlayingDrawable$Builder;->rectColor(I)Lcom/vk/music/graphics/PlayingDrawable$Builder;

    move-result-object v1

    const v2, 0x7f090110

    .line 279
    invoke-virtual {v1, v2}, Lcom/vk/music/graphics/PlayingDrawable$Builder;->gapWidth(I)Lcom/vk/music/graphics/PlayingDrawable$Builder;

    move-result-object v1

    .line 280
    invoke-virtual {v1}, Lcom/vk/music/graphics/PlayingDrawable$Builder;->build()Lcom/vk/music/graphics/PlayingDrawable;

    move-result-object v1

    .line 272
    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 282
    return-void
.end method


# virtual methods
.method public onBind(Lcom/vkontakte/android/audio/MusicTrack;)V
    .locals 2
    .param p1, "item"    # Lcom/vkontakte/android/audio/MusicTrack;

    .prologue
    .line 286
    iget-object v0, p0, Lcom/vk/music/view/holders/SectionHolder$AudioHolder;->textViewTitle:Landroid/widget/TextView;

    iget-object v1, p1, Lcom/vkontakte/android/audio/MusicTrack;->title:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 287
    iget-object v0, p0, Lcom/vk/music/view/holders/SectionHolder$AudioHolder;->textViewSubtitle:Landroid/widget/TextView;

    iget-object v1, p1, Lcom/vkontakte/android/audio/MusicTrack;->artist:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 288
    iget-object v0, p0, Lcom/vk/music/view/holders/SectionHolder$AudioHolder;->imageView:Lcom/vk/music/view/ThumbsImageView;

    invoke-virtual {p1}, Lcom/vkontakte/android/audio/MusicTrack;->getThumb()Lcom/vk/music/dto/Thumb;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vk/music/view/ThumbsImageView;->setThumb(Lcom/vk/music/dto/Thumb;)V

    .line 290
    invoke-virtual {p0}, Lcom/vk/music/view/holders/SectionHolder$AudioHolder;->updatePlayingState()V

    .line 291
    return-void
.end method

.method public bridge synthetic onBind(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 246
    check-cast p1, Lcom/vkontakte/android/audio/MusicTrack;

    invoke-virtual {p0, p1}, Lcom/vk/music/view/holders/SectionHolder$AudioHolder;->onBind(Lcom/vkontakte/android/audio/MusicTrack;)V

    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 7
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 306
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v1

    packed-switch v1, :pswitch_data_0

    .line 317
    iget-object v2, p0, Lcom/vk/music/view/holders/SectionHolder$AudioHolder;->recommendedModel:Lcom/vk/music/model/RecommendedModel;

    iget-object v1, p0, Lcom/vk/music/view/holders/SectionHolder$AudioHolder;->adapter:Lcom/vk/music/view/holders/SectionHolder$Adapter;

    iget-object v3, v1, Lcom/vk/music/view/holders/SectionHolder$Adapter;->section:Lcom/vk/music/dto/Section;

    invoke-virtual {p0}, Lcom/vk/music/view/holders/SectionHolder$AudioHolder;->getItem()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vkontakte/android/audio/MusicTrack;

    invoke-interface {v2, v3, v1}, Lcom/vk/music/model/RecommendedModel;->playSection(Lcom/vk/music/dto/Section;Lcom/vkontakte/android/audio/MusicTrack;)V

    .line 319
    :cond_0
    :goto_0
    return-void

    .line 308
    :pswitch_0
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Lcom/vkontakte/android/utils/Utils;->castToActivity(Landroid/content/Context;)Landroid/app/Activity;

    move-result-object v0

    .line 309
    .local v0, "act":Landroid/app/Activity;
    if-eqz v0, :cond_0

    .line 310
    new-instance v3, Lcom/vk/music/fragment/menu/AudioActionsBottomSheet$Builder;

    invoke-virtual {p0}, Lcom/vk/music/view/holders/SectionHolder$AudioHolder;->getItem()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vkontakte/android/audio/MusicTrack;

    iget-object v2, p0, Lcom/vk/music/view/holders/SectionHolder$AudioHolder;->adapter:Lcom/vk/music/view/holders/SectionHolder$Adapter;

    iget-object v4, v2, Lcom/vk/music/view/holders/SectionHolder$Adapter;->callback:Lcom/vk/music/fragment/menu/ActionsBottomSheet$Callback;

    iget-object v2, p0, Lcom/vk/music/view/holders/SectionHolder$AudioHolder;->recommendedModel:Lcom/vk/music/model/RecommendedModel;

    .line 311
    invoke-interface {v2}, Lcom/vk/music/model/RecommendedModel;->getMusicTrackModel()Lcom/vk/music/model/MusicTrackModel;

    move-result-object v5

    invoke-virtual {p0}, Lcom/vk/music/view/holders/SectionHolder$AudioHolder;->getItem()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/vkontakte/android/audio/MusicTrack;

    invoke-interface {v5, v2}, Lcom/vk/music/model/MusicTrackModel;->canAddAudio(Lcom/vkontakte/android/audio/MusicTrack;)Z

    move-result v5

    iget-object v2, p0, Lcom/vk/music/view/holders/SectionHolder$AudioHolder;->recommendedModel:Lcom/vk/music/model/RecommendedModel;

    .line 312
    invoke-interface {v2}, Lcom/vk/music/model/RecommendedModel;->getMusicTrackModel()Lcom/vk/music/model/MusicTrackModel;

    move-result-object v6

    invoke-virtual {p0}, Lcom/vk/music/view/holders/SectionHolder$AudioHolder;->getItem()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/vkontakte/android/audio/MusicTrack;

    invoke-interface {v6, v2}, Lcom/vk/music/model/MusicTrackModel;->canRemoveAudio(Lcom/vkontakte/android/audio/MusicTrack;)Z

    move-result v2

    invoke-direct {v3, v1, v4, v5, v2}, Lcom/vk/music/fragment/menu/AudioActionsBottomSheet$Builder;-><init>(Lcom/vkontakte/android/audio/MusicTrack;Lcom/vk/music/fragment/menu/ActionsBottomSheet$Callback;ZZ)V

    .line 313
    invoke-virtual {v3, v0}, Lcom/vk/music/fragment/menu/AudioActionsBottomSheet$Builder;->show(Landroid/app/Activity;)V

    goto :goto_0

    .line 306
    :pswitch_data_0
    .packed-switch 0x7f1003bf
        :pswitch_0
    .end packed-switch
.end method

.method updatePlayingState()V
    .locals 5

    .prologue
    const/16 v4, 0x8

    const/4 v3, 0x0

    .line 294
    iget-object v1, p0, Lcom/vk/music/view/holders/SectionHolder$AudioHolder;->recommendedModel:Lcom/vk/music/model/RecommendedModel;

    invoke-interface {v1}, Lcom/vk/music/model/RecommendedModel;->getPlayerModel()Lcom/vk/music/model/PlayerModel;

    move-result-object v0

    .line 295
    .local v0, "playerModel":Lcom/vk/music/model/PlayerModel;
    iget-object v1, p0, Lcom/vk/music/view/holders/SectionHolder$AudioHolder;->item:Ljava/lang/Object;

    invoke-interface {v0}, Lcom/vk/music/model/PlayerModel;->getPlayingTrack()Lcom/vkontakte/android/audio/MusicTrack;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/vkontakte/android/utils/Utils;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 296
    iget-object v1, p0, Lcom/vk/music/view/holders/SectionHolder$AudioHolder;->playingIndicator:Landroid/widget/ImageView;

    invoke-virtual {v1, v3}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 297
    iget-object v1, p0, Lcom/vk/music/view/holders/SectionHolder$AudioHolder;->playingIndicator:Landroid/widget/ImageView;

    invoke-interface {v0}, Lcom/vk/music/model/PlayerModel;->isPlayerPlaying()Z

    move-result v2

    invoke-virtual {v1, v2}, Landroid/widget/ImageView;->setActivated(Z)V

    .line 302
    :cond_0
    :goto_0
    return-void

    .line 298
    :cond_1
    iget-object v1, p0, Lcom/vk/music/view/holders/SectionHolder$AudioHolder;->playingIndicator:Landroid/widget/ImageView;

    invoke-virtual {v1}, Landroid/widget/ImageView;->getVisibility()I

    move-result v1

    if-eq v1, v4, :cond_0

    .line 299
    iget-object v1, p0, Lcom/vk/music/view/holders/SectionHolder$AudioHolder;->playingIndicator:Landroid/widget/ImageView;

    invoke-virtual {v1, v4}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 300
    iget-object v1, p0, Lcom/vk/music/view/holders/SectionHolder$AudioHolder;->playingIndicator:Landroid/widget/ImageView;

    invoke-virtual {v1, v3}, Landroid/widget/ImageView;->setActivated(Z)V

    goto :goto_0
.end method

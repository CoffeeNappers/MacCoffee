.class Lcom/vkontakte/android/ui/widget/MenuListView$2;
.super Lcom/vkontakte/android/audio/player/PlayerListener$PlayerListenerAdapter;
.source "MenuListView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/ui/widget/MenuListView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/ui/widget/MenuListView;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/ui/widget/MenuListView;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/ui/widget/MenuListView;

    .prologue
    .line 201
    iput-object p1, p0, Lcom/vkontakte/android/ui/widget/MenuListView$2;->this$0:Lcom/vkontakte/android/ui/widget/MenuListView;

    invoke-direct {p0}, Lcom/vkontakte/android/audio/player/PlayerListener$PlayerListenerAdapter;-><init>()V

    return-void
.end method


# virtual methods
.method public onBufferingProgress(Lcom/vkontakte/android/audio/player/TrackInfo;)V
    .locals 0
    .param p1, "trackInfo"    # Lcom/vkontakte/android/audio/player/TrackInfo;

    .prologue
    .line 243
    return-void
.end method

.method public onProgress(Lcom/vkontakte/android/audio/player/TrackInfo;)V
    .locals 2
    .param p1, "trackInfo"    # Lcom/vkontakte/android/audio/player/TrackInfo;

    .prologue
    .line 247
    iget-object v0, p0, Lcom/vkontakte/android/ui/widget/MenuListView$2;->this$0:Lcom/vkontakte/android/ui/widget/MenuListView;

    invoke-static {v0}, Lcom/vkontakte/android/ui/widget/MenuListView;->access$400(Lcom/vkontakte/android/ui/widget/MenuListView;)Landroid/widget/ProgressBar;

    move-result-object v0

    invoke-virtual {p1}, Lcom/vkontakte/android/audio/player/TrackInfo;->getPositionPercent()I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/ProgressBar;->setProgress(I)V

    .line 248
    return-void
.end method

.method public onStateChanged(Lcom/vkontakte/android/audio/player/PlayerState;Lcom/vkontakte/android/audio/player/TrackInfo;)V
    .locals 8
    .param p1, "state"    # Lcom/vkontakte/android/audio/player/PlayerState;
    .param p2, "trackInfo"    # Lcom/vkontakte/android/audio/player/TrackInfo;

    .prologue
    const/16 v4, 0x8

    const/4 v6, 0x1

    .line 204
    sget-object v3, Lcom/vkontakte/android/audio/player/PlayerState;->STOPPED:Lcom/vkontakte/android/audio/player/PlayerState;

    if-eq p1, v3, :cond_a

    sget-object v3, Lcom/vkontakte/android/audio/player/PlayerState;->IDLE:Lcom/vkontakte/android/audio/player/PlayerState;

    if-eq p1, v3, :cond_a

    .line 206
    iget-object v3, p0, Lcom/vkontakte/android/ui/widget/MenuListView$2;->this$0:Lcom/vkontakte/android/ui/widget/MenuListView;

    invoke-static {v3}, Lcom/vkontakte/android/ui/widget/MenuListView;->access$400(Lcom/vkontakte/android/ui/widget/MenuListView;)Landroid/widget/ProgressBar;

    move-result-object v3

    if-eqz v3, :cond_7

    invoke-virtual {p2}, Lcom/vkontakte/android/audio/player/TrackInfo;->isContentMode()Z

    move-result v3

    if-eqz v3, :cond_7

    .line 207
    iget-object v3, p0, Lcom/vkontakte/android/ui/widget/MenuListView$2;->this$0:Lcom/vkontakte/android/ui/widget/MenuListView;

    invoke-static {v3}, Lcom/vkontakte/android/ui/widget/MenuListView;->access$400(Lcom/vkontakte/android/ui/widget/MenuListView;)Landroid/widget/ProgressBar;

    move-result-object v3

    iget-object v4, p0, Lcom/vkontakte/android/ui/widget/MenuListView$2;->this$0:Lcom/vkontakte/android/ui/widget/MenuListView;

    invoke-static {v4}, Lcom/vkontakte/android/ui/widget/MenuListView;->access$400(Lcom/vkontakte/android/ui/widget/MenuListView;)Landroid/widget/ProgressBar;

    move-result-object v4

    invoke-virtual {v4}, Landroid/widget/ProgressBar;->getContext()Landroid/content/Context;

    move-result-object v4

    const v5, 0x7f020128

    invoke-static {v4, v5}, Lcom/vkontakte/android/ViewUtils;->getDrawable(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/widget/ProgressBar;->setProgressDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 212
    :cond_0
    :goto_0
    iget-object v3, p0, Lcom/vkontakte/android/ui/widget/MenuListView$2;->this$0:Lcom/vkontakte/android/ui/widget/MenuListView;

    invoke-static {v3}, Lcom/vkontakte/android/ui/widget/MenuListView;->access$500(Lcom/vkontakte/android/ui/widget/MenuListView;)Landroid/view/View;

    move-result-object v3

    invoke-virtual {v3}, Landroid/view/View;->getVisibility()I

    move-result v3

    if-eqz v3, :cond_1

    .line 213
    iget-object v3, p0, Lcom/vkontakte/android/ui/widget/MenuListView$2;->this$0:Lcom/vkontakte/android/ui/widget/MenuListView;

    invoke-static {v3}, Lcom/vkontakte/android/ui/widget/MenuListView;->access$500(Lcom/vkontakte/android/ui/widget/MenuListView;)Landroid/view/View;

    move-result-object v3

    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Landroid/view/View;->setVisibility(I)V

    .line 214
    iget-object v3, p0, Lcom/vkontakte/android/ui/widget/MenuListView$2;->this$0:Lcom/vkontakte/android/ui/widget/MenuListView;

    invoke-static {v3}, Lcom/vkontakte/android/ui/widget/MenuListView;->access$600(Lcom/vkontakte/android/ui/widget/MenuListView;)V

    .line 215
    iget-object v3, p0, Lcom/vkontakte/android/ui/widget/MenuListView$2;->this$0:Lcom/vkontakte/android/ui/widget/MenuListView;

    invoke-virtual {v3}, Lcom/vkontakte/android/ui/widget/MenuListView;->updateList()V

    .line 217
    :cond_1
    invoke-virtual {p2}, Lcom/vkontakte/android/audio/player/TrackInfo;->hasTrack()Z

    move-result v3

    if-eqz v3, :cond_4

    .line 218
    iget-object v3, p0, Lcom/vkontakte/android/ui/widget/MenuListView$2;->this$0:Lcom/vkontakte/android/ui/widget/MenuListView;

    invoke-static {v3}, Lcom/vkontakte/android/ui/widget/MenuListView;->access$500(Lcom/vkontakte/android/ui/widget/MenuListView;)Landroid/view/View;

    move-result-object v3

    const v4, 0x7f100399

    invoke-virtual {v3, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    .line 219
    .local v0, "artist":Landroid/widget/TextView;
    iget-object v3, p0, Lcom/vkontakte/android/ui/widget/MenuListView$2;->this$0:Lcom/vkontakte/android/ui/widget/MenuListView;

    invoke-static {v3}, Lcom/vkontakte/android/ui/widget/MenuListView;->access$500(Lcom/vkontakte/android/ui/widget/MenuListView;)Landroid/view/View;

    move-result-object v3

    const v4, 0x7f100398

    invoke-virtual {v3, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    .line 220
    .local v2, "title":Landroid/widget/TextView;
    invoke-virtual {p2}, Lcom/vkontakte/android/audio/player/TrackInfo;->isContentMode()Z

    move-result v3

    if-eqz v3, :cond_8

    const/4 v1, 0x0

    .line 221
    .local v1, "subtitle":Ljava/lang/String;
    :goto_1
    invoke-virtual {v0}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_2

    .line 222
    invoke-static {v0, v1, v6}, Lcom/vkontakte/android/ViewUtils;->setText(Landroid/widget/TextView;Ljava/lang/Object;Z)V

    .line 224
    :cond_2
    invoke-virtual {v2}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v3

    invoke-virtual {p2}, Lcom/vkontakte/android/audio/player/TrackInfo;->getTitle()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_3

    .line 225
    invoke-virtual {p2}, Lcom/vkontakte/android/audio/player/TrackInfo;->getTitle()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3, v6}, Lcom/vkontakte/android/ViewUtils;->setText(Landroid/widget/TextView;Ljava/lang/Object;Z)V

    .line 227
    :cond_3
    iget-object v3, p0, Lcom/vkontakte/android/ui/widget/MenuListView$2;->this$0:Lcom/vkontakte/android/ui/widget/MenuListView;

    invoke-virtual {p2}, Lcom/vkontakte/android/audio/player/TrackInfo;->getTrack()Lcom/vkontakte/android/audio/player/PlayerTrack;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/vkontakte/android/ui/widget/MenuListView;->access$700(Lcom/vkontakte/android/ui/widget/MenuListView;Lcom/vkontakte/android/audio/MusicTrack;)V

    .line 229
    .end local v0    # "artist":Landroid/widget/TextView;
    .end local v1    # "subtitle":Ljava/lang/String;
    .end local v2    # "title":Landroid/widget/TextView;
    :cond_4
    iget-object v3, p0, Lcom/vkontakte/android/ui/widget/MenuListView$2;->this$0:Lcom/vkontakte/android/ui/widget/MenuListView;

    invoke-static {v3}, Lcom/vkontakte/android/ui/widget/MenuListView;->access$800(Lcom/vkontakte/android/ui/widget/MenuListView;)Lcom/vkontakte/android/audio/player/PlayerState;

    move-result-object v3

    if-ne v3, p1, :cond_5

    iget-object v3, p0, Lcom/vkontakte/android/ui/widget/MenuListView$2;->this$0:Lcom/vkontakte/android/ui/widget/MenuListView;

    invoke-static {v3}, Lcom/vkontakte/android/ui/widget/MenuListView;->access$800(Lcom/vkontakte/android/ui/widget/MenuListView;)Lcom/vkontakte/android/audio/player/PlayerState;

    move-result-object v3

    if-nez v3, :cond_6

    .line 230
    :cond_5
    iget-object v3, p0, Lcom/vkontakte/android/ui/widget/MenuListView$2;->this$0:Lcom/vkontakte/android/ui/widget/MenuListView;

    invoke-static {v3, p1}, Lcom/vkontakte/android/ui/widget/MenuListView;->access$802(Lcom/vkontakte/android/ui/widget/MenuListView;Lcom/vkontakte/android/audio/player/PlayerState;)Lcom/vkontakte/android/audio/player/PlayerState;

    .line 231
    iget-object v3, p0, Lcom/vkontakte/android/ui/widget/MenuListView$2;->this$0:Lcom/vkontakte/android/ui/widget/MenuListView;

    invoke-static {v3}, Lcom/vkontakte/android/ui/widget/MenuListView;->access$500(Lcom/vkontakte/android/ui/widget/MenuListView;)Landroid/view/View;

    move-result-object v3

    const v4, 0x7f100397

    invoke-virtual {v3, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/ImageView;

    new-instance v5, Lcom/vkontakte/android/ui/drawable/RecoloredDrawable;

    iget-object v4, p0, Lcom/vkontakte/android/ui/widget/MenuListView$2;->this$0:Lcom/vkontakte/android/ui/widget/MenuListView;

    invoke-virtual {v4}, Lcom/vkontakte/android/ui/widget/MenuListView;->getResources()Landroid/content/res/Resources;

    move-result-object v6

    sget-object v4, Lcom/vkontakte/android/audio/player/PlayerState;->PLAYING:Lcom/vkontakte/android/audio/player/PlayerState;

    if-ne p1, v4, :cond_9

    const v4, 0x7f0201f4

    :goto_2
    invoke-virtual {v6, v4}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v4

    iget-object v6, p0, Lcom/vkontakte/android/ui/widget/MenuListView$2;->this$0:Lcom/vkontakte/android/ui/widget/MenuListView;

    invoke-virtual {v6}, Lcom/vkontakte/android/ui/widget/MenuListView;->getResources()Landroid/content/res/Resources;

    move-result-object v6

    const v7, 0x7f0f0119

    invoke-virtual {v6, v7}, Landroid/content/res/Resources;->getColor(I)I

    move-result v6

    invoke-direct {v5, v4, v6}, Lcom/vkontakte/android/ui/drawable/RecoloredDrawable;-><init>(Landroid/graphics/drawable/Drawable;I)V

    invoke-virtual {v3, v5}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 232
    iget-object v3, p0, Lcom/vkontakte/android/ui/widget/MenuListView$2;->this$0:Lcom/vkontakte/android/ui/widget/MenuListView;

    invoke-virtual {v3}, Lcom/vkontakte/android/ui/widget/MenuListView;->postInvalidate()V

    .line 238
    :cond_6
    :goto_3
    return-void

    .line 208
    :cond_7
    iget-object v3, p0, Lcom/vkontakte/android/ui/widget/MenuListView$2;->this$0:Lcom/vkontakte/android/ui/widget/MenuListView;

    invoke-static {v3}, Lcom/vkontakte/android/ui/widget/MenuListView;->access$400(Lcom/vkontakte/android/ui/widget/MenuListView;)Landroid/widget/ProgressBar;

    move-result-object v3

    if-eqz v3, :cond_0

    .line 209
    iget-object v3, p0, Lcom/vkontakte/android/ui/widget/MenuListView$2;->this$0:Lcom/vkontakte/android/ui/widget/MenuListView;

    invoke-static {v3}, Lcom/vkontakte/android/ui/widget/MenuListView;->access$400(Lcom/vkontakte/android/ui/widget/MenuListView;)Landroid/widget/ProgressBar;

    move-result-object v3

    iget-object v4, p0, Lcom/vkontakte/android/ui/widget/MenuListView$2;->this$0:Lcom/vkontakte/android/ui/widget/MenuListView;

    invoke-static {v4}, Lcom/vkontakte/android/ui/widget/MenuListView;->access$400(Lcom/vkontakte/android/ui/widget/MenuListView;)Landroid/widget/ProgressBar;

    move-result-object v4

    invoke-virtual {v4}, Landroid/widget/ProgressBar;->getContext()Landroid/content/Context;

    move-result-object v4

    const v5, 0x7f020129

    invoke-static {v4, v5}, Lcom/vkontakte/android/ViewUtils;->getDrawable(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/widget/ProgressBar;->setProgressDrawable(Landroid/graphics/drawable/Drawable;)V

    goto/16 :goto_0

    .line 220
    .restart local v0    # "artist":Landroid/widget/TextView;
    .restart local v2    # "title":Landroid/widget/TextView;
    :cond_8
    invoke-virtual {p2}, Lcom/vkontakte/android/audio/player/TrackInfo;->getSubTitle()Ljava/lang/String;

    move-result-object v1

    goto/16 :goto_1

    .line 231
    .end local v0    # "artist":Landroid/widget/TextView;
    .end local v2    # "title":Landroid/widget/TextView;
    :cond_9
    const v4, 0x7f0201f6

    goto :goto_2

    .line 234
    :cond_a
    iget-object v3, p0, Lcom/vkontakte/android/ui/widget/MenuListView$2;->this$0:Lcom/vkontakte/android/ui/widget/MenuListView;

    invoke-static {v3}, Lcom/vkontakte/android/ui/widget/MenuListView;->access$500(Lcom/vkontakte/android/ui/widget/MenuListView;)Landroid/view/View;

    move-result-object v3

    invoke-virtual {v3}, Landroid/view/View;->getVisibility()I

    move-result v3

    if-eq v3, v4, :cond_6

    .line 235
    iget-object v3, p0, Lcom/vkontakte/android/ui/widget/MenuListView$2;->this$0:Lcom/vkontakte/android/ui/widget/MenuListView;

    invoke-static {v3}, Lcom/vkontakte/android/ui/widget/MenuListView;->access$500(Lcom/vkontakte/android/ui/widget/MenuListView;)Landroid/view/View;

    move-result-object v3

    invoke-virtual {v3, v4}, Landroid/view/View;->setVisibility(I)V

    .line 236
    iget-object v3, p0, Lcom/vkontakte/android/ui/widget/MenuListView$2;->this$0:Lcom/vkontakte/android/ui/widget/MenuListView;

    invoke-static {v3}, Lcom/vkontakte/android/ui/widget/MenuListView;->access$600(Lcom/vkontakte/android/ui/widget/MenuListView;)V

    goto :goto_3
.end method

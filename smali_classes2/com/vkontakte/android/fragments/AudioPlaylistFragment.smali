.class public Lcom/vkontakte/android/fragments/AudioPlaylistFragment;
.super Landroid/app/DialogFragment;
.source "AudioPlaylistFragment.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vkontakte/android/fragments/AudioPlaylistFragment$DragController;,
        Lcom/vkontakte/android/fragments/AudioPlaylistFragment$AudioViewHolder;,
        Lcom/vkontakte/android/fragments/AudioPlaylistFragment$AudioListAdapter;
    }
.end annotation


# instance fields
.field private final adapter:Lcom/vkontakte/android/fragments/AudioPlaylistFragment$AudioListAdapter;

.field private animatingTransitionOut:Z

.field private files:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vkontakte/android/audio/player/PlayerTrack;",
            ">;"
        }
    .end annotation
.end field

.field private list:Lme/grishka/appkit/views/UsableRecyclerView;

.field private nowPlaying:Lcom/vkontakte/android/audio/MusicTrack;

.field private playerListener:Lcom/vkontakte/android/audio/player/PlayerListener;

.field private receiver:Landroid/content/BroadcastReceiver;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 59
    invoke-direct {p0}, Landroid/app/DialogFragment;-><init>()V

    .line 62
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/fragments/AudioPlaylistFragment;->files:Ljava/util/ArrayList;

    .line 63
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/vkontakte/android/fragments/AudioPlaylistFragment;->animatingTransitionOut:Z

    .line 64
    new-instance v0, Lcom/vkontakte/android/fragments/AudioPlaylistFragment$AudioListAdapter;

    invoke-direct {v0, p0}, Lcom/vkontakte/android/fragments/AudioPlaylistFragment$AudioListAdapter;-><init>(Lcom/vkontakte/android/fragments/AudioPlaylistFragment;)V

    iput-object v0, p0, Lcom/vkontakte/android/fragments/AudioPlaylistFragment;->adapter:Lcom/vkontakte/android/fragments/AudioPlaylistFragment$AudioListAdapter;

    .line 67
    new-instance v0, Lcom/vkontakte/android/fragments/AudioPlaylistFragment$1;

    invoke-direct {v0, p0}, Lcom/vkontakte/android/fragments/AudioPlaylistFragment$1;-><init>(Lcom/vkontakte/android/fragments/AudioPlaylistFragment;)V

    iput-object v0, p0, Lcom/vkontakte/android/fragments/AudioPlaylistFragment;->playerListener:Lcom/vkontakte/android/audio/player/PlayerListener;

    .line 74
    new-instance v0, Lcom/vkontakte/android/fragments/AudioPlaylistFragment$2;

    invoke-direct {v0, p0}, Lcom/vkontakte/android/fragments/AudioPlaylistFragment$2;-><init>(Lcom/vkontakte/android/fragments/AudioPlaylistFragment;)V

    iput-object v0, p0, Lcom/vkontakte/android/fragments/AudioPlaylistFragment;->receiver:Landroid/content/BroadcastReceiver;

    return-void
.end method

.method static synthetic access$000(Lcom/vkontakte/android/fragments/AudioPlaylistFragment;)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/AudioPlaylistFragment;

    .prologue
    .line 59
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/AudioPlaylistFragment;->syncPlayList()V

    return-void
.end method

.method static synthetic access$100(Lcom/vkontakte/android/fragments/AudioPlaylistFragment;)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/AudioPlaylistFragment;

    .prologue
    .line 59
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/AudioPlaylistFragment;->update()V

    return-void
.end method

.method static synthetic access$300(Lcom/vkontakte/android/fragments/AudioPlaylistFragment;)Z
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/AudioPlaylistFragment;

    .prologue
    .line 59
    iget-boolean v0, p0, Lcom/vkontakte/android/fragments/AudioPlaylistFragment;->animatingTransitionOut:Z

    return v0
.end method

.method static synthetic access$302(Lcom/vkontakte/android/fragments/AudioPlaylistFragment;Z)Z
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/AudioPlaylistFragment;
    .param p1, "x1"    # Z

    .prologue
    .line 59
    iput-boolean p1, p0, Lcom/vkontakte/android/fragments/AudioPlaylistFragment;->animatingTransitionOut:Z

    return p1
.end method

.method static synthetic access$400(Lcom/vkontakte/android/fragments/AudioPlaylistFragment;)Ljava/util/ArrayList;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/AudioPlaylistFragment;

    .prologue
    .line 59
    iget-object v0, p0, Lcom/vkontakte/android/fragments/AudioPlaylistFragment;->files:Ljava/util/ArrayList;

    return-object v0
.end method

.method static synthetic access$500(Lcom/vkontakte/android/fragments/AudioPlaylistFragment;)Lme/grishka/appkit/views/UsableRecyclerView;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/AudioPlaylistFragment;

    .prologue
    .line 59
    iget-object v0, p0, Lcom/vkontakte/android/fragments/AudioPlaylistFragment;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    return-object v0
.end method

.method static synthetic access$600(Lcom/vkontakte/android/fragments/AudioPlaylistFragment;)Lcom/vkontakte/android/fragments/AudioPlaylistFragment$AudioListAdapter;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/AudioPlaylistFragment;

    .prologue
    .line 59
    iget-object v0, p0, Lcom/vkontakte/android/fragments/AudioPlaylistFragment;->adapter:Lcom/vkontakte/android/fragments/AudioPlaylistFragment$AudioListAdapter;

    return-object v0
.end method

.method private animateStateTransition(IZ)V
    .locals 10
    .param p1, "item"    # I
    .param p2, "in"    # Z

    .prologue
    .line 252
    iget-object v5, p0, Lcom/vkontakte/android/fragments/AudioPlaylistFragment;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    if-nez v5, :cond_0

    const/4 v1, 0x0

    .line 253
    .local v1, "holder":Lme/grishka/appkit/views/UsableRecyclerView$ViewHolder;
    :goto_0
    if-nez v1, :cond_1

    .line 288
    :goto_1
    return-void

    .line 252
    .end local v1    # "holder":Lme/grishka/appkit/views/UsableRecyclerView$ViewHolder;
    :cond_0
    iget-object v5, p0, Lcom/vkontakte/android/fragments/AudioPlaylistFragment;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    invoke-virtual {v5, p1}, Lme/grishka/appkit/views/UsableRecyclerView;->findViewHolderForAdapterPosition(I)Lme/grishka/appkit/views/UsableRecyclerView$ViewHolder;

    move-result-object v1

    goto :goto_0

    .line 256
    .restart local v1    # "holder":Lme/grishka/appkit/views/UsableRecyclerView$ViewHolder;
    :cond_1
    iget-object v4, v1, Lme/grishka/appkit/views/UsableRecyclerView$ViewHolder;->itemView:Landroid/view/View;

    .line 257
    .local v4, "v":Landroid/view/View;
    const/high16 v5, 0x42000000    # 32.0f

    invoke-static {v5}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v2

    .line 258
    .local v2, "iconSize":I
    if-eqz p2, :cond_2

    .line 259
    const v5, 0x7f100212

    invoke-virtual {v4, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    const/4 v6, 0x0

    invoke-virtual {v5, v6}, Landroid/view/View;->setVisibility(I)V

    .line 260
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 261
    .local v0, "anims":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/animation/Animator;>;"
    const v5, 0x7f100212

    invoke-virtual {v4, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    const-string/jumbo v6, "translationX"

    const/4 v7, 0x2

    new-array v7, v7, [F

    const/4 v8, 0x0

    neg-int v9, v2

    int-to-float v9, v9

    aput v9, v7, v8

    const/4 v8, 0x1

    const/4 v9, 0x0

    aput v9, v7, v8

    invoke-static {v5, v6, v7}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    move-result-object v5

    const-wide/16 v6, 0xc8

    invoke-virtual {v5, v6, v7}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    move-result-object v5

    invoke-virtual {v0, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 262
    const v5, 0x7f100215

    invoke-virtual {v4, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    const-string/jumbo v6, "translationX"

    const/4 v7, 0x2

    new-array v7, v7, [F

    const/4 v8, 0x0

    neg-int v9, v2

    int-to-float v9, v9

    aput v9, v7, v8

    const/4 v8, 0x1

    const/4 v9, 0x0

    aput v9, v7, v8

    invoke-static {v5, v6, v7}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    move-result-object v5

    const-wide/16 v6, 0xc8

    invoke-virtual {v5, v6, v7}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    move-result-object v5

    invoke-virtual {v0, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 263
    const v5, 0x7f100212

    invoke-virtual {v4, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    const-string/jumbo v6, "alpha"

    const/4 v7, 0x2

    new-array v7, v7, [F

    fill-array-data v7, :array_0

    invoke-static {v5, v6, v7}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    move-result-object v5

    const-wide/16 v6, 0xc8

    invoke-virtual {v5, v6, v7}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    move-result-object v5

    invoke-virtual {v0, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 264
    const v5, 0x7f100212

    invoke-virtual {v4, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    const/4 v6, 0x1

    invoke-virtual {v5, v6}, Landroid/view/View;->setSelected(Z)V

    .line 265
    new-instance v3, Landroid/animation/AnimatorSet;

    invoke-direct {v3}, Landroid/animation/AnimatorSet;-><init>()V

    .line 266
    .local v3, "set":Landroid/animation/AnimatorSet;
    invoke-virtual {v3, v0}, Landroid/animation/AnimatorSet;->playTogether(Ljava/util/Collection;)V

    .line 267
    invoke-virtual {v3}, Landroid/animation/AnimatorSet;->start()V

    goto/16 :goto_1

    .line 269
    .end local v0    # "anims":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/animation/Animator;>;"
    .end local v3    # "set":Landroid/animation/AnimatorSet;
    :cond_2
    const/4 v5, 0x1

    iput-boolean v5, p0, Lcom/vkontakte/android/fragments/AudioPlaylistFragment;->animatingTransitionOut:Z

    .line 270
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 271
    .restart local v0    # "anims":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/animation/Animator;>;"
    const v5, 0x7f100212

    invoke-virtual {v4, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    const-string/jumbo v6, "translationX"

    const/4 v7, 0x1

    new-array v7, v7, [F

    const/4 v8, 0x0

    neg-int v9, v2

    int-to-float v9, v9

    aput v9, v7, v8

    invoke-static {v5, v6, v7}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    move-result-object v5

    const-wide/16 v6, 0xc8

    invoke-virtual {v5, v6, v7}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    move-result-object v5

    invoke-virtual {v0, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 272
    const v5, 0x7f100215

    invoke-virtual {v4, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    const-string/jumbo v6, "translationX"

    const/4 v7, 0x1

    new-array v7, v7, [F

    const/4 v8, 0x0

    neg-int v9, v2

    int-to-float v9, v9

    aput v9, v7, v8

    invoke-static {v5, v6, v7}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    move-result-object v5

    const-wide/16 v6, 0xc8

    invoke-virtual {v5, v6, v7}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    move-result-object v5

    invoke-virtual {v0, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 273
    const v5, 0x7f100212

    invoke-virtual {v4, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    const-string/jumbo v6, "alpha"

    const/4 v7, 0x1

    new-array v7, v7, [F

    const/4 v8, 0x0

    const/4 v9, 0x0

    aput v9, v7, v8

    invoke-static {v5, v6, v7}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    move-result-object v5

    const-wide/16 v6, 0xc8

    invoke-virtual {v5, v6, v7}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    move-result-object v5

    invoke-virtual {v0, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 274
    new-instance v3, Landroid/animation/AnimatorSet;

    invoke-direct {v3}, Landroid/animation/AnimatorSet;-><init>()V

    .line 275
    .restart local v3    # "set":Landroid/animation/AnimatorSet;
    invoke-virtual {v3, v0}, Landroid/animation/AnimatorSet;->playTogether(Ljava/util/Collection;)V

    .line 276
    new-instance v5, Lcom/vkontakte/android/fragments/AudioPlaylistFragment$5;

    invoke-direct {v5, p0, v4}, Lcom/vkontakte/android/fragments/AudioPlaylistFragment$5;-><init>(Lcom/vkontakte/android/fragments/AudioPlaylistFragment;Landroid/view/View;)V

    invoke-virtual {v3, v5}, Landroid/animation/AnimatorSet;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 286
    invoke-virtual {v3}, Landroid/animation/AnimatorSet;->start()V

    goto/16 :goto_1

    .line 263
    nop

    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method private syncPlayList()V
    .locals 18

    .prologue
    .line 84
    invoke-static {}, Lcom/vkontakte/android/audio/AudioFacade;->getCurrentTrack()Lcom/vkontakte/android/audio/player/PlayerTrack;

    move-result-object v4

    .line 85
    .local v4, "file":Lcom/vkontakte/android/audio/MusicTrack;
    if-eqz v4, :cond_0

    .line 86
    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/vkontakte/android/fragments/AudioPlaylistFragment;->nowPlaying:Lcom/vkontakte/android/audio/MusicTrack;

    if-eqz v11, :cond_1

    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/vkontakte/android/fragments/AudioPlaylistFragment;->nowPlaying:Lcom/vkontakte/android/audio/MusicTrack;

    iget v11, v11, Lcom/vkontakte/android/audio/MusicTrack;->oid:I

    int-to-long v14, v11

    const/16 v11, 0x20

    shl-long/2addr v14, v11

    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/vkontakte/android/fragments/AudioPlaylistFragment;->nowPlaying:Lcom/vkontakte/android/audio/MusicTrack;

    iget v11, v11, Lcom/vkontakte/android/audio/MusicTrack;->aid:I

    int-to-long v0, v11

    move-wide/from16 v16, v0

    or-long v12, v14, v16

    .line 87
    .local v12, "nowPlayingId":J
    :goto_0
    iget v11, v4, Lcom/vkontakte/android/audio/MusicTrack;->oid:I

    int-to-long v14, v11

    const/16 v11, 0x20

    shl-long/2addr v14, v11

    iget v11, v4, Lcom/vkontakte/android/audio/MusicTrack;->aid:I

    int-to-long v0, v11

    move-wide/from16 v16, v0

    or-long v6, v14, v16

    .line 88
    .local v6, "fileId":J
    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/vkontakte/android/fragments/AudioPlaylistFragment;->nowPlaying:Lcom/vkontakte/android/audio/MusicTrack;

    invoke-virtual {v4, v11}, Lcom/vkontakte/android/audio/MusicTrack;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_2

    .line 89
    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/vkontakte/android/fragments/AudioPlaylistFragment;->adapter:Lcom/vkontakte/android/fragments/AudioPlaylistFragment$AudioListAdapter;

    invoke-virtual {v11}, Lcom/vkontakte/android/fragments/AudioPlaylistFragment$AudioListAdapter;->notifyDataSetChanged()V

    .line 115
    .end local v6    # "fileId":J
    .end local v12    # "nowPlayingId":J
    :cond_0
    :goto_1
    return-void

    .line 86
    :cond_1
    const-wide/16 v12, 0x0

    goto :goto_0

    .line 91
    .restart local v6    # "fileId":J
    .restart local v12    # "nowPlayingId":J
    :cond_2
    const/4 v3, -0x1

    .local v3, "animOut":I
    const/4 v2, -0x1

    .line 92
    .local v2, "animIn":I
    const/4 v5, 0x0

    .line 93
    .local v5, "i":I
    const/4 v10, 0x0

    .local v10, "j":I
    :goto_2
    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/vkontakte/android/fragments/AudioPlaylistFragment;->adapter:Lcom/vkontakte/android/fragments/AudioPlaylistFragment$AudioListAdapter;

    invoke-virtual {v11}, Lcom/vkontakte/android/fragments/AudioPlaylistFragment$AudioListAdapter;->getItemCount()I

    move-result v11

    if-ge v10, v11, :cond_3

    .line 94
    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/vkontakte/android/fragments/AudioPlaylistFragment;->adapter:Lcom/vkontakte/android/fragments/AudioPlaylistFragment$AudioListAdapter;

    invoke-virtual {v11, v10}, Lcom/vkontakte/android/fragments/AudioPlaylistFragment$AudioListAdapter;->getItemId(I)J

    move-result-wide v8

    .line 95
    .local v8, "id":J
    cmp-long v11, v12, v8

    if-nez v11, :cond_5

    .line 96
    move v3, v5

    .line 101
    .end local v8    # "id":J
    :cond_3
    const/4 v5, 0x0

    .line 102
    const/4 v10, 0x0

    :goto_3
    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/vkontakte/android/fragments/AudioPlaylistFragment;->adapter:Lcom/vkontakte/android/fragments/AudioPlaylistFragment$AudioListAdapter;

    invoke-virtual {v11}, Lcom/vkontakte/android/fragments/AudioPlaylistFragment$AudioListAdapter;->getItemCount()I

    move-result v11

    if-ge v10, v11, :cond_4

    .line 103
    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/vkontakte/android/fragments/AudioPlaylistFragment;->adapter:Lcom/vkontakte/android/fragments/AudioPlaylistFragment$AudioListAdapter;

    invoke-virtual {v11, v10}, Lcom/vkontakte/android/fragments/AudioPlaylistFragment$AudioListAdapter;->getItemId(I)J

    move-result-wide v8

    .line 104
    .restart local v8    # "id":J
    cmp-long v11, v6, v8

    if-nez v11, :cond_6

    .line 105
    move v2, v5

    .line 110
    .end local v8    # "id":J
    :cond_4
    move-object/from16 v0, p0

    iput-object v4, v0, Lcom/vkontakte/android/fragments/AudioPlaylistFragment;->nowPlaying:Lcom/vkontakte/android/audio/MusicTrack;

    .line 111
    const/4 v11, 0x1

    move-object/from16 v0, p0

    invoke-direct {v0, v2, v11}, Lcom/vkontakte/android/fragments/AudioPlaylistFragment;->animateStateTransition(IZ)V

    .line 112
    const/4 v11, 0x0

    move-object/from16 v0, p0

    invoke-direct {v0, v3, v11}, Lcom/vkontakte/android/fragments/AudioPlaylistFragment;->animateStateTransition(IZ)V

    goto :goto_1

    .line 99
    .restart local v8    # "id":J
    :cond_5
    add-int/lit8 v5, v5, 0x1

    .line 93
    add-int/lit8 v10, v10, 0x1

    goto :goto_2

    .line 108
    :cond_6
    add-int/lit8 v5, v5, 0x1

    .line 102
    add-int/lit8 v10, v10, 0x1

    goto :goto_3
.end method

.method private update()V
    .locals 2

    .prologue
    .line 243
    invoke-static {}, Lcom/vkontakte/android/audio/AudioFacade;->getPlayerState()Lcom/vkontakte/android/audio/player/PlayerState;

    move-result-object v0

    sget-object v1, Lcom/vkontakte/android/audio/player/PlayerState;->IDLE:Lcom/vkontakte/android/audio/player/PlayerState;

    if-eq v0, v1, :cond_0

    .line 244
    iget-object v0, p0, Lcom/vkontakte/android/fragments/AudioPlaylistFragment;->files:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 245
    iget-object v0, p0, Lcom/vkontakte/android/fragments/AudioPlaylistFragment;->files:Ljava/util/ArrayList;

    invoke-static {}, Lcom/vkontakte/android/audio/AudioFacade;->getActualTrackList()Ljava/util/List;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 246
    iget-object v0, p0, Lcom/vkontakte/android/fragments/AudioPlaylistFragment;->adapter:Lcom/vkontakte/android/fragments/AudioPlaylistFragment$AudioListAdapter;

    invoke-virtual {v0}, Lcom/vkontakte/android/fragments/AudioPlaylistFragment$AudioListAdapter;->notifyDataSetChanged()V

    .line 248
    :cond_0
    return-void
.end method


# virtual methods
.method synthetic lambda$onCreateView$0(Landroid/view/View;)V
    .locals 0
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 166
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/AudioPlaylistFragment;->dismiss()V

    return-void
.end method

.method public onActivityCreated(Landroid/os/Bundle;)V
    .locals 1
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 141
    invoke-super {p0, p1}, Landroid/app/DialogFragment;->onActivityCreated(Landroid/os/Bundle;)V

    .line 142
    if-eqz p1, :cond_0

    .line 143
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/AudioPlaylistFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Activity;->getFragmentManager()Landroid/app/FragmentManager;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/FragmentManager;->beginTransaction()Landroid/app/FragmentTransaction;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/app/FragmentTransaction;->remove(Landroid/app/Fragment;)Landroid/app/FragmentTransaction;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/FragmentTransaction;->commit()I

    .line 145
    :cond_0
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 6
    .param p1, "b"    # Landroid/os/Bundle;

    .prologue
    const/4 v5, 0x1

    .line 118
    invoke-super {p0, p1}, Landroid/app/DialogFragment;->onCreate(Landroid/os/Bundle;)V

    .line 119
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/AudioPlaylistFragment;->update()V

    .line 120
    new-instance v0, Landroid/content/IntentFilter;

    invoke-direct {v0}, Landroid/content/IntentFilter;-><init>()V

    .line 121
    .local v0, "filter":Landroid/content/IntentFilter;
    sget-object v1, Lcom/vkontakte/android/audio/AudioFacade;->ACTION_USER_AUDIO_REMOVED:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 122
    sget-object v1, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    iget-object v2, p0, Lcom/vkontakte/android/fragments/AudioPlaylistFragment;->receiver:Landroid/content/BroadcastReceiver;

    const-string/jumbo v3, "com.vkontakte.android.permission.ACCESS_DATA"

    const/4 v4, 0x0

    invoke-virtual {v1, v2, v0, v3, v4}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;Ljava/lang/String;Landroid/os/Handler;)Landroid/content/Intent;

    .line 123
    invoke-static {}, Lcom/vkontakte/android/audio/AudioFacade;->getCurrentTrack()Lcom/vkontakte/android/audio/player/PlayerTrack;

    move-result-object v1

    iput-object v1, p0, Lcom/vkontakte/android/fragments/AudioPlaylistFragment;->nowPlaying:Lcom/vkontakte/android/audio/MusicTrack;

    .line 125
    iget-object v1, p0, Lcom/vkontakte/android/fragments/AudioPlaylistFragment;->playerListener:Lcom/vkontakte/android/audio/player/PlayerListener;

    invoke-static {v1, v5}, Lcom/vkontakte/android/audio/AudioFacade;->addPlayerListener(Lcom/vkontakte/android/audio/player/PlayerListener;Z)V

    .line 127
    const/4 v1, 0x0

    invoke-virtual {p0, v5, v1}, Lcom/vkontakte/android/fragments/AudioPlaylistFragment;->setStyle(II)V

    .line 128
    return-void
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 10
    .param p1, "inflater"    # Landroid/view/LayoutInflater;
    .param p2, "container"    # Landroid/view/ViewGroup;
    .param p3, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 149
    new-instance v5, Lme/grishka/appkit/views/UsableRecyclerView;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/AudioPlaylistFragment;->getActivity()Landroid/app/Activity;

    move-result-object v6

    invoke-direct {v5, v6}, Lme/grishka/appkit/views/UsableRecyclerView;-><init>(Landroid/content/Context;)V

    iput-object v5, p0, Lcom/vkontakte/android/fragments/AudioPlaylistFragment;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    .line 150
    iget-object v5, p0, Lcom/vkontakte/android/fragments/AudioPlaylistFragment;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    new-instance v6, Landroid/support/v7/widget/LinearLayoutManager;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/AudioPlaylistFragment;->getActivity()Landroid/app/Activity;

    move-result-object v7

    invoke-direct {v6, v7}, Landroid/support/v7/widget/LinearLayoutManager;-><init>(Landroid/content/Context;)V

    invoke-virtual {v5, v6}, Lme/grishka/appkit/views/UsableRecyclerView;->setLayoutManager(Landroid/support/v7/widget/RecyclerView$LayoutManager;)V

    .line 151
    iget-object v5, p0, Lcom/vkontakte/android/fragments/AudioPlaylistFragment;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    iget-object v6, p0, Lcom/vkontakte/android/fragments/AudioPlaylistFragment;->adapter:Lcom/vkontakte/android/fragments/AudioPlaylistFragment$AudioListAdapter;

    invoke-virtual {v5, v6}, Lme/grishka/appkit/views/UsableRecyclerView;->setAdapter(Landroid/support/v7/widget/RecyclerView$Adapter;)V

    .line 152
    iget-object v5, p0, Lcom/vkontakte/android/fragments/AudioPlaylistFragment;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    const/4 v6, 0x0

    const/high16 v7, 0x41000000    # 8.0f

    invoke-static {v7}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v7

    const/4 v8, 0x0

    const/high16 v9, 0x41000000    # 8.0f

    invoke-static {v9}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v9

    invoke-virtual {v5, v6, v7, v8, v9}, Lme/grishka/appkit/views/UsableRecyclerView;->setPadding(IIII)V

    .line 153
    iget-object v5, p0, Lcom/vkontakte/android/fragments/AudioPlaylistFragment;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    const/4 v6, 0x0

    invoke-virtual {v5, v6}, Lme/grishka/appkit/views/UsableRecyclerView;->setClipToPadding(Z)V

    .line 154
    new-instance v5, Landroid/support/v7/widget/helper/ItemTouchHelper;

    new-instance v6, Lcom/vkontakte/android/fragments/AudioPlaylistFragment$DragController;

    const/4 v7, 0x0

    invoke-direct {v6, p0, v7}, Lcom/vkontakte/android/fragments/AudioPlaylistFragment$DragController;-><init>(Lcom/vkontakte/android/fragments/AudioPlaylistFragment;Lcom/vkontakte/android/fragments/AudioPlaylistFragment$1;)V

    invoke-direct {v5, v6}, Landroid/support/v7/widget/helper/ItemTouchHelper;-><init>(Landroid/support/v7/widget/helper/ItemTouchHelper$Callback;)V

    iget-object v6, p0, Lcom/vkontakte/android/fragments/AudioPlaylistFragment;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    invoke-virtual {v5, v6}, Landroid/support/v7/widget/helper/ItemTouchHelper;->attachToRecyclerView(Landroid/support/v7/widget/RecyclerView;)V

    .line 156
    invoke-static {}, Lcom/vkontakte/android/audio/AudioFacade;->getActualTrackIndex()I

    move-result v1

    .line 157
    .local v1, "currentPosition":I
    if-ltz v1, :cond_0

    .line 158
    iget-object v5, p0, Lcom/vkontakte/android/fragments/AudioPlaylistFragment;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    invoke-virtual {v5}, Lme/grishka/appkit/views/UsableRecyclerView;->getLayoutManager()Landroid/support/v7/widget/RecyclerView$LayoutManager;

    move-result-object v5

    const/4 v6, 0x0

    add-int/lit8 v7, v1, -0x1

    invoke-static {v6, v7}, Ljava/lang/Math;->max(II)I

    move-result v6

    invoke-virtual {v5, v6}, Landroid/support/v7/widget/RecyclerView$LayoutManager;->scrollToPosition(I)V

    .line 161
    :cond_0
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/AudioPlaylistFragment;->getDialog()Landroid/app/Dialog;

    move-result-object v5

    const/4 v6, 0x1

    invoke-virtual {v5, v6}, Landroid/app/Dialog;->setCanceledOnTouchOutside(Z)V

    .line 163
    new-instance v4, Landroid/support/v7/widget/Toolbar;

    new-instance v5, Landroid/view/ContextThemeWrapper;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/AudioPlaylistFragment;->getActivity()Landroid/app/Activity;

    move-result-object v6

    const v7, 0x7f0b00cd

    invoke-direct {v5, v6, v7}, Landroid/view/ContextThemeWrapper;-><init>(Landroid/content/Context;I)V

    invoke-direct {v4, v5}, Landroid/support/v7/widget/Toolbar;-><init>(Landroid/content/Context;)V

    .line 164
    .local v4, "toolbar":Landroid/support/v7/widget/Toolbar;
    const v5, 0x7f0804f7

    invoke-virtual {v4, v5}, Landroid/support/v7/widget/Toolbar;->setTitle(I)V

    .line 165
    const v5, 0x7f02018a

    invoke-virtual {v4, v5}, Landroid/support/v7/widget/Toolbar;->setNavigationIcon(I)V

    .line 166
    invoke-static {p0}, Lcom/vkontakte/android/fragments/AudioPlaylistFragment$$Lambda$1;->lambdaFactory$(Lcom/vkontakte/android/fragments/AudioPlaylistFragment;)Landroid/view/View$OnClickListener;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/support/v7/widget/Toolbar;->setNavigationOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 167
    new-instance v0, Landroid/widget/LinearLayout;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/AudioPlaylistFragment;->getActivity()Landroid/app/Activity;

    move-result-object v5

    invoke-direct {v0, v5}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 168
    .local v0, "content":Landroid/widget/LinearLayout;
    const/4 v5, 0x1

    invoke-virtual {v0, v5}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 169
    invoke-virtual {v4}, Landroid/support/v7/widget/Toolbar;->getContext()Landroid/content/Context;

    move-result-object v5

    const/4 v6, 0x0

    const/4 v7, 0x1

    new-array v7, v7, [I

    const/4 v8, 0x0

    const v9, 0x7f01008e

    aput v9, v7, v8

    invoke-virtual {v5, v6, v7}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    move-result-object v3

    .line 170
    .local v3, "ta":Landroid/content/res/TypedArray;
    new-instance v5, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v6, -0x1

    const/4 v7, 0x0

    const/high16 v8, 0x42600000    # 56.0f

    invoke-static {v8}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v8

    invoke-virtual {v3, v7, v8}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v7

    invoke-direct {v5, v6, v7}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v0, v4, v5}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 171
    invoke-virtual {v3}, Landroid/content/res/TypedArray;->recycle()V

    .line 172
    new-instance v2, Landroid/view/View;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/AudioPlaylistFragment;->getActivity()Landroid/app/Activity;

    move-result-object v5

    invoke-direct {v2, v5}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 173
    .local v2, "sep":Landroid/view/View;
    const v5, -0x282727

    invoke-virtual {v2, v5}, Landroid/view/View;->setBackgroundColor(I)V

    .line 174
    new-instance v5, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v6, -0x1

    const/high16 v7, 0x3f000000    # 0.5f

    invoke-static {v7}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v7

    invoke-direct {v5, v6, v7}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v0, v2, v5}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 175
    iget-object v5, p0, Lcom/vkontakte/android/fragments/AudioPlaylistFragment;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    new-instance v6, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v7, -0x1

    const/4 v8, -0x1

    invoke-direct {v6, v7, v8}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v0, v5, v6}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 177
    sget v5, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v6, 0x15

    if-ge v5, v6, :cond_1

    .line 178
    invoke-virtual {v4}, Landroid/support/v7/widget/Toolbar;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v5

    new-instance v6, Lcom/vkontakte/android/fragments/AudioPlaylistFragment$3;

    invoke-direct {v6, p0, v4}, Lcom/vkontakte/android/fragments/AudioPlaylistFragment$3;-><init>(Lcom/vkontakte/android/fragments/AudioPlaylistFragment;Landroid/support/v7/widget/Toolbar;)V

    invoke-virtual {v5, v6}, Landroid/view/ViewTreeObserver;->addOnPreDrawListener(Landroid/view/ViewTreeObserver$OnPreDrawListener;)V

    .line 197
    :cond_1
    return-object v0
.end method

.method public onDestroy()V
    .locals 2

    .prologue
    .line 131
    invoke-super {p0}, Landroid/app/DialogFragment;->onDestroy()V

    .line 132
    iget-object v0, p0, Lcom/vkontakte/android/fragments/AudioPlaylistFragment;->playerListener:Lcom/vkontakte/android/audio/player/PlayerListener;

    invoke-static {v0}, Lcom/vkontakte/android/audio/AudioFacade;->removePlayerListener(Lcom/vkontakte/android/audio/player/PlayerListener;)V

    .line 134
    :try_start_0
    sget-object v0, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/AudioPlaylistFragment;->receiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {v0, v1}, Landroid/content/Context;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 138
    :goto_0
    return-void

    .line 135
    :catch_0
    move-exception v0

    goto :goto_0
.end method

.method public onDestroyView()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 237
    invoke-super {p0}, Landroid/app/DialogFragment;->onDestroyView()V

    .line 238
    iget-object v0, p0, Lcom/vkontakte/android/fragments/AudioPlaylistFragment;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    invoke-virtual {v0, v1}, Lme/grishka/appkit/views/UsableRecyclerView;->setAdapter(Landroid/support/v7/widget/RecyclerView$Adapter;)V

    .line 239
    iput-object v1, p0, Lcom/vkontakte/android/fragments/AudioPlaylistFragment;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    .line 240
    return-void
.end method

.method public onResume()V
    .locals 9

    .prologue
    const/4 v8, -0x1

    .line 201
    invoke-super {p0}, Landroid/app/DialogFragment;->onResume()V

    .line 202
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/AudioPlaylistFragment;->getDialog()Landroid/app/Dialog;

    move-result-object v0

    .line 203
    .local v0, "dlg":Landroid/app/Dialog;
    invoke-virtual {v0}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object v5

    const/4 v6, 0x0

    const/4 v7, 0x2

    invoke-virtual {v5, v6, v7}, Landroid/view/Window;->setFlags(II)V

    .line 204
    invoke-virtual {v0}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object v5

    invoke-virtual {v5}, Landroid/view/Window;->getAttributes()Landroid/view/WindowManager$LayoutParams;

    move-result-object v1

    .line 205
    .local v1, "lp":Landroid/view/WindowManager$LayoutParams;
    const/4 v5, 0x0

    iput v5, v1, Landroid/view/WindowManager$LayoutParams;->horizontalMargin:F

    .line 206
    new-instance v4, Landroid/graphics/Rect;

    invoke-direct {v4}, Landroid/graphics/Rect;-><init>()V

    .line 207
    .local v4, "r":Landroid/graphics/Rect;
    iget v5, v4, Landroid/graphics/Rect;->top:I

    iput v5, v1, Landroid/view/WindowManager$LayoutParams;->y:I

    .line 208
    const/16 v5, 0x11

    iput v5, v1, Landroid/view/WindowManager$LayoutParams;->gravity:I

    .line 209
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/AudioPlaylistFragment;->getActivity()Landroid/app/Activity;

    move-result-object v5

    invoke-static {v5}, Lcom/vk/core/util/Screen;->isTablet(Landroid/content/Context;)Z

    move-result v5

    if-eqz v5, :cond_1

    .line 210
    const/high16 v5, 0x43c40000    # 392.0f

    invoke-static {v5}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v5

    iput v5, v1, Landroid/view/WindowManager$LayoutParams;->width:I

    .line 211
    const/high16 v5, 0x44280000    # 672.0f

    invoke-static {v5}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v5

    iput v5, v1, Landroid/view/WindowManager$LayoutParams;->height:I

    .line 212
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/AudioPlaylistFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    invoke-virtual {v5}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v5

    iget v5, v5, Landroid/content/res/Configuration;->screenWidthDp:I

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/AudioPlaylistFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v6

    invoke-virtual {v6}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v6

    iget v6, v6, Landroid/content/res/Configuration;->screenHeightDp:I

    if-le v5, v6, :cond_0

    .line 213
    const/16 v5, 0x340

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/AudioPlaylistFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v6

    invoke-virtual {v6}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v6

    iget v6, v6, Landroid/content/res/Configuration;->screenWidthDp:I

    add-int/lit8 v6, v6, -0x20

    invoke-static {v5, v6}, Ljava/lang/Math;->min(II)I

    move-result v2

    .line 214
    .local v2, "pw":I
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/AudioPlaylistFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    invoke-virtual {v5}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v5

    iget v5, v5, Landroid/content/res/Configuration;->screenWidthDp:I

    sub-int/2addr v5, v2

    div-int/lit8 v5, v5, 0x2

    add-int/lit8 v3, v5, 0x20

    .line 216
    .local v3, "px":I
    int-to-float v5, v3

    invoke-static {v5}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v5

    iput v5, v1, Landroid/view/WindowManager$LayoutParams;->x:I

    .line 218
    const/16 v5, 0x15

    iput v5, v1, Landroid/view/WindowManager$LayoutParams;->gravity:I

    .line 224
    .end local v2    # "pw":I
    .end local v3    # "px":I
    :cond_0
    :goto_0
    invoke-virtual {v0}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object v5

    invoke-virtual {v5, v1}, Landroid/view/Window;->setAttributes(Landroid/view/WindowManager$LayoutParams;)V

    .line 225
    invoke-virtual {v0}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object v5

    new-instance v6, Lcom/vkontakte/android/fragments/AudioPlaylistFragment$4;

    invoke-virtual {v0}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object v7

    invoke-virtual {v7}, Landroid/view/Window;->getCallback()Landroid/view/Window$Callback;

    move-result-object v7

    invoke-direct {v6, p0, v7}, Lcom/vkontakte/android/fragments/AudioPlaylistFragment$4;-><init>(Lcom/vkontakte/android/fragments/AudioPlaylistFragment;Landroid/view/Window$Callback;)V

    invoke-virtual {v5, v6}, Landroid/view/Window;->setCallback(Landroid/view/Window$Callback;)V

    .line 234
    return-void

    .line 221
    :cond_1
    iput v8, v1, Landroid/view/WindowManager$LayoutParams;->width:I

    .line 222
    iput v8, v1, Landroid/view/WindowManager$LayoutParams;->height:I

    goto :goto_0
.end method

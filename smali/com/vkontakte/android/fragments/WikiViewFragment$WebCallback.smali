.class Lcom/vkontakte/android/fragments/WikiViewFragment$WebCallback;
.super Ljava/lang/Object;
.source "WikiViewFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/fragments/WikiViewFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "WebCallback"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/fragments/WikiViewFragment;


# direct methods
.method private constructor <init>(Lcom/vkontakte/android/fragments/WikiViewFragment;)V
    .locals 0

    .prologue
    .line 359
    iput-object p1, p0, Lcom/vkontakte/android/fragments/WikiViewFragment$WebCallback;->this$0:Lcom/vkontakte/android/fragments/WikiViewFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/vkontakte/android/fragments/WikiViewFragment;Lcom/vkontakte/android/fragments/WikiViewFragment$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/vkontakte/android/fragments/WikiViewFragment;
    .param p2, "x1"    # Lcom/vkontakte/android/fragments/WikiViewFragment$1;

    .prologue
    .line 359
    invoke-direct {p0, p1}, Lcom/vkontakte/android/fragments/WikiViewFragment$WebCallback;-><init>(Lcom/vkontakte/android/fragments/WikiViewFragment;)V

    return-void
.end method


# virtual methods
.method synthetic lambda$openPhotos$0([Ljava/lang/String;I)V
    .locals 10
    .param p1, "urls"    # [Ljava/lang/String;
    .param p2, "pos"    # I

    .prologue
    const/4 v7, 0x0

    .line 379
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 380
    .local v2, "photos":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/Photo;>;"
    array-length v8, p1

    move v6, v7

    :goto_0
    if-ge v6, v8, :cond_0

    aget-object v4, p1, v6

    .line 381
    .local v4, "url":Ljava/lang/String;
    new-instance v1, Lcom/vkontakte/android/Photo;

    invoke-direct {v1}, Lcom/vkontakte/android/Photo;-><init>()V

    .line 382
    .local v1, "p":Lcom/vkontakte/android/Photo;
    new-instance v0, Lcom/vkontakte/android/Photo$Image;

    invoke-direct {v0}, Lcom/vkontakte/android/Photo$Image;-><init>()V

    .line 383
    .local v0, "im":Lcom/vkontakte/android/Photo$Image;
    const/16 v9, 0x78

    iput-char v9, v0, Lcom/vkontakte/android/Photo$Image;->type:C

    .line 384
    const-string/jumbo v9, "\\|"

    invoke-virtual {v4, v9}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v3

    .line 385
    .local v3, "ss":[Ljava/lang/String;
    aget-object v9, v3, v7

    iput-object v9, v0, Lcom/vkontakte/android/Photo$Image;->url:Ljava/lang/String;

    .line 386
    iget-object v9, v1, Lcom/vkontakte/android/Photo;->sizes:Ljava/util/ArrayList;

    invoke-virtual {v9, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 387
    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 380
    add-int/lit8 v6, v6, 0x1

    goto :goto_0

    .line 390
    .end local v0    # "im":Lcom/vkontakte/android/Photo$Image;
    .end local v1    # "p":Lcom/vkontakte/android/Photo;
    .end local v3    # "ss":[Ljava/lang/String;
    .end local v4    # "url":Ljava/lang/String;
    :cond_0
    new-instance v5, Lcom/vkontakte/android/PhotoViewer;

    iget-object v6, p0, Lcom/vkontakte/android/fragments/WikiViewFragment$WebCallback;->this$0:Lcom/vkontakte/android/fragments/WikiViewFragment;

    invoke-virtual {v6}, Lcom/vkontakte/android/fragments/WikiViewFragment;->getActivity()Landroid/app/Activity;

    move-result-object v6

    new-instance v7, Lcom/vkontakte/android/fragments/WikiViewFragment$WebCallback$1;

    invoke-direct {v7, p0}, Lcom/vkontakte/android/fragments/WikiViewFragment$WebCallback$1;-><init>(Lcom/vkontakte/android/fragments/WikiViewFragment$WebCallback;)V

    invoke-direct {v5, v6, v2, p2, v7}, Lcom/vkontakte/android/PhotoViewer;-><init>(Landroid/app/Activity;Ljava/util/List;ILcom/vkontakte/android/PhotoViewer$PhotoViewerCallback;)V

    .line 411
    .local v5, "viewer":Lcom/vkontakte/android/PhotoViewer;
    invoke-virtual {v5}, Lcom/vkontakte/android/PhotoViewer;->show()V

    .line 412
    return-void
.end method

.method public openPage(II)V
    .locals 2
    .param p1, "oid"    # I
    .param p2, "pid"    # I
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    .prologue
    .line 373
    iget-object v0, p0, Lcom/vkontakte/android/fragments/WikiViewFragment$WebCallback;->this$0:Lcom/vkontakte/android/fragments/WikiViewFragment;

    const/4 v1, 0x1

    invoke-static {v0, p1, p2, v1}, Lcom/vkontakte/android/fragments/WikiViewFragment;->access$800(Lcom/vkontakte/android/fragments/WikiViewFragment;IIZ)V

    .line 374
    return-void
.end method

.method public openPhotos([Ljava/lang/String;I)V
    .locals 2
    .param p1, "urls"    # [Ljava/lang/String;
    .param p2, "pos"    # I
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    .prologue
    .line 378
    iget-object v0, p0, Lcom/vkontakte/android/fragments/WikiViewFragment$WebCallback;->this$0:Lcom/vkontakte/android/fragments/WikiViewFragment;

    invoke-virtual {v0}, Lcom/vkontakte/android/fragments/WikiViewFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-static {p0, p1, p2}, Lcom/vkontakte/android/fragments/WikiViewFragment$WebCallback$$Lambda$1;->lambdaFactory$(Lcom/vkontakte/android/fragments/WikiViewFragment$WebCallback;[Ljava/lang/String;I)Ljava/lang/Runnable;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 413
    return-void
.end method

.method public playAudio([I[I[Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;[II)V
    .locals 10
    .param p1, "oid"    # [I
    .param p2, "aid"    # [I
    .param p3, "artist"    # [Ljava/lang/String;
    .param p4, "title"    # [Ljava/lang/String;
    .param p5, "url"    # [Ljava/lang/String;
    .param p6, "duration"    # [I
    .param p7, "index"    # I
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    .prologue
    .line 363
    new-instance v9, Ljava/util/ArrayList;

    invoke-direct {v9}, Ljava/util/ArrayList;-><init>()V

    .line 364
    .local v9, "list":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/audio/MusicTrack;>;"
    const/4 v8, 0x0

    .local v8, "i":I
    :goto_0
    array-length v1, p1

    if-ge v8, v1, :cond_0

    .line 365
    new-instance v1, Lcom/vkontakte/android/audio/MusicTrack;

    aget v2, p2, v8

    aget v3, p1, v8

    aget-object v4, p3, v8

    aget-object v5, p4, v8

    aget v6, p6, v8

    aget-object v7, p5, v8

    invoke-direct/range {v1 .. v7}, Lcom/vkontakte/android/audio/MusicTrack;-><init>(IILjava/lang/String;Ljava/lang/String;ILjava/lang/String;)V

    invoke-virtual {v9, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 364
    add-int/lit8 v8, v8, 0x1

    goto :goto_0

    .line 367
    :cond_0
    sget-object v1, Lcom/vkontakte/android/audio/player/PlayerRefer;->none:Lcom/vkontakte/android/audio/player/PlayerRefer;

    const/4 v2, 0x1

    move/from16 v0, p7

    invoke-static {v9, v0, v1, v2}, Lcom/vkontakte/android/audio/AudioFacade;->playTracks(Ljava/util/Collection;ILcom/vkontakte/android/audio/player/PlayerRefer;Z)V

    .line 368
    invoke-static {}, Lcom/vkontakte/android/audio/AudioFacade;->showPlayer()V

    .line 369
    return-void
.end method

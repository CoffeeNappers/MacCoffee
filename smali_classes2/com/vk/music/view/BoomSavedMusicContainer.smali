.class public Lcom/vk/music/view/BoomSavedMusicContainer;
.super Landroid/widget/FrameLayout;
.source "BoomSavedMusicContainer.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 4
    .param p1, "context"    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 19
    invoke-direct {p0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 20
    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v1

    const v2, 0x7f03013d

    const/4 v3, 0x1

    invoke-virtual {v1, v2, p0, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 21
    const v1, 0x7f1003db

    invoke-virtual {p0, v1}, Lcom/vk/music/view/BoomSavedMusicContainer;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    .line 22
    .local v0, "textView":Landroid/widget/TextView;
    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 23
    invoke-static {p1}, Lcom/vk/music/utils/BoomHelper;->isBoomInstalled(Landroid/content/Context;)Z

    move-result v1

    if-eqz v1, :cond_0

    const v1, 0x7f0803e3

    :goto_0
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    .line 28
    const v1, 0x7f1002bb

    invoke-virtual {p0, v1}, Lcom/vk/music/view/BoomSavedMusicContainer;->findViewById(I)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v1, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 29
    const v1, 0x7f1003d8

    invoke-virtual {p0, v1}, Lcom/vk/music/view/BoomSavedMusicContainer;->findViewById(I)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v1, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 31
    invoke-static {}, Lcom/vk/music/view/BoomSavedMusicContainer$$Lambda$1;->lambdaFactory$()Lcom/vkontakte/android/audio/AudioFacade$OnConnectionListener;

    move-result-object v1

    invoke-static {p1, v1}, Lcom/vkontakte/android/audio/AudioFacade;->bind(Landroid/content/Context;Lcom/vkontakte/android/audio/AudioFacade$OnConnectionListener;)V

    .line 33
    return-void

    .line 23
    :cond_0
    const v1, 0x7f0803e2

    goto :goto_0
.end method

.method static synthetic lambda$new$0()V
    .locals 0

    .prologue
    .line 32
    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 3
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 37
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v1

    sparse-switch v1, :sswitch_data_0

    .line 49
    :cond_0
    :goto_0
    return-void

    .line 39
    :sswitch_0
    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/String;

    invoke-static {v1}, Lcom/vkontakte/android/audio/AudioFacade;->removeSavedTrack([Ljava/lang/String;)V

    .line 41
    :sswitch_1
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Lcom/vkontakte/android/utils/Utils;->castToActivity(Landroid/content/Context;)Landroid/app/Activity;

    move-result-object v0

    .line 42
    .local v0, "activity":Landroid/app/Activity;
    if-eqz v0, :cond_0

    .line 43
    invoke-virtual {v0}, Landroid/app/Activity;->finish()V

    goto :goto_0

    .line 46
    .end local v0    # "activity":Landroid/app/Activity;
    :sswitch_2
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    sget-object v2, Lcom/vk/music/utils/BoomHelper$From;->cache:Lcom/vk/music/utils/BoomHelper$From;

    invoke-static {v1, v2}, Lcom/vk/music/utils/BoomHelper;->openBoom(Landroid/content/Context;Lcom/vk/music/utils/BoomHelper$From;)V

    goto :goto_0

    .line 37
    :sswitch_data_0
    .sparse-switch
        0x7f1002bb -> :sswitch_0
        0x7f1003d8 -> :sswitch_1
        0x7f1003db -> :sswitch_2
    .end sparse-switch
.end method

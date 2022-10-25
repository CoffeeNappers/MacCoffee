.class final Lcom/vk/music/view/PlaylistContainer$MusicWithoutNetCreatorBinder;
.super Ljava/lang/Object;
.source "PlaylistContainer.java"

# interfaces
.implements Lcom/vkontakte/android/functions/F1;
.implements Lcom/vkontakte/android/functions/VoidF;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vk/music/view/PlaylistContainer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
    name = "MusicWithoutNetCreatorBinder"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/vkontakte/android/functions/F1",
        "<",
        "Landroid/view/View;",
        "Landroid/view/ViewGroup;",
        ">;",
        "Lcom/vkontakte/android/functions/VoidF;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vk/music/view/PlaylistContainer;


# direct methods
.method private constructor <init>(Lcom/vk/music/view/PlaylistContainer;)V
    .locals 0

    .prologue
    .line 118
    iput-object p1, p0, Lcom/vk/music/view/PlaylistContainer$MusicWithoutNetCreatorBinder;->this$0:Lcom/vk/music/view/PlaylistContainer;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/vk/music/view/PlaylistContainer;Lcom/vk/music/view/PlaylistContainer$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/vk/music/view/PlaylistContainer;
    .param p2, "x1"    # Lcom/vk/music/view/PlaylistContainer$1;

    .prologue
    .line 118
    invoke-direct {p0, p1}, Lcom/vk/music/view/PlaylistContainer$MusicWithoutNetCreatorBinder;-><init>(Lcom/vk/music/view/PlaylistContainer;)V

    return-void
.end method

.method static synthetic lambda$f$0(Landroid/view/View;)V
    .locals 2
    .param p0, "v"    # Landroid/view/View;

    .prologue
    .line 127
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    sget-object v1, Lcom/vk/music/utils/BoomHelper$From;->cache:Lcom/vk/music/utils/BoomHelper$From;

    invoke-static {v0, v1}, Lcom/vk/music/utils/BoomHelper;->openBoom(Landroid/content/Context;Lcom/vk/music/utils/BoomHelper$From;)V

    return-void
.end method


# virtual methods
.method public f(Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 5
    .param p1, "group"    # Landroid/view/ViewGroup;

    .prologue
    .line 125
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-static {v2}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v2

    const v3, 0x7f0301ef

    const/4 v4, 0x0

    invoke-virtual {v2, v3, p1, v4}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v1

    .line 126
    .local v1, "view":Landroid/view/View;
    const v2, 0x7f10010f

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    .line 127
    .local v0, "button":Landroid/widget/TextView;
    invoke-static {}, Lcom/vk/music/view/PlaylistContainer$MusicWithoutNetCreatorBinder$$Lambda$1;->lambdaFactory$()Landroid/view/View$OnClickListener;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 128
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-static {v2}, Lcom/vk/music/utils/BoomHelper;->isBoomInstalled(Landroid/content/Context;)Z

    move-result v2

    if-eqz v2, :cond_0

    const v2, 0x7f0803e3

    :goto_0
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(I)V

    .line 131
    return-object v1

    .line 128
    :cond_0
    const v2, 0x7f0803e2

    goto :goto_0
.end method

.method public bridge synthetic f(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .prologue
    .line 118
    check-cast p1, Landroid/view/ViewGroup;

    invoke-virtual {p0, p1}, Lcom/vk/music/view/PlaylistContainer$MusicWithoutNetCreatorBinder;->f(Landroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    return-object v0
.end method

.method public f()V
    .locals 0

    .prologue
    .line 121
    return-void
.end method

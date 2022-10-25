.class public Lcom/vkontakte/android/ui/holder/gamepage/GameInfoHolder$AppAdapter$ViewHolder;
.super Lme/grishka/appkit/views/UsableRecyclerView$ViewHolder;
.source "GameInfoHolder.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/ui/holder/gamepage/GameInfoHolder$AppAdapter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "ViewHolder"
.end annotation


# instance fields
.field public imageView:Lcom/vk/imageloader/view/VKImageView;

.field final synthetic this$1:Lcom/vkontakte/android/ui/holder/gamepage/GameInfoHolder$AppAdapter;


# direct methods
.method public constructor <init>(Lcom/vkontakte/android/ui/holder/gamepage/GameInfoHolder$AppAdapter;Landroid/view/View;)V
    .locals 1
    .param p1, "this$1"    # Lcom/vkontakte/android/ui/holder/gamepage/GameInfoHolder$AppAdapter;
    .param p2, "v"    # Landroid/view/View;

    .prologue
    .line 162
    iput-object p1, p0, Lcom/vkontakte/android/ui/holder/gamepage/GameInfoHolder$AppAdapter$ViewHolder;->this$1:Lcom/vkontakte/android/ui/holder/gamepage/GameInfoHolder$AppAdapter;

    .line 163
    invoke-direct {p0, p2}, Lme/grishka/appkit/views/UsableRecyclerView$ViewHolder;-><init>(Landroid/view/View;)V

    .line 164
    const v0, 0x7f100124

    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/vk/imageloader/view/VKImageView;

    iput-object v0, p0, Lcom/vkontakte/android/ui/holder/gamepage/GameInfoHolder$AppAdapter$ViewHolder;->imageView:Lcom/vk/imageloader/view/VKImageView;

    .line 165
    return-void
.end method

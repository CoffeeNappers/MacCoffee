.class final Lcom/vk/music/view/TabbedMusicContainer$MusicPagerAdapter;
.super Landroid/support/v4/view/PagerAdapter;
.source "TabbedMusicContainer.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vk/music/view/TabbedMusicContainer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x10
    name = "MusicPagerAdapter"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vk/music/view/TabbedMusicContainer;


# direct methods
.method constructor <init>(Lcom/vk/music/view/TabbedMusicContainer;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vk/music/view/TabbedMusicContainer;

    .prologue
    .line 86
    iput-object p1, p0, Lcom/vk/music/view/TabbedMusicContainer$MusicPagerAdapter;->this$0:Lcom/vk/music/view/TabbedMusicContainer;

    invoke-direct {p0}, Landroid/support/v4/view/PagerAdapter;-><init>()V

    return-void
.end method


# virtual methods
.method public destroyItem(Landroid/view/ViewGroup;ILjava/lang/Object;)V
    .locals 0
    .param p1, "container"    # Landroid/view/ViewGroup;
    .param p2, "position"    # I
    .param p3, "object"    # Ljava/lang/Object;

    .prologue
    .line 112
    check-cast p3, Landroid/view/View;

    .end local p3    # "object":Ljava/lang/Object;
    invoke-virtual {p1, p3}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 113
    return-void
.end method

.method public getCount()I
    .locals 1

    .prologue
    .line 90
    const/4 v0, 0x2

    return v0
.end method

.method public instantiateItem(Landroid/view/ViewGroup;I)Ljava/lang/Object;
    .locals 2
    .param p1, "container"    # Landroid/view/ViewGroup;
    .param p2, "position"    # I

    .prologue
    .line 101
    if-nez p2, :cond_0

    .line 102
    iget-object v1, p0, Lcom/vk/music/view/TabbedMusicContainer$MusicPagerAdapter;->this$0:Lcom/vk/music/view/TabbedMusicContainer;

    iget-object v0, v1, Lcom/vk/music/view/TabbedMusicContainer;->musicContainer:Lcom/vk/music/view/MusicContainer;

    .line 106
    .local v0, "view":Landroid/view/View;
    :goto_0
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 107
    return-object v0

    .line 104
    .end local v0    # "view":Landroid/view/View;
    :cond_0
    iget-object v1, p0, Lcom/vk/music/view/TabbedMusicContainer$MusicPagerAdapter;->this$0:Lcom/vk/music/view/TabbedMusicContainer;

    iget-object v0, v1, Lcom/vk/music/view/TabbedMusicContainer;->recommendedContainer:Lcom/vk/music/view/RecommendedContainer;

    .restart local v0    # "view":Landroid/view/View;
    goto :goto_0
.end method

.method public isViewFromObject(Landroid/view/View;Ljava/lang/Object;)Z
    .locals 1
    .param p1, "view"    # Landroid/view/View;
    .param p2, "object"    # Ljava/lang/Object;

    .prologue
    .line 95
    if-ne p1, p2, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

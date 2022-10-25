.class Lcom/vk/music/view/TabbedMusicContainer$1;
.super Landroid/support/design/widget/TabLayout$ViewPagerOnTabSelectedListener;
.source "TabbedMusicContainer.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vk/music/view/TabbedMusicContainer;-><init>(Landroid/content/Context;Lcom/vk/music/model/TabbedMusicModel;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vk/music/view/TabbedMusicContainer;

.field final synthetic val$model:Lcom/vk/music/model/TabbedMusicModel;


# direct methods
.method constructor <init>(Lcom/vk/music/view/TabbedMusicContainer;Landroid/support/v4/view/ViewPager;Lcom/vk/music/model/TabbedMusicModel;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vk/music/view/TabbedMusicContainer;
    .param p2, "x0"    # Landroid/support/v4/view/ViewPager;

    .prologue
    .line 177
    iput-object p1, p0, Lcom/vk/music/view/TabbedMusicContainer$1;->this$0:Lcom/vk/music/view/TabbedMusicContainer;

    iput-object p3, p0, Lcom/vk/music/view/TabbedMusicContainer$1;->val$model:Lcom/vk/music/model/TabbedMusicModel;

    invoke-direct {p0, p2}, Landroid/support/design/widget/TabLayout$ViewPagerOnTabSelectedListener;-><init>(Landroid/support/v4/view/ViewPager;)V

    return-void
.end method


# virtual methods
.method public onTabSelected(Landroid/support/design/widget/TabLayout$Tab;)V
    .locals 2
    .param p1, "tab"    # Landroid/support/design/widget/TabLayout$Tab;

    .prologue
    .line 180
    invoke-super {p0, p1}, Landroid/support/design/widget/TabLayout$ViewPagerOnTabSelectedListener;->onTabSelected(Landroid/support/design/widget/TabLayout$Tab;)V

    .line 181
    iget-object v0, p0, Lcom/vk/music/view/TabbedMusicContainer$1;->val$model:Lcom/vk/music/model/TabbedMusicModel;

    invoke-virtual {p1}, Landroid/support/design/widget/TabLayout$Tab;->getPosition()I

    move-result v1

    invoke-static {v1}, Lcom/vk/music/view/TabbedMusicContainer;->access$000(I)I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/vk/music/model/TabbedMusicModel;->setPage(I)V

    .line 182
    return-void
.end method

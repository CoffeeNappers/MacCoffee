.class Lcom/vk/music/view/SearchContainer$2;
.super Landroid/support/design/widget/TabLayout$ViewPagerOnTabSelectedListener;
.source "SearchContainer.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vk/music/view/SearchContainer;-><init>(Landroid/content/Context;Lcom/vk/music/model/SearchModel;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vk/music/view/SearchContainer;

.field final synthetic val$model:Lcom/vk/music/model/SearchModel;


# direct methods
.method constructor <init>(Lcom/vk/music/view/SearchContainer;Landroid/support/v4/view/ViewPager;Lcom/vk/music/model/SearchModel;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vk/music/view/SearchContainer;
    .param p2, "x0"    # Landroid/support/v4/view/ViewPager;

    .prologue
    .line 248
    iput-object p1, p0, Lcom/vk/music/view/SearchContainer$2;->this$0:Lcom/vk/music/view/SearchContainer;

    iput-object p3, p0, Lcom/vk/music/view/SearchContainer$2;->val$model:Lcom/vk/music/model/SearchModel;

    invoke-direct {p0, p2}, Landroid/support/design/widget/TabLayout$ViewPagerOnTabSelectedListener;-><init>(Landroid/support/v4/view/ViewPager;)V

    return-void
.end method


# virtual methods
.method public onTabSelected(Landroid/support/design/widget/TabLayout$Tab;)V
    .locals 2
    .param p1, "tab"    # Landroid/support/design/widget/TabLayout$Tab;

    .prologue
    .line 251
    invoke-super {p0, p1}, Landroid/support/design/widget/TabLayout$ViewPagerOnTabSelectedListener;->onTabSelected(Landroid/support/design/widget/TabLayout$Tab;)V

    .line 252
    iget-object v0, p0, Lcom/vk/music/view/SearchContainer$2;->val$model:Lcom/vk/music/model/SearchModel;

    invoke-virtual {p1}, Landroid/support/design/widget/TabLayout$Tab;->getPosition()I

    move-result v1

    invoke-static {v1}, Lcom/vk/music/view/SearchContainer;->access$300(I)I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/vk/music/model/SearchModel;->setPage(I)V

    .line 253
    return-void
.end method

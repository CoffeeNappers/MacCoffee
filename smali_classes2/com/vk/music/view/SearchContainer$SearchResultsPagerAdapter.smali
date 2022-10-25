.class final Lcom/vk/music/view/SearchContainer$SearchResultsPagerAdapter;
.super Landroid/support/v4/view/PagerAdapter;
.source "SearchContainer.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vk/music/view/SearchContainer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
    name = "SearchResultsPagerAdapter"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vk/music/view/SearchContainer;


# direct methods
.method private constructor <init>(Lcom/vk/music/view/SearchContainer;)V
    .locals 0

    .prologue
    .line 101
    iput-object p1, p0, Lcom/vk/music/view/SearchContainer$SearchResultsPagerAdapter;->this$0:Lcom/vk/music/view/SearchContainer;

    invoke-direct {p0}, Landroid/support/v4/view/PagerAdapter;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/vk/music/view/SearchContainer;Lcom/vk/music/view/SearchContainer$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/vk/music/view/SearchContainer;
    .param p2, "x1"    # Lcom/vk/music/view/SearchContainer$1;

    .prologue
    .line 101
    invoke-direct {p0, p1}, Lcom/vk/music/view/SearchContainer$SearchResultsPagerAdapter;-><init>(Lcom/vk/music/view/SearchContainer;)V

    return-void
.end method


# virtual methods
.method public destroyItem(Landroid/view/ViewGroup;ILjava/lang/Object;)V
    .locals 0
    .param p1, "container"    # Landroid/view/ViewGroup;
    .param p2, "position"    # I
    .param p3, "object"    # Ljava/lang/Object;

    .prologue
    .line 129
    check-cast p3, Landroid/view/View;

    .end local p3    # "object":Ljava/lang/Object;
    invoke-virtual {p1, p3}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 130
    return-void
.end method

.method public getCount()I
    .locals 1

    .prologue
    .line 105
    const/4 v0, 0x2

    return v0
.end method

.method public instantiateItem(Landroid/view/ViewGroup;I)Ljava/lang/Object;
    .locals 2
    .param p1, "container"    # Landroid/view/ViewGroup;
    .param p2, "position"    # I

    .prologue
    .line 116
    if-nez p2, :cond_0

    .line 117
    iget-object v1, p0, Lcom/vk/music/view/SearchContainer$SearchResultsPagerAdapter;->this$0:Lcom/vk/music/view/SearchContainer;

    invoke-static {v1}, Lcom/vk/music/view/SearchContainer;->access$000(Lcom/vk/music/view/SearchContainer;)V

    .line 118
    iget-object v1, p0, Lcom/vk/music/view/SearchContainer$SearchResultsPagerAdapter;->this$0:Lcom/vk/music/view/SearchContainer;

    iget-object v0, v1, Lcom/vk/music/view/SearchContainer;->searchByTitleContainer:Lcom/vk/music/view/SearchResultContainer;

    .line 123
    .local v0, "view":Landroid/view/View;
    :goto_0
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 124
    return-object v0

    .line 120
    .end local v0    # "view":Landroid/view/View;
    :cond_0
    iget-object v1, p0, Lcom/vk/music/view/SearchContainer$SearchResultsPagerAdapter;->this$0:Lcom/vk/music/view/SearchContainer;

    invoke-static {v1}, Lcom/vk/music/view/SearchContainer;->access$100(Lcom/vk/music/view/SearchContainer;)V

    .line 121
    iget-object v1, p0, Lcom/vk/music/view/SearchContainer$SearchResultsPagerAdapter;->this$0:Lcom/vk/music/view/SearchContainer;

    iget-object v0, v1, Lcom/vk/music/view/SearchContainer;->searchByArtistContainer:Lcom/vk/music/view/SearchResultContainer;

    .restart local v0    # "view":Landroid/view/View;
    goto :goto_0
.end method

.method public isViewFromObject(Landroid/view/View;Ljava/lang/Object;)Z
    .locals 1
    .param p1, "view"    # Landroid/view/View;
    .param p2, "object"    # Ljava/lang/Object;

    .prologue
    .line 110
    if-ne p1, p2, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

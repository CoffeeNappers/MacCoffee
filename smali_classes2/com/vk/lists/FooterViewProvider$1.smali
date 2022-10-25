.class final Lcom/vk/lists/FooterViewProvider$1;
.super Ljava/lang/Object;
.source "FooterViewProvider.java"

# interfaces
.implements Lcom/vk/lists/FooterViewProvider;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vk/lists/FooterViewProvider;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 17
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public createFooterErrorView(Landroid/content/Context;)Lcom/vk/lists/AbstractErrorView;
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 34
    new-instance v0, Lcom/vk/lists/DefaultListErrorView;

    invoke-direct {v0, p1}, Lcom/vk/lists/DefaultListErrorView;-><init>(Landroid/content/Context;)V

    return-object v0
.end method

.method public createFooterLoadingView(Landroid/content/Context;)Landroid/view/View;
    .locals 3
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 29
    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    sget v1, Lcom/vk/lists/R$layout;->view_defaul_list_loading:I

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    return-object v0
.end method

.method public createFooterView(Landroid/content/Context;)Lcom/vk/lists/FooterView;
    .locals 4
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 20
    new-instance v0, Lcom/vk/lists/FooterView;

    invoke-direct {v0, p1}, Lcom/vk/lists/FooterView;-><init>(Landroid/content/Context;)V

    .line 21
    .local v0, "view":Lcom/vk/lists/FooterView;
    new-instance v1, Landroid/support/v7/widget/RecyclerView$LayoutParams;

    const/4 v2, -0x1

    const/4 v3, -0x2

    invoke-direct {v1, v2, v3}, Landroid/support/v7/widget/RecyclerView$LayoutParams;-><init>(II)V

    invoke-virtual {v0, v1}, Lcom/vk/lists/FooterView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 22
    invoke-virtual {p0, p1}, Lcom/vk/lists/FooterViewProvider$1;->createFooterErrorView(Landroid/content/Context;)Lcom/vk/lists/AbstractErrorView;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vk/lists/FooterView;->setErrorView(Lcom/vk/lists/AbstractErrorView;)V

    .line 23
    invoke-virtual {p0, p1}, Lcom/vk/lists/FooterViewProvider$1;->createFooterLoadingView(Landroid/content/Context;)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vk/lists/FooterView;->setLoadingView(Landroid/view/View;)V

    .line 24
    return-object v0
.end method

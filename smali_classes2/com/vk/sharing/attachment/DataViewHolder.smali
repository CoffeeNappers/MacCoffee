.class abstract Lcom/vk/sharing/attachment/DataViewHolder;
.super Ljava/lang/Object;
.source "AttachmentViewHolder.java"

# interfaces
.implements Lcom/vk/sharing/attachment/AttachmentViewHolder;


# instance fields
.field private final data:Landroid/os/Bundle;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field


# direct methods
.method constructor <init>(Landroid/os/Bundle;)V
    .locals 0
    .param p1, "data"    # Landroid/os/Bundle;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    .line 51
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 52
    iput-object p1, p0, Lcom/vk/sharing/attachment/DataViewHolder;->data:Landroid/os/Bundle;

    .line 53
    return-void
.end method


# virtual methods
.method public final create(Landroid/content/Context;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 2
    .param p1, "context"    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "parent"    # Landroid/view/ViewGroup;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 63
    invoke-virtual {p0, p1, p2}, Lcom/vk/sharing/attachment/DataViewHolder;->createView(Landroid/content/Context;Landroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v1

    .line 65
    .local v1, "view":Landroid/view/View;
    invoke-virtual {p0}, Lcom/vk/sharing/attachment/DataViewHolder;->getData()Landroid/os/Bundle;

    move-result-object v0

    .line 66
    .local v0, "data":Landroid/os/Bundle;
    if-eqz v0, :cond_0

    .line 67
    invoke-virtual {p0, v0}, Lcom/vk/sharing/attachment/DataViewHolder;->bind(Landroid/os/Bundle;)V

    .line 69
    :cond_0
    return-object v1
.end method

.method abstract createView(Landroid/content/Context;Landroid/view/ViewGroup;)Landroid/view/View;
    .param p1    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/view/ViewGroup;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation
.end method

.method getData()Landroid/os/Bundle;
    .locals 1
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .prologue
    .line 57
    iget-object v0, p0, Lcom/vk/sharing/attachment/DataViewHolder;->data:Landroid/os/Bundle;

    return-object v0
.end method

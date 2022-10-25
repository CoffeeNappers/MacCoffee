.class Lcom/vk/attachpicker/adapter/AlbumPickSpinnerAdapter$Holder;
.super Lcom/vk/attachpicker/widget/ViewHolder;
.source "AlbumPickSpinnerAdapter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vk/attachpicker/adapter/AlbumPickSpinnerAdapter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "Holder"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vk/attachpicker/widget/ViewHolder",
        "<",
        "Lcom/vk/attachpicker/mediastore/AlbumEntry;",
        ">;"
    }
.end annotation


# instance fields
.field private main:Landroid/view/View;

.field private final parent:Landroid/view/ViewGroup;

.field final synthetic this$0:Lcom/vk/attachpicker/adapter/AlbumPickSpinnerAdapter;

.field private title:Landroid/widget/TextView;


# direct methods
.method public constructor <init>(Lcom/vk/attachpicker/adapter/AlbumPickSpinnerAdapter;Landroid/view/ViewGroup;)V
    .locals 0
    .param p2, "parent"    # Landroid/view/ViewGroup;

    .prologue
    .line 104
    iput-object p1, p0, Lcom/vk/attachpicker/adapter/AlbumPickSpinnerAdapter$Holder;->this$0:Lcom/vk/attachpicker/adapter/AlbumPickSpinnerAdapter;

    invoke-direct {p0}, Lcom/vk/attachpicker/widget/ViewHolder;-><init>()V

    .line 105
    iput-object p2, p0, Lcom/vk/attachpicker/adapter/AlbumPickSpinnerAdapter$Holder;->parent:Landroid/view/ViewGroup;

    .line 106
    return-void
.end method


# virtual methods
.method public clear()V
    .locals 0

    .prologue
    .line 126
    return-void
.end method

.method public initialize(Landroid/content/Context;I)Landroid/view/View;
    .locals 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "viewType"    # I

    .prologue
    .line 110
    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    const v1, 0x7f030192

    iget-object v2, p0, Lcom/vk/attachpicker/adapter/AlbumPickSpinnerAdapter$Holder;->parent:Landroid/view/ViewGroup;

    const/4 v3, 0x0

    invoke-virtual {v0, v1, v2, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/vk/attachpicker/adapter/AlbumPickSpinnerAdapter$Holder;->main:Landroid/view/View;

    .line 111
    iget-object v0, p0, Lcom/vk/attachpicker/adapter/AlbumPickSpinnerAdapter$Holder;->main:Landroid/view/View;

    new-instance v1, Landroid/widget/AbsListView$LayoutParams;

    const/4 v2, -0x2

    const/4 v3, -0x1

    invoke-direct {v1, v2, v3}, Landroid/widget/AbsListView$LayoutParams;-><init>(II)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 112
    iget-object v0, p0, Lcom/vk/attachpicker/adapter/AlbumPickSpinnerAdapter$Holder;->main:Landroid/view/View;

    const v1, 0x7f100327

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/vk/attachpicker/adapter/AlbumPickSpinnerAdapter$Holder;->title:Landroid/widget/TextView;

    .line 113
    iget-object v0, p0, Lcom/vk/attachpicker/adapter/AlbumPickSpinnerAdapter$Holder;->main:Landroid/view/View;

    return-object v0
.end method

.method public update(Landroid/content/Context;IILcom/vk/attachpicker/mediastore/AlbumEntry;)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "position"    # I
    .param p3, "viewType"    # I
    .param p4, "data"    # Lcom/vk/attachpicker/mediastore/AlbumEntry;

    .prologue
    .line 118
    if-eqz p4, :cond_0

    .line 119
    iget-object v0, p0, Lcom/vk/attachpicker/adapter/AlbumPickSpinnerAdapter$Holder;->title:Landroid/widget/TextView;

    invoke-virtual {p4}, Lcom/vk/attachpicker/mediastore/AlbumEntry;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 121
    :cond_0
    return-void
.end method

.method public bridge synthetic update(Landroid/content/Context;IILjava/lang/Object;)V
    .locals 0

    .prologue
    .line 97
    check-cast p4, Lcom/vk/attachpicker/mediastore/AlbumEntry;

    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/vk/attachpicker/adapter/AlbumPickSpinnerAdapter$Holder;->update(Landroid/content/Context;IILcom/vk/attachpicker/mediastore/AlbumEntry;)V

    return-void
.end method

.class Lcom/vk/music/fragment/menu/ActionsBottomSheet$ArgsBuilder;
.super Ljava/lang/Object;
.source "ActionsBottomSheet.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vk/music/fragment/menu/ActionsBottomSheet;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "ArgsBuilder"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<Header::",
        "Landroid/os/Parcelable;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# instance fields
.field final actions:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vk/music/fragment/menu/Action;",
            ">;"
        }
    .end annotation
.end field

.field callback:Lcom/vk/music/fragment/menu/ActionsBottomSheet$Callback;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vk/music/fragment/menu/ActionsBottomSheet$Callback",
            "<THeader;>;"
        }
    .end annotation
.end field

.field final extActions:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vk/music/fragment/menu/Action;",
            ">;"
        }
    .end annotation
.end field

.field header:Landroid/os/Parcelable;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "THeader;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Landroid/os/Parcelable;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(THeader;)V"
        }
    .end annotation

    .prologue
    .line 52
    .local p0, "this":Lcom/vk/music/fragment/menu/ActionsBottomSheet$ArgsBuilder;, "Lcom/vk/music/fragment/menu/ActionsBottomSheet$ArgsBuilder<THeader;>;"
    .local p1, "header":Landroid/os/Parcelable;, "THeader;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 49
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/vk/music/fragment/menu/ActionsBottomSheet$ArgsBuilder;->actions:Ljava/util/ArrayList;

    .line 50
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/vk/music/fragment/menu/ActionsBottomSheet$ArgsBuilder;->extActions:Ljava/util/ArrayList;

    .line 53
    iput-object p1, p0, Lcom/vk/music/fragment/menu/ActionsBottomSheet$ArgsBuilder;->header:Landroid/os/Parcelable;

    .line 54
    return-void
.end method


# virtual methods
.method addAction(III)V
    .locals 3
    .param p1, "id"    # I
    .param p2, "iconRes"    # I
        .annotation build Landroid/support/annotation/DrawableRes;
        .end annotation
    .end param
    .param p3, "labelRes"    # I
        .annotation build Landroid/support/annotation/StringRes;
        .end annotation
    .end param

    .prologue
    .line 61
    .local p0, "this":Lcom/vk/music/fragment/menu/ActionsBottomSheet$ArgsBuilder;, "Lcom/vk/music/fragment/menu/ActionsBottomSheet$ArgsBuilder<THeader;>;"
    iget-object v0, p0, Lcom/vk/music/fragment/menu/ActionsBottomSheet$ArgsBuilder;->actions:Ljava/util/ArrayList;

    const/4 v1, 0x0

    new-instance v2, Lcom/vk/music/fragment/menu/Action;

    invoke-direct {v2, p1, p2, p3}, Lcom/vk/music/fragment/menu/Action;-><init>(III)V

    invoke-virtual {v0, v1, v2}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    .line 62
    return-void
.end method

.method addExtAction(II)V
    .locals 2
    .param p1, "id"    # I
    .param p2, "iconRes"    # I
        .annotation build Landroid/support/annotation/DrawableRes;
        .end annotation
    .end param

    .prologue
    .line 65
    .local p0, "this":Lcom/vk/music/fragment/menu/ActionsBottomSheet$ArgsBuilder;, "Lcom/vk/music/fragment/menu/ActionsBottomSheet$ArgsBuilder<THeader;>;"
    iget-object v0, p0, Lcom/vk/music/fragment/menu/ActionsBottomSheet$ArgsBuilder;->extActions:Ljava/util/ArrayList;

    new-instance v1, Lcom/vk/music/fragment/menu/Action;

    invoke-direct {v1, p1, p2}, Lcom/vk/music/fragment/menu/Action;-><init>(II)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 66
    return-void
.end method

.method protected build()Landroid/os/Bundle;
    .locals 3
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 70
    .local p0, "this":Lcom/vk/music/fragment/menu/ActionsBottomSheet$ArgsBuilder;, "Lcom/vk/music/fragment/menu/ActionsBottomSheet$ArgsBuilder<THeader;>;"
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 71
    .local v0, "args":Landroid/os/Bundle;
    const-string/jumbo v1, "header"

    iget-object v2, p0, Lcom/vk/music/fragment/menu/ActionsBottomSheet$ArgsBuilder;->header:Landroid/os/Parcelable;

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 72
    const-string/jumbo v1, "actions"

    iget-object v2, p0, Lcom/vk/music/fragment/menu/ActionsBottomSheet$ArgsBuilder;->actions:Ljava/util/ArrayList;

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putParcelableArrayList(Ljava/lang/String;Ljava/util/ArrayList;)V

    .line 73
    const-string/jumbo v1, "extActions"

    iget-object v2, p0, Lcom/vk/music/fragment/menu/ActionsBottomSheet$ArgsBuilder;->extActions:Ljava/util/ArrayList;

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putParcelableArrayList(Ljava/lang/String;Ljava/util/ArrayList;)V

    .line 74
    return-object v0
.end method

.method public callback(Lcom/vk/music/fragment/menu/ActionsBottomSheet$Callback;)V
    .locals 0
    .param p1    # Lcom/vk/music/fragment/menu/ActionsBottomSheet$Callback;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/vk/music/fragment/menu/ActionsBottomSheet$Callback",
            "<THeader;>;)V"
        }
    .end annotation

    .prologue
    .line 57
    .local p0, "this":Lcom/vk/music/fragment/menu/ActionsBottomSheet$ArgsBuilder;, "Lcom/vk/music/fragment/menu/ActionsBottomSheet$ArgsBuilder<THeader;>;"
    .local p1, "val":Lcom/vk/music/fragment/menu/ActionsBottomSheet$Callback;, "Lcom/vk/music/fragment/menu/ActionsBottomSheet$Callback<THeader;>;"
    iput-object p1, p0, Lcom/vk/music/fragment/menu/ActionsBottomSheet$ArgsBuilder;->callback:Lcom/vk/music/fragment/menu/ActionsBottomSheet$Callback;

    .line 58
    return-void
.end method

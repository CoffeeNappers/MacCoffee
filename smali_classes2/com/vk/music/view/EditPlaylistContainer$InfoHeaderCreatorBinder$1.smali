.class Lcom/vk/music/view/EditPlaylistContainer$InfoHeaderCreatorBinder$1;
.super Ljava/lang/Object;
.source "EditPlaylistContainer.java"

# interfaces
.implements Landroid/text/TextWatcher;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vk/music/view/EditPlaylistContainer$InfoHeaderCreatorBinder;->f(Landroid/view/ViewGroup;)Landroid/view/View;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/vk/music/view/EditPlaylistContainer$InfoHeaderCreatorBinder;


# direct methods
.method constructor <init>(Lcom/vk/music/view/EditPlaylistContainer$InfoHeaderCreatorBinder;)V
    .locals 0
    .param p1, "this$1"    # Lcom/vk/music/view/EditPlaylistContainer$InfoHeaderCreatorBinder;

    .prologue
    .line 103
    iput-object p1, p0, Lcom/vk/music/view/EditPlaylistContainer$InfoHeaderCreatorBinder$1;->this$1:Lcom/vk/music/view/EditPlaylistContainer$InfoHeaderCreatorBinder;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public afterTextChanged(Landroid/text/Editable;)V
    .locals 2
    .param p1, "s"    # Landroid/text/Editable;

    .prologue
    .line 114
    iget-object v0, p0, Lcom/vk/music/view/EditPlaylistContainer$InfoHeaderCreatorBinder$1;->this$1:Lcom/vk/music/view/EditPlaylistContainer$InfoHeaderCreatorBinder;

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/vk/music/view/EditPlaylistContainer$InfoHeaderCreatorBinder;->currentTitle:Ljava/lang/String;

    .line 115
    iget-object v0, p0, Lcom/vk/music/view/EditPlaylistContainer$InfoHeaderCreatorBinder$1;->this$1:Lcom/vk/music/view/EditPlaylistContainer$InfoHeaderCreatorBinder;

    invoke-static {v0}, Lcom/vk/music/view/EditPlaylistContainer$InfoHeaderCreatorBinder;->access$000(Lcom/vk/music/view/EditPlaylistContainer$InfoHeaderCreatorBinder;)V

    .line 116
    return-void
.end method

.method public beforeTextChanged(Ljava/lang/CharSequence;III)V
    .locals 0
    .param p1, "s"    # Ljava/lang/CharSequence;
    .param p2, "start"    # I
    .param p3, "count"    # I
    .param p4, "after"    # I

    .prologue
    .line 106
    return-void
.end method

.method public onTextChanged(Ljava/lang/CharSequence;III)V
    .locals 0
    .param p1, "s"    # Ljava/lang/CharSequence;
    .param p2, "start"    # I
    .param p3, "before"    # I
    .param p4, "count"    # I

    .prologue
    .line 110
    return-void
.end method

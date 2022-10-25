.class Lcom/vk/music/attach/controller/PlaylistsController$1;
.super Ljava/lang/Object;
.source "PlaylistsController.java"

# interfaces
.implements Landroid/text/TextWatcher;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vk/music/attach/controller/PlaylistsController;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vk/music/attach/controller/PlaylistsController;


# direct methods
.method constructor <init>(Lcom/vk/music/attach/controller/PlaylistsController;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vk/music/attach/controller/PlaylistsController;

    .prologue
    .line 49
    iput-object p1, p0, Lcom/vk/music/attach/controller/PlaylistsController$1;->this$0:Lcom/vk/music/attach/controller/PlaylistsController;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public afterTextChanged(Landroid/text/Editable;)V
    .locals 2
    .param p1, "s"    # Landroid/text/Editable;

    .prologue
    .line 58
    invoke-static {p1}, Landroid/text/TextUtils;->isGraphic(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 59
    iget-object v0, p0, Lcom/vk/music/attach/controller/PlaylistsController$1;->this$0:Lcom/vk/music/attach/controller/PlaylistsController;

    const-class v1, Lcom/vk/music/attach/controller/PlaylistsSearchController;

    invoke-virtual {v0, v1}, Lcom/vk/music/attach/controller/PlaylistsController;->moveNext(Ljava/lang/Class;)V

    .line 61
    :cond_0
    return-void
.end method

.method public beforeTextChanged(Ljava/lang/CharSequence;III)V
    .locals 0
    .param p1, "s"    # Ljava/lang/CharSequence;
    .param p2, "start"    # I
    .param p3, "count"    # I
    .param p4, "after"    # I

    .prologue
    .line 51
    return-void
.end method

.method public onTextChanged(Ljava/lang/CharSequence;III)V
    .locals 0
    .param p1, "s"    # Ljava/lang/CharSequence;
    .param p2, "start"    # I
    .param p3, "before"    # I
    .param p4, "count"    # I

    .prologue
    .line 54
    return-void
.end method

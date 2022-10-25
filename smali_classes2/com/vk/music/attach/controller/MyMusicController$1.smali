.class Lcom/vk/music/attach/controller/MyMusicController$1;
.super Ljava/lang/Object;
.source "MyMusicController.java"

# interfaces
.implements Landroid/text/TextWatcher;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vk/music/attach/controller/MyMusicController;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vk/music/attach/controller/MyMusicController;


# direct methods
.method constructor <init>(Lcom/vk/music/attach/controller/MyMusicController;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vk/music/attach/controller/MyMusicController;

    .prologue
    .line 50
    iput-object p1, p0, Lcom/vk/music/attach/controller/MyMusicController$1;->this$0:Lcom/vk/music/attach/controller/MyMusicController;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public afterTextChanged(Landroid/text/Editable;)V
    .locals 2
    .param p1, "s"    # Landroid/text/Editable;

    .prologue
    .line 59
    invoke-static {p1}, Landroid/text/TextUtils;->isGraphic(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 60
    iget-object v0, p0, Lcom/vk/music/attach/controller/MyMusicController$1;->this$0:Lcom/vk/music/attach/controller/MyMusicController;

    const-class v1, Lcom/vk/music/attach/controller/MyMusicSearchController;

    invoke-virtual {v0, v1}, Lcom/vk/music/attach/controller/MyMusicController;->moveNext(Ljava/lang/Class;)V

    .line 62
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
    .line 52
    return-void
.end method

.method public onTextChanged(Ljava/lang/CharSequence;III)V
    .locals 0
    .param p1, "s"    # Ljava/lang/CharSequence;
    .param p2, "start"    # I
    .param p3, "before"    # I
    .param p4, "count"    # I

    .prologue
    .line 55
    return-void
.end method

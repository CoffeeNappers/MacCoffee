.class Lcom/vk/sharing/view/SharingView$1;
.super Ljava/lang/Object;
.source "SharingView.java"

# interfaces
.implements Landroid/text/TextWatcher;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vk/sharing/view/SharingView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vk/sharing/view/SharingView;


# direct methods
.method constructor <init>(Lcom/vk/sharing/view/SharingView;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vk/sharing/view/SharingView;

    .prologue
    .line 261
    iput-object p1, p0, Lcom/vk/sharing/view/SharingView$1;->this$0:Lcom/vk/sharing/view/SharingView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public afterTextChanged(Landroid/text/Editable;)V
    .locals 0
    .param p1, "s"    # Landroid/text/Editable;

    .prologue
    .line 266
    return-void
.end method

.method public beforeTextChanged(Ljava/lang/CharSequence;III)V
    .locals 0
    .param p1, "s"    # Ljava/lang/CharSequence;
    .param p2, "start"    # I
    .param p3, "count"    # I
    .param p4, "after"    # I

    .prologue
    .line 263
    return-void
.end method

.method public onTextChanged(Ljava/lang/CharSequence;III)V
    .locals 2
    .param p1, "s"    # Ljava/lang/CharSequence;
    .param p2, "start"    # I
    .param p3, "before"    # I
    .param p4, "count"    # I

    .prologue
    .line 270
    iget-object v0, p0, Lcom/vk/sharing/view/SharingView$1;->this$0:Lcom/vk/sharing/view/SharingView;

    iget-object v0, v0, Lcom/vk/sharing/view/SharingView;->presenter:Lcom/vk/sharing/view/SharingView$Presenter;

    if-eqz v0, :cond_0

    .line 271
    iget-object v0, p0, Lcom/vk/sharing/view/SharingView$1;->this$0:Lcom/vk/sharing/view/SharingView;

    iget-object v0, v0, Lcom/vk/sharing/view/SharingView;->presenter:Lcom/vk/sharing/view/SharingView$Presenter;

    invoke-interface {p1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/vk/sharing/view/SharingView$Presenter;->onSearchInputChanged(Ljava/lang/String;)V

    .line 273
    :cond_0
    return-void
.end method
